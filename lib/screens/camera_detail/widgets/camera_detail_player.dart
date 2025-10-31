import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

import 'player_full_screen.dart';

enum PlayerMode { liveview, playlist }

// error2 <=> error (để trigger được listener khi từ error --> error)
enum _PlayerState { initializing, initialized, empty, error, error2 }

class CameraDetailController {
  GlobalKey<CameraDetailPlayerState> ref = GlobalKey();

  Function(int)? onPlaybackChanged;
  Function(DateTime, [bool])? onTimeChanged;
}

class CameraDetailPlayer extends StatefulWidget {
  const CameraDetailPlayer({
    super.key,
    required this.playlist,
    required this.name,
    required this.mode,
    required this.source,
    this.initialIndex = 0,
    required this.controller,
    this.onStatusChanged,
  });
  final List<PlaybackVideo> playlist;
  final String source;
  final String name;
  final PlayerMode mode;
  final int initialIndex;
  final CameraDetailController controller;
  final Function(PlayerStatus)? onStatusChanged;

  factory CameraDetailPlayer.playlist({
    required List<PlaybackVideo> playlist,
    required String name,
    required int initialIndex,
    required CameraDetailController controller,
    Function(PlayerStatus)? onStatusChanged,
  }) {
    return CameraDetailPlayer(
      playlist: playlist,
      name: name,
      mode: PlayerMode.playlist,
      source: '',
      initialIndex: initialIndex,
      controller: controller,
      key: controller.ref,
      onStatusChanged: onStatusChanged,
    );
  }

  factory CameraDetailPlayer.liveview({
    required String source,
    required String name,
    required CameraDetailController controller,
    Function(PlayerStatus)? onStatusChanged,
  }) {
    return CameraDetailPlayer(
      playlist: [],
      source: source,
      name: name,
      mode: PlayerMode.liveview,
      controller: controller,
      key: controller.ref,
      onStatusChanged: onStatusChanged,
    );
  }

  @override
  State<CameraDetailPlayer> createState() => CameraDetailPlayerState();
}

class CameraDetailPlayerState extends State<CameraDetailPlayer> {
  final GlobalKey<VideoState> _videoKey = GlobalKey();

  late final Player _player;
  late final Player _audioPlayer;
  late final VideoController _controller;

  late String name = widget.name;

  final ValueNotifier<PlayerStatus> _status = ValueNotifier(PlayerStatus.playing);
  final ValueNotifier<_PlayerState> _state = ValueNotifier(_PlayerState.initializing);

  late int _playlistIndex;
  bool _shouldSyncPlayerTime = true;
  Timer? _reconnectingTimer;
  Timer? _lostConnectionTimer;
  Duration _lastDuration = Duration.zero;

  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Playlist>? _playlistSub;
  StreamSubscription<void>? _completedSub;
  StreamSubscription<String>? _errorSub;

  PlaybackVideo get currentPlayback => widget.playlist[_playlistIndex];
  int get initialIndex => widget.initialIndex;

