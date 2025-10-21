import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fvp/mdk.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/core/utils/resolution.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';

enum _PlayerState { initializing, initialized, error, none }

enum PlayerMode { monitoring, livestreaming, playback }

enum PlayerStatus { playing, paused, finished }

class CameraPlayer extends StatefulWidget {
  const CameraPlayer({
    super.key,
    this.builder,
    this.size,
    this.borderRadius,
    required this.source,
    required this.name,
    required this.mode,
    this.belongViewMode,
  });

  final String source;
  final String name;
  final Widget Function(Widget playerWidget, ValueNotifier<PlayerStatus> status)? builder;
  final Size? size;
  final double? borderRadius;
  final PlayerMode mode;
  final ViewMode? belongViewMode;

  @override
  State<CameraPlayer> createState() => CameraPlayerState();
}

class CameraPlayerState extends State<CameraPlayer> {
  late AppBloc blocRef;

  int _lastPosition = -1;
  final _status = ValueNotifier<PlayerStatus>(PlayerStatus.playing);
  late Player _player;
  Player get player => _player;

  late String _currentSource;
  Function(int)? _onDuration;
  bool _isUpdatingDuration = false;

  Timer? _timer;
  Timer? _debounce;
  Timer? _debounceUpdateTexture;
  int _countdown = 5;

  final _state = ValueNotifier(_PlayerState.initializing);
  double _aspectRatio = 1.0;

  @override
  void initState() {
    blocRef = context.read<AppBloc>();
    _currentSource = widget.source;
    super.initState();
    _initPlayer();
    _onConnecting();
  }

  @override
  void dispose() {
    _tryDisposePlayer();
    _timer?.cancel();
    _debounce?.cancel();
    _debounceUpdateTexture?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Thay đổi chế độ xem
    if (widget.mode == PlayerMode.monitoring &&
        oldWidget.belongViewMode != null &&
        widget.belongViewMode != null &&
        widget.belongViewMode != oldWidget.belongViewMode &&
        oldWidget.size != widget.size) {
      _debounceUpdateTexture?.cancel();
      _debounceUpdateTexture = Timer(const Duration(milliseconds: 300), () {
        final data = widget.size?.let(
          (size) => StandardResolution.snapFromSize(size, mode: RoundMode.up),
        );
        _player.updateTexture(width: data?.width, height: data?.height);
      });
    }
  }

  void _tryDisposePlayer() {
    try {
      blocRef.add(DisposePlayer(_player, sequentialMode: true));
    } catch (_) {}
  }

  void _initPlayer() {
    _tryDisposePlayer();

    _player = Player();
    // _player.onMediaStatus(_onStatusChanged);

    // Properties
    _player.setProperty('video.decoder', 'shader_resource=0');
    _player.setProperty('avformat.strict', 'experimental');
    _player.setProperty('avformat.safe', '0');
    _player.setProperty('avio.reconnect', '1');
    _player.setProperty('avio.reconnect_delay_max', '7');
    _player.setProperty('avformat.rtsp_transport', 'tcp');
    _player.setProperty('avformat.extension_picky', '0');
    _player.setProperty('avformat.allowed_segment_extensions', 'ALL');
    _player.videoDecoders = AppConfig.MDK_DECODERS;

    if (widget.mode != PlayerMode.playback) {
      // Reduce latency:
      _player.setProperty('avformat.fflags', '+nobuffer');
      _player.setProperty('avformat.fpsprobesize', '0');
      _player.setProperty('avformat.analyzeduration', '100000');

      _player.setBufferRange(min: 0, max: 1, drop: true);
    }
    if (widget.mode == PlayerMode.monitoring) {
      _player.setFps(20);
      _player.activeAudioTracks = [];
    }
  }

