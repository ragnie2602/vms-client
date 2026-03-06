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
  DateTime lastUsed = DateTime.now();

  final List<StreamSubscription> _activeSubscriptions = [];
  bool Function(MediaStatus, MediaStatus)? _uiStatusCallback;

  PlayerWrapper(
    this.player,
    this.id,
    this.windowId, {
    this.isHighQualityReserved = false,
  }) {
    // Health check ngầm định của Wrapper
    player.onMediaStatus((pre, cur) {
      if (cur.test(MediaStatus.invalid)) {
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
    player.state = PlaybackState.stopped; // Đóng băng Decoder, giữ tiết kiệm CPU nhưng không clear URL để tái sử dụng
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

  // Single Isolate isolation
  int? _currentWindowId;

  final List<PlayerWrapper> _idlePlayers = [];
  final Set<PlayerWrapper> _busyPlayers = {};
  int _idCounter = 0;

  final int minPoolSize = 2;
  final int maxPoolSize = 100;
  Timer? _cleanupTimer;

  void startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(const Duration(minutes: 2), (_) {
      _lazyCleanup();
    });
  }

  void disposePool() {
    _cleanupTimer?.cancel();
    for (var p in _idlePlayers) {
      p.player.dispose();
    }
    _idlePlayers.clear();
    for (var p in _busyPlayers) {
      p.player.dispose();
    }
    _busyPlayers.clear();
  }

  Future<void> initializePool(int windowId) async {
    if (_currentWindowId != null && _currentWindowId == windowId) return;
    _currentWindowId = windowId;

    if (_idlePlayers.isNotEmpty || _busyPlayers.isNotEmpty) return;

    // High Quality reserved player
    _idlePlayers.add(
      PlayerWrapper(
        Player(),
        'hw_${_idCounter++}',
        windowId,
        isHighQualityReserved: true,
      ),
    );

    // Normal players
    for (int i = 0; i < minPoolSize; i++) {
      _idlePlayers.add(PlayerWrapper(Player(), 'pw_${_idCounter++}', windowId));
    }

    Logger.log(
      'Player Pool [$windowId]: Initialized core pool with ${_idlePlayers.length} players',
    );

    startCleanupTimer();
  }

  Future<PlayerWrapper> acquire(
    int windowId, {
    bool isHighQuality = false,
  }) async {
    if (_currentWindowId != windowId || (_idlePlayers.isEmpty && _busyPlayers.isEmpty)) {
      await initializePool(windowId);
    }

    if (isHighQuality) {
      PlayerWrapper? hqPlayer;
      for (final p in _idlePlayers) {
        if (p.isHighQualityReserved) {
          hqPlayer = p;
          break;
        }
      }

      if (hqPlayer != null) {
        _idlePlayers.remove(hqPlayer);
      } else {
        hqPlayer = _idlePlayers.isNotEmpty ? _idlePlayers.removeLast() : _createNewPlayer(windowId);
      }

      hqPlayer.isBusy = true;
      _busyPlayers.add(hqPlayer);
      Logger.log(
        'Player Pool [$windowId]: Acquired HIGH QUALITY player ${hqPlayer.id}',
      );
      return hqPlayer;
    } else {
      PlayerWrapper? player;
      // Dành sự ưu tiên giữ lại các player High Quality nếu có thể
      for (int i = _idlePlayers.length - 1; i >= 0; i--) {
        if (!_idlePlayers[i].isHighQualityReserved) {
          player = _idlePlayers.removeAt(i);
          break;
        }
      }

      player ??= _idlePlayers.isNotEmpty ? _idlePlayers.removeLast() : _createNewPlayer(windowId);

      player.isBusy = true;
      _busyPlayers.add(player);
      Logger.log(
        'Player Pool [$windowId]: Acquired normal player ${player.id}',
      );
      return player;
    }
  }

  PlayerWrapper _createNewPlayer(int windowId) {
    if ((_idlePlayers.length + _busyPlayers.length) >= maxPoolSize) {
      Logger.error(
        'Player Pool [$windowId]: Max pool size ($maxPoolSize) reached! Cannot create more players.',
      );
      throw Exception('MAX_POOL_SIZE_REACHED');
    }
    final wrapper = PlayerWrapper(Player(), 'pw_${_idCounter++}', windowId);
    Logger.log(
      'Player Pool [$windowId]: Scaling UP -> creating new player ${wrapper.id}. Total: ${_idlePlayers.length + _busyPlayers.length + 1}',
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
      // Hủy từ từ để an toàn giao diện UI không bị lỗi Texture
      Future.delayed(const Duration(seconds: 1), () {
        wrapper.player.dispose();
      });
    } else {
      wrapper.isBusy = false;
      wrapper.lastUsed = DateTime.now();
      _idlePlayers.add(wrapper);
    }
  }

  void _lazyCleanup() {
    if (_currentWindowId == null) return;
    final now = DateTime.now();

    final nonHqPlayers = _idlePlayers.where((p) => !p.isHighQualityReserved).toList();

    while (nonHqPlayers.length > minPoolSize) {
      // Find player to kill: not busy, and not used recently
      final candidate = nonHqPlayers.cast<PlayerWrapper?>().firstWhere(
        (p) =>
            p != null && now.difference(p.lastUsed).inMinutes > 5,
        orElse: () => null,
      );

      if (candidate != null) {
        Logger.log(
          'Player Pool [$_currentWindowId]: Lazy Cleanup -> disposing player ${candidate.id}',
        );
        candidate.player.dispose();
        _idlePlayers.remove(candidate);
        nonHqPlayers.remove(candidate);
      } else {
        break; // No more disposable candidates
      }
    }
  }
}
