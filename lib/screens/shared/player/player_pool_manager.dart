import 'dart:async';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';

class PlayerWrapper {
  final Player player;
  final String id;
  final int windowId;
  final bool isHighQualityReserved;

  bool isBusy = false;
  bool isCorrupted = false;
  bool isCacheHit = false;
  DateTime lastUsed = DateTime.now();
  String? lastMediaUrl;

  final List<StreamSubscription> _activeSubscriptions = [];
  bool Function(MediaStatus, MediaStatus)? _uiStatusCallback;

  PlayerWrapper(
    this.player,
    this.id,
    this.windowId, {
    this.isHighQualityReserved = false,
  }) {
    attachMediaStatusListener();
  }

  void attachMediaStatusListener() {
    player.onMediaStatus((pre, cur) {
      if (isBusy) {
        lastUsed = DateTime.now();
      }
      if (!isCorrupted && cur.test(MediaStatus.invalid)) {
        Logger.warn('Player Pool [$windowId]: Player $id detected invalid media status! Marking as corrupted.');
        isCorrupted = true;
      }
      if (_uiStatusCallback != null) {
        return _uiStatusCallback!(pre, cur);
      }
      return true;
    });
  }

  void setUiStatusCallback(bool Function(MediaStatus oldValue, MediaStatus newValue)? callback) {
    _uiStatusCallback = callback;
  }

  void listenToStatus(void Function(bool) callback) {
    // We will expose necessary streams or have a generic subscription method
  }

  void addSubscription(StreamSubscription sub) {
    _activeSubscriptions.add(sub);
  }

  void sanitize() {
    Logger.log('Player Pool [$windowId]: Sanitizing player $id (Warm pool)');
    player.onMediaStatus(null); // Clear MDK callback to prevent memory leak
    player.state = PlaybackState.paused; // Warm pause instead of stopped, keep context for fast switch
    _uiStatusCallback = null;

    for (final sub in _activeSubscriptions) {
      sub.cancel();
    }
    _activeSubscriptions.clear();
  }
}

class PlayerPoolManager {
  static final PlayerPoolManager instance = PlayerPoolManager._();
  PlayerPoolManager._();

  int? _currentWindowId;

  // Split pools for O(1) and logical clarity
  final List<PlayerWrapper> _idleHqPlayers = [];
  final List<PlayerWrapper> _idleNormalPlayers = [];
  
  // O(1) Cache Lookup mapping MediaURL -> List of idle players
  final Map<String, List<PlayerWrapper>> _idleUrlCache = {};
  
  final Set<PlayerWrapper> _busyPlayers = {};
  final Set<PlayerWrapper> _quarantinedPlayers = {};
  int _idCounter = 0;

  int _minPoolSize = 36;

  /// Adapts pool floor based on actual camera count.
  /// Formula: min(36, cameraCount) + 1
  /// The +1 provides a small headroom for transient operations (e.g. HQ detail switch).
  void updateMinPoolSize(int cameraCount) {
    final newSize = (cameraCount < 36 ? cameraCount : 36) + 1;
    if (newSize != _minPoolSize) {
      Logger.log('Player Pool: Adaptive minPoolSize updated from $_minPoolSize to $newSize (cameras: $cameraCount)');
      _minPoolSize = newSize;
    }
  }
  final int maxPoolSize = 100;
  final int minHqPoolSize = 2;
  Timer? _cleanupTimer;