  Future<void> _onConnecting({bool isRetry = false, int? seek}) async {
    try {
      if (isRetry) _state.value = _PlayerState.initializing;

      _player
        ..media = _currentSource
        ..state = PlaybackState.playing;
      _status.value = PlayerStatus.playing;

      final textureConstraints = widget.size?.let(
        (size) => StandardResolution.snapFromSize(size, mode: RoundMode.up),
      );

      // await timeout thì catch ở ngoài ms bắt được, không phải dùng catchError/onError
      await _player
          .updateTexture(width: textureConstraints?.width, height: textureConstraints?.height)
          .timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT)
          .then((id) => _onInitialized(id, seek: seek));
    } catch (e) {
      _onError(e);
    }
  }

  Future<void> _onInitialized(int id, {int? seek}) async {
    if (id == -1) return _onError();

    final size = await _player.textureSize;
    _aspectRatio = size == null ? 1.0 : size.width / size.height;
    _state.value = _PlayerState.initialized;
    if (seek != null) await _player.seek(position: seek);

    _timer?.cancel();
    _lastPosition = -1;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return _timer?.cancel();

      _player.position.let((pos) {
        if (widget.mode == PlayerMode.playback) {
          if (_player.state == PlaybackState.stopped) _status.value = PlayerStatus.finished;
          if (_status.value == PlayerStatus.finished && _player.state == PlaybackState.playing) {
            _status.value = PlayerStatus.playing;
          }
        }

        if (!_isUpdatingDuration) _onDuration?.call(pos);
        if (_lastPosition != pos) _debounceConnectionLost();
        _lastPosition = pos;
      });
    });
  }

  void _onError([e]) {
    if (!mounted) return;
    _state.value = _PlayerState.error;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        timer.cancel();
        _countdown = 5;
        _onConnecting(isRetry: true);
      } else {
        _countdown--;
      }
    });
  }

  void _debounceConnectionLost() {
    _debounce?.cancel();
    _debounce = Timer(AppConfig.PLAYER_DISCONNECTION_THRESHOLD, () {
      if (!mounted) return;
      // Dừng hoặc hết video
      if (_status.value == PlayerStatus.finished || _status.value == PlayerStatus.paused) return;

      Logger.warn("Camera '${widget.name}' disconnected");
      _timer?.cancel();
      _initPlayer();
      _onError();
    });
  }

  Future<void> switchSource(String? source, {int? position, Function(int)? onDuration}) async {
    // Ngoài list playbacks
    if (source == null) {
      _onDuration = null;
      _timer?.cancel();
      _debounce?.cancel();
      _state.value = _PlayerState.none;
      _currentSource = '';
      _tryDisposePlayer();
      return;
    }

    _onDuration = onDuration;

    // Trường hợp vẫn source đó nhưng seek
    if (source == _currentSource && _state.value == _PlayerState.initialized && position != null) {
      await seek(position, 0);
      return;
    }

    // Lỗi OR đổi source --> reset
    _currentSource = source;
    _debounce?.cancel();
    _timer?.cancel();
    _initPlayer();
    await _onConnecting(isRetry: true, seek: position);
  }

  void play() {
    _player.play();
    _status.value = PlayerStatus.playing;
  }

  void pause() {
    _player.pause();
    _status.value = PlayerStatus.paused;
  }

  Future<void> seek(int position, int type) async {
    if (_player.seekingCompleter?.isCompleted == false) {
      await _player.seekingCompleter?.future;
    }

    _isUpdatingDuration = true;

    int targetPosition = position;
    if (type > 0) targetPosition = min(_player.position + position, _player.mediaInfo.duration);
    if (type < 0) targetPosition = max(0, _player.position - position);

    if (_status.value == PlayerStatus.finished && targetPosition < _player.mediaInfo.duration) {
      _player.play();
      _status.value = PlayerStatus.playing;
    }

    final res = await _player.seek(position: targetPosition);
    if (res == -10 && targetPosition >= _player.mediaInfo.duration) {
      _status.value = PlayerStatus.finished;
    }

    _isUpdatingDuration = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<_PlayerState>(
      valueListenable: _state,
      builder: (context, state, _) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(widget.borderRadius ?? 0),
          color: Colors.black,
          boxShadow: state == _PlayerState.initialized
              ? [BoxShadow(color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 1)]
              : null,
        ),
        child: switch (state) {
          _PlayerState.none => SizedBox.shrink(),
          _PlayerState.error => _buildError(),
          _PlayerState.initializing => const Center(child: CircularProgressIndicator.adaptive()),
          _ => AspectRatio(
            aspectRatio: _aspectRatio,
            child: ValueListenableBuilder(
              valueListenable: _player.textureId,
              builder: (context, id, _) {
                final player = id == null
                    ? const SizedBox.shrink()
                    : widget.borderRadius != null
                    ? ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(widget.borderRadius!),
                        child: Texture(textureId: id),
                      )
                    : Texture(textureId: id);

                return widget.builder?.call(player, _status) ?? player;
              },
            ),
          ),
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
        Icon(Icons.videocam_off, color: Colors.red, size: 36),
        SizedBox(height: 6),
        Text(
          widget.mode != PlayerMode.playback
              ? 'Camera ${widget.name} đang ngoại tuyến'
              : 'Có lỗi xảy ra khi tải video',
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }
}
