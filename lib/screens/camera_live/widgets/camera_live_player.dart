import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

import 'player_full_screen.dart';

enum PlayerMode { liveview, playlist }

class CameraLiveController {
  GlobalKey<CameraLivePlayerState> ref = GlobalKey();

  Function(int)? onPlaybackChanged;
  Function(DateTime)? onTimeChanged;
}

class CameraLivePlayer extends StatefulWidget {
  const CameraLivePlayer({
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
  final CameraLiveController controller;
  final Function(PlayerStatus)? onStatusChanged;

  factory CameraLivePlayer.playlist({
    required List<PlaybackVideo> playlist,
    required String name,
    required int initialIndex,
    required CameraLiveController controller,
    Function(PlayerStatus)? onStatusChanged,
  }) {
    return CameraLivePlayer(
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

  factory CameraLivePlayer.liveview({
    required String source,
    required String name,
    required CameraLiveController controller,
    Function(PlayerStatus)? onStatusChanged,
  }) {
    return CameraLivePlayer(
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
  State<CameraLivePlayer> createState() => CameraLivePlayerState();
}

class CameraLivePlayerState extends State<CameraLivePlayer> {
  final GlobalKey<VideoState> _videoKey = GlobalKey();

  late final Player _player;
  late final Player _audioPlayer;
  late final VideoController _controller;

  late String name = widget.name;
  final ValueNotifier<PlayerStatus> _status = ValueNotifier(PlayerStatus.playing);

  late int _playlistIndex;
  bool _shouldSyncPlayerTime = true;
  bool showingNoPlayback = false;

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
    _player.dispose();
    _status.dispose();
    try {
      _audioPlayer.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CameraLivePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    name = widget.name;
  }

  Future<void> _initPlayer() async {
    _status.value = PlayerStatus.playing;
    _player = Player(
      configuration: PlayerConfiguration(
        title: widget.name,
        bufferSize: widget.mode == PlayerMode.liveview ? 1 : 32 * 1024 * 1024,
      ),
    );
    _controller = VideoController(_player);

    if (widget.mode == PlayerMode.liveview) {
      // Luồng video -- tắt âm thanh
      _player.open(Media(widget.source));
      await _player.setAudioTrack(AudioTrack.no());

      // Luồng âm thanh -- tắt hình
      _audioPlayer = Player(configuration: PlayerConfiguration(bufferSize: 1));
      _audioPlayer.open(Media(widget.source));
      await _audioPlayer.setVideoTrack(VideoTrack.no());
    } else {
      _player.open(
        Playlist(widget.playlist.map((e) => Media(e.urlPlayback)).toList(), index: _playlistIndex),
      );

      await _player.setPlaylistMode(PlaylistMode.none);
    }

    _positionSub = _player.stream.position.listen(_onPositionChanged);
    _playlistSub = _player.stream.playlist.listen(_onPlaylistChanged);
    _completedSub = _player.stream.completed.listen(_onCompleted);
    _errorSub = _player.stream.error.listen(_onError);
  }

  void _onError(String error) {
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

    if (_shouldSyncPlayerTime == true && widget.mode == PlayerMode.playlist) {
      widget.controller.onTimeChanged?.call(
        currentPlayback.startTime
            .add(Duration(milliseconds: position.inMilliseconds))
            .roundToSecond,
      );
    }
  }

  void _onPlaylistChanged(Playlist playlist) {
    _playlistIndex = playlist.index;
    widget.controller.onPlaybackChanged?.call(_playlistIndex);
  }

  Future<void> jumpToDate(DateTime date) async {
    _shouldSyncPlayerTime = false;
    // Set timeline trước tránh cảm giác delay
    widget.controller.onTimeChanged?.call(date.roundToSecond);

    final index = widget.playlist.atTime(date);

    // Click ngoài khoảng playback
    if (index == null) {
      setState(() => showingNoPlayback = true);
      await _player.pause();
      return;
    }

    if (showingNoPlayback) {
      await _player.play();
      setState(() => showingNoPlayback = false);
    }

    final diff = date.difference(widget.playlist[index].startTime);

    // Trong khoảng hiện tại --> seek
    if (index == _playlistIndex) {
      await _player.seek(diff);
    }
    // Playback khác --> đổi playlist và jump
    else {
      // Jump tới playback đích
      await _player.jump(index);

      if (diff != Duration.zero) {
        try {
          // Đợi tới khi buffering xong (đã chuyển playback) --> Không bị delay
          await _player.stream.buffering
              .firstWhere((buffering) => buffering == false)
              .timeout(const Duration(seconds: 3));

          // Seek tới điểm click
          await _player.seek(diff);
        } catch (_) {}
      }
    }

    _shouldSyncPlayerTime = true;
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
      child: showingNoPlayback
          ? _buildNoPlayback()
          : Video(
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