  void startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(const Duration(minutes: 2), (_) {
      _lazyCleanup();
    });
  }

  void disposePool() {
    _cleanupTimer?.cancel();
    for (var p in _idleHqPlayers) p.player.dispose();
    _idleHqPlayers.clear();

    for (var p in _idleNormalPlayers) p.player.dispose();
    _idleNormalPlayers.clear();
    
    _idleUrlCache.clear();

    for (var p in _busyPlayers) p.player.dispose();
    _busyPlayers.clear();

    for (var p in _quarantinedPlayers) p.player.dispose();
    _quarantinedPlayers.clear();
  }

  Future<void> initializePool(int windowId) async {
    if (_currentWindowId != null && _currentWindowId == windowId) return;
    _currentWindowId = windowId;

    Logger.log('Player Pool [$windowId]: Elastic pool bounds initialized. Players will be created on-demand.');

    startCleanupTimer();
  }

  Future<PlayerWrapper> acquire(
    int windowId, {
    bool isHighQuality = false,
    String? mediaUrl,
    String? cameraName,
  }) async {
    if (_currentWindowId != windowId || (_idleHqPlayers.isEmpty && _idleNormalPlayers.isEmpty && _busyPlayers.isEmpty)) {
      await initializePool(windowId);
    }

    PlayerWrapper? player;

    // 1. O(1) Lookup: Check exact Cache Hit
    if (mediaUrl != null && _idleUrlCache.containsKey(mediaUrl) && _idleUrlCache[mediaUrl]!.isNotEmpty) {
      int idx = _idleUrlCache[mediaUrl]!.indexWhere((p) => p.isHighQualityReserved == isHighQuality);
      if (idx != -1) {
        player = _idleUrlCache[mediaUrl]!.removeAt(idx);
      } else {
        player = _idleUrlCache[mediaUrl]!.removeLast(); // Better than nothing if type mis-match
      }
      
      if (player.isHighQualityReserved) {
        _idleHqPlayers.remove(player);
      } else {
        _idleNormalPlayers.remove(player);
      }
      
      if (_idleUrlCache[mediaUrl]!.isEmpty) {
        _idleUrlCache.remove(mediaUrl);
      }
    }

    // 2. Fetch from specific pool if no hit — prefer "clean" players (no cached URL)
    //    to avoid polluting the cache of players warm for other streams
    if (player == null) {
      final targetPool = isHighQuality
          ? (_idleHqPlayers.isNotEmpty ? _idleHqPlayers : _idleNormalPlayers)
          : (_idleNormalPlayers.isNotEmpty ? _idleNormalPlayers : _idleHqPlayers);

      if (targetPool.isNotEmpty) {
        // Prefer a player with no cached URL (clean) to avoid cache pollution
        final cleanIdx = targetPool.lastIndexWhere((p) => p.lastMediaUrl == null);
        if (cleanIdx != -1) {
          player = targetPool.removeAt(cleanIdx);
        } else {
          // All players have cached URLs → prefer creating a new player
          // over stealing a cached one (preserves cache hits for other cameras).
          // Only steal if we've hit maxPoolSize and can't create more.
          int totalPlayers = _idleHqPlayers.length + _idleNormalPlayers.length + _busyPlayers.length + _quarantinedPlayers.length;
          if (totalPlayers >= maxPoolSize) {
            // Hard limit reached — must steal oldest cached player
            player = targetPool.removeAt(0);
            if (player.lastMediaUrl != null) {
              _idleUrlCache[player.lastMediaUrl]?.remove(player);
              if (_idleUrlCache[player.lastMediaUrl]?.isEmpty ?? false) {
                _idleUrlCache.remove(player.lastMediaUrl);
              }
            }
          }
          // else: fall through to step 3 → _createNewPlayer()
        }
      }
    }

    // 3. Create if still null
    player ??= _createNewPlayer(windowId, isHighQualityReserved: isHighQuality);

    player.attachMediaStatusListener(); // Re-attach MDK listening previously cleared in sanitize
    player.isBusy = true;
    player.lastUsed = DateTime.now();

    // 4. Safely evaluate cache hit logic and apply URL
    bool cacheHit = player.lastMediaUrl == mediaUrl && mediaUrl != null;
    player.isCacheHit = cacheHit;
    player.lastMediaUrl = mediaUrl; // Bug #1 Fixed: Force apply URL even if null
    
    _busyPlayers.add(player);
    Logger.log(
      'Player Pool [$windowId]: Acquired ${isHighQuality ? "HIGH QUALITY" : "normal"} player ${player.id} for "${cameraName ?? 'unknown'}" (Cache Hit: $cacheHit)',
    );
    return player;
  }

  PlayerWrapper _createNewPlayer(int windowId, {bool isHighQualityReserved = false}) {
    int totalPlayers = _idleHqPlayers.length + _idleNormalPlayers.length + _busyPlayers.length + _quarantinedPlayers.length;
    if (totalPlayers >= maxPoolSize) {
      Logger.error(
        'Player Pool [$windowId]: Max pool size ($maxPoolSize) reached! Cannot create more players.',
      );
      throw Exception('MAX_POOL_SIZE_REACHED');
    }

    final String prefix = isHighQualityReserved ? 'hw' : 'pw';
    final wrapper = PlayerWrapper(
      Player(), 
      '${prefix}_${_idCounter++}', 
      windowId,
      isHighQualityReserved: isHighQualityReserved,
    );
    Logger.log(
      'Player Pool [$windowId]: Scaling UP -> creating new player ${wrapper.id}. Total: ${totalPlayers + 1}',
    );
    return wrapper;
  }

  void release(PlayerWrapper wrapper) {
    Logger.log(
      'Player Pool [${wrapper.windowId}]: Releasing player ${wrapper.id}',
    );
    wrapper.sanitize();
    _busyPlayers.remove(wrapper);

    if (wrapper.isCorrupted) {
      Logger.log(
        'Player Pool [${wrapper.windowId}]: Quarantining corrupted player ${wrapper.id}',
      );
      _quarantinedPlayers.add(wrapper);
      
      // Hủy từ từ để an toàn giao diện UI không bị lỗi Texture, nhưng giữ nó trong quarantine báo limit chuẩn
      Future.delayed(const Duration(seconds: 1), () {
        if (!wrapper.player.isDisposed) {
          wrapper.player.dispose();
        }
        _quarantinedPlayers.remove(wrapper);
      });
    } else {
      wrapper.isBusy = false;
      wrapper.lastUsed = DateTime.now();
      
      if (wrapper.isHighQualityReserved) {
        _idleHqPlayers.add(wrapper);
      } else {
        _idleNormalPlayers.add(wrapper);
      }
      
      if (wrapper.lastMediaUrl != null) {
        // Leak #3 Fixed: Clean reference before adding cache
        _idleUrlCache[wrapper.lastMediaUrl!]?.remove(wrapper);
        _idleUrlCache.putIfAbsent(wrapper.lastMediaUrl!, () => []).add(wrapper);
      }
    }
  }

  void _lazyCleanup() {
    if (_currentWindowId == null) return;
    final now = DateTime.now();

    int targetToRemove = _idleNormalPlayers.length - _minPoolSize;
    if (targetToRemove > 0) {
      _idleNormalPlayers.removeWhere((p) {
        if (targetToRemove <= 0) return false;
        
        if (now.difference(p.lastUsed).inMinutes > 5) {
          Logger.log(
            'Player Pool [$_currentWindowId]: Lazy Cleanup -> disposing player ${p.id}',
          );
          
          if (p.lastMediaUrl != null) {
            _idleUrlCache[p.lastMediaUrl!]?.remove(p);
            if (_idleUrlCache[p.lastMediaUrl!]?.isEmpty ?? false) {
              _idleUrlCache.remove(p.lastMediaUrl);
            }
          }
          
          p.player.dispose();
          targetToRemove--;
          return true;
        }
        return false;
      });
    }

    // Bug #2 Fixed: Add lazy cleanup for HQ players (> 10 mins)
    int targetToRemoveHq = _idleHqPlayers.length - minHqPoolSize;
    if (targetToRemoveHq > 0) {
      _idleHqPlayers.removeWhere((p) {
        if (targetToRemoveHq <= 0) return false;
        
        if (now.difference(p.lastUsed).inMinutes > 10) {
          Logger.log(
            'Player Pool [$_currentWindowId]: Lazy Cleanup -> disposing HQ player ${p.id}',
          );
          
          if (p.lastMediaUrl != null) {
            _idleUrlCache[p.lastMediaUrl!]?.remove(p);
            if (_idleUrlCache[p.lastMediaUrl!]?.isEmpty ?? false) {
              _idleUrlCache.remove(p.lastMediaUrl);
            }
          }
          
          p.player.dispose();
          targetToRemoveHq--;
          return true;
        }
        return false;
      });
    }
  }
}