  @override
  void initState() {
    _playlistIndex = widget.initialIndex;

    if (widget.onStatusChanged != null) {
      _status.addListener(() {
        widget.onStatusChanged?.call(_status.value);
      });
    }

    _state.addListener(() => _tryReconnecting(_state.value == _PlayerState.error));

    super.initState();
    _initPlayer();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.mode != PlayerMode.playlist) return;
      widget.controller.onPlaybackChanged?.call(_playlistIndex);
      widget.controller.onTimeChanged?.call(currentPlayback.startTime.roundToSecond);
    });
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    _playlistSub?.cancel();
    _completedSub?.cancel();
    _errorSub?.cancel();
    _reconnectingTimer?.cancel();
    _lostConnectionTimer?.cancel();
    _player.dispose();
    _status.dispose();
    _state.dispose();
    try {
      _audioPlayer.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CameraDetailPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    name = widget.name;
  }

  Future<void> _initPlayer() async {
    _status.value = PlayerStatus.playing;

    // Initialize player
    _player = Player(
      configuration: PlayerConfiguration(
        title: widget.name,
        bufferSize: widget.mode == PlayerMode.liveview ? 1 : 15 * 1024 * 1024,
      ),
    );
    if (widget.mode == PlayerMode.liveview) {
      _audioPlayer = Player(configuration: PlayerConfiguration(bufferSize: 1));
    }
    _controller = VideoController(_player);

    // Open player
    await _onOpenPlayer();

    _positionSub = _player.stream.position.listen(_onPositionChanged);
    _playlistSub = _player.stream.playlist.listen(_onPlaylistChanged);
    _completedSub = _player.stream.completed.listen(_onCompleted);
    _errorSub = _player.stream.error.listen(_onError);

    _player.stream.playing.listen((playing) {
      if (!playing) return;

      // Đang dừng --> seeking --> tự play --> update status theo player
      if (_status.value != PlayerStatus.playing) _status.value = PlayerStatus.playing;

      // Lỗi --> stop --> position = 0
      // case đang show lỗi - hiển thị màn đen --> vài s sau lại hiển thị lỗi -- <lặp lại>
      if (_player.state.position != Duration.zero && _state.value == _PlayerState.error) {
        _state.value = _PlayerState.initialized;
      }
    });
  }

  Future<void> _onOpenPlayer({Duration? position, bool showLoading = true}) async {
    _state.value = showLoading ? _PlayerState.initializing : _PlayerState.error2;

    if (widget.mode == PlayerMode.playlist) {
      await _player.open(
        Playlist(widget.playlist.map((e) => Media(e.urlPlayback)).toList(), index: _playlistIndex),
      );

      await _player.setPlaylistMode(PlaylistMode.none);
      if (position != null) await _waitForBufferingAndSeek(position, timeout: 30);
    } else {
      await _player.open(Media(widget.source));
      await _player.setAudioTrack(AudioTrack.no());
      await _audioPlayer.open(Media(widget.source));
      await _audioPlayer.setVideoTrack(VideoTrack.no());
    }

    try {
      final size = await Future.wait([
        _player.stream.width.firstWhere((width) => width != null),
        _player.stream.height.firstWhere((height) => height != null),
      ]).timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT, onTimeout: () => [null, null]);

      if (size[0] != null && size[1] != null) {
        _state.value = _PlayerState.initialized;
      } else {
        _state.value = _PlayerState.error;
      }
    } catch (e) {
      // Case stream bị dispose bên thư viện (đổi cam ...) --> Error "Bad state: No element"
      if (mounted) _state.value = _PlayerState.error;
    }
  }

  void _onError(String error) {
    _state.value = _PlayerState.error;
    _player.stop();
    Logger.error(error);
  }

  void _onCompleted(bool completed) {
    if (completed && _playlistIndex == widget.playlist.length - 1) {
      _status.value = PlayerStatus.finished;
    }
  }

  void _onPositionChanged(Duration position) {
    if (widget.mode == PlayerMode.liveview) {
      _audioPlayer.seek(position);
    }

    if (_state.value != _PlayerState.error) {
      if (_lastDuration != position && widget.mode == PlayerMode.liveview) {
        _debounceConnectionLost();
      }
      _lastDuration = position;
    }

    if (_shouldSyncPlayerTime == true && widget.mode == PlayerMode.playlist) {
      widget.controller.onTimeChanged?.call(currentPlayback.startTime.add(position).roundToSecond);
    }
  }

  void _onPlaylistChanged(Playlist playlist) {
    // Delay một chút do nhiều lúc stop không kịp nên index bị nhảy lên 1
    Future.delayed(Durations.short3, () {
      if (_state.value == _PlayerState.error) return;

      _playlistIndex = playlist.index;
      widget.controller.onPlaybackChanged?.call(_playlistIndex);
    });
  }

  void _tryReconnecting(bool isError) {
    if (!isError) return _reconnectingTimer?.cancel();

    _reconnectingTimer?.cancel();
    _reconnectingTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (!mounted) return timer.cancel();

      _reconnectingTimer?.cancel();
      await _onOpenPlayer(position: _lastDuration, showLoading: false);
    });
  }

  void _debounceConnectionLost() {
    _lostConnectionTimer?.cancel();
    _lostConnectionTimer = Timer(AppConfig.PLAYER_DISCONNECTION_THRESHOLD, () {
      // Dừng hoặc hết video
      if (!mounted ||
          widget.mode != PlayerMode.liveview ||
          _status.value == PlayerStatus.finished ||
          _status.value == PlayerStatus.paused ||
          _state.value == _PlayerState.error) {
        return;
      }

      Logger.warn("Liveview '${widget.name}' disconnected");
      _onError("Liveview '${widget.name}' disconnected");
    });
  }

  Future<void> jumpToDate(DateTime date, {int? dateIndex}) async {
    _shouldSyncPlayerTime = false;
    // Set timeline trước tránh cảm giác delay
    widget.controller.onTimeChanged?.call(date.roundToSecond, dateIndex != null);

    final index = dateIndex ?? widget.playlist.atTime(date);

    // Click ngoài khoảng playback
    if (index == null) {
      _state.value = _PlayerState.empty;
      await _player.pause();
      return;
    }

    if (_state.value == _PlayerState.empty) {
      _state.value = _PlayerState.initialized;
      // đổi initialized trước play do có thể bị đổi từ error --> initialized
      await _player.play();
    }

    final diff = date.difference(widget.playlist[index].startTime);

    // Trong khoảng hiện tại --> seek
    if (index == _playlistIndex) {
      if (diff != Duration.zero) await _player.seek(diff);
    }
    // Playback khác --> đổi playlist và jump
    else {
      // Gán local biến luôn để khi reconnecting tới đúng index đó
      _playlistIndex = index;
      _lastDuration = diff;

      await _player.jump(index);
      await _waitForBufferingAndSeek(diff);
    }

    _shouldSyncPlayerTime = true;
  }

  Future<void> _waitForBufferingAndSeek(Duration diff, {int timeout = 60}) async {
    if (diff != Duration.zero && _state.value != _PlayerState.error) {
      try {
        // Đợi tới khi buffering xong (đã chuyển playback) --> Không bị delay
        await _player.stream.buffering
            .firstWhere((buffering) => buffering == false)
            .timeout(Duration(seconds: timeout));

        // Seek tới điểm click
        await _player.seek(diff);
      } catch (_) {
        Logger.error(
          "Timeout khi buffering --> skip seeking to ${currentPlayback.startTime.add(diff)}",
          writeLog: true,
        );
      }
    }
  }

  Future<void> snapshot() async {
    final data = await _player.screenshot();

    if (data != null) {
      await FileUtil.saveImageToSelectedLocation(data);
    }
  }

  Future<void> seek(Duration duration) async {
    final _duration = _player.state.position + duration;

    // Đầu playlist
    if (_duration <= Duration.zero && _playlistIndex == 0) {
      await _player.seek(Duration.zero);
      return;
    }
    // Cuối playlist
    if (_duration >= _player.state.duration && _playlistIndex == widget.playlist.length - 1) {
      await _player.seek(_player.state.duration);
      return;
    }

    // Tua sang playback tiếp theo
    if (_duration <= _player.state.duration && _duration >= Duration.zero) {
      await _player.seek(_duration);
    } else {
      await jumpToDate(currentPlayback.startTime.add(_duration));
    }
  }

  Future<void> changeVolume(double volume) async {
    if (widget.mode == PlayerMode.liveview) {
      await _audioPlayer.setVolume(volume);
    } else {
      await _player.setVolume(volume);
    }
  }

  Future<void> togglePlay() async {
    _shouldSyncPlayerTime = false;
    if (_status.value == PlayerStatus.playing) {
      await _player.pause();
      if (widget.mode == PlayerMode.liveview) await _audioPlayer.pause();
      _status.value = PlayerStatus.paused;
    } else {
      await _player.play();
      if (widget.mode == PlayerMode.liveview) await _audioPlayer.play();
      _status.value = PlayerStatus.playing;
    }
    _shouldSyncPlayerTime = true;
  }

  Future<void> changeSpeed(double speed) async {
    if (widget.mode == PlayerMode.liveview) await _audioPlayer.setRate(speed);
    await _player.setRate(speed);
  }

  void toggleFullscreen() {
    _videoKey.currentState?.enterFullscreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: ValueListenableBuilder(
        valueListenable: _state,
        builder: (context, value, child) {
          return switch (value) {
            _PlayerState.initializing => const Center(child: CircularProgressIndicator.adaptive()),
            _PlayerState.empty => _buildNoPlayback(),
            _PlayerState.error || _PlayerState.error2 => _buildError(),
            _PlayerState.initialized => Video(
              key: _videoKey,
              height: double.infinity,
              fit: BoxFit.fitHeight,
              controller: _controller,
              controls: (state) => Stack(
                fit: StackFit.expand,
                children: [
                  if (_videoKey.currentState?.isFullscreen() == false)
                    Positioned(top: 20, right: 20, child: _buildLabel()),

                  Positioned.fill(child: _buildPlaybackStatus()),

                  if (_videoKey.currentState?.isFullscreen() == true)
                    PlayerFullScreen(onExit: () => _videoKey.currentState?.exitFullscreen()),
                ],
              ),
              subtitleViewConfiguration: SubtitleViewConfiguration(visible: false),
            ),
          };
        },
      ),
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 14),
        Icon(
          widget.mode == PlayerMode.liveview ? Icons.videocam_off : Icons.error,
          color: Colors.red,
          size: 36,
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            widget.mode == PlayerMode.liveview
                ? 'Camera ${widget.name} đang ngoại tuyến'
                : 'Có lỗi xảy ra trong quá trình tải bản ghi',
            style: AppTypography.style(13, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildPlaybackStatus() {
    return ValueListenableBuilder(
      valueListenable: _status,
      builder: (context, status, child) {
        if (status == PlayerStatus.playing) return const SizedBox.shrink();

        return InkWell(
          onTap: togglePlay,
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withValues(alpha: 0.25),
            child: SvgPicture.asset(
              AppAssets.icPlay,
              width: 60,
              height: 60,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoPlayback() {
    return Center(
      child: Text(
        'Không có dữ liệu bản ghi',
        style: AppTypography.style(13, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildLabel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(3),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.white.withValues(alpha: 0.6))],
      ),
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.icVideoOn, width: 20, height: 20),
          SizedBox(width: 4),
          Text(
            name,
            style: AppTypography.style(11, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
