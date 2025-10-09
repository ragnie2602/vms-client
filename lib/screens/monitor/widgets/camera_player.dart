import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fvp/mdk.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/core/utils/resolution.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../bloc/list_camera_bloc.dart';

enum _PlayerState { initializing, initialized, error }

class CameraPlayer extends StatefulWidget {
  const CameraPlayer({
    super.key,
    required this.data,
    this.isSubStream = true,
    this.builder,
    this.size,
    this.borderRadius,
  });

  final CameraEntity data;
  final bool isSubStream;
  final Widget Function(BuildContext context, Widget playerWidget, CameraEntity data)? builder;
  final Size? size;
  final double? borderRadius;

  @override
  State<CameraPlayer> createState() => CameraPlayerState();
}

class CameraPlayerState extends State<CameraPlayer> {
  late ListCameraBloc blocRef;

  int _lastPosition = -1;
  late Player _player;
  Player get player => _player;

  Timer? _timer;
  Timer? _debounce;
  int _countdown = 5;

  final _state = ValueNotifier(_PlayerState.initializing);
  double _aspectRatio = 1.0;

  @override
  void initState() {
    blocRef = context.read<ListCameraBloc>();
    super.initState();
    _initPlayer();
    _onConnecting();
  }

  @override
  void dispose() {
    blocRef.add(DisposePlayer(_player, sequentialMode: true));
    _timer?.cancel();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Thay đổi chế độ xem
    if (oldWidget.size != widget.size) {
      final data = widget.size?.let(
        (size) => StandardResolution.snapFromSize(size, mode: RoundMode.up),
      );

      _player.updateTexture(width: data?.width, height: data?.height);
    }
  }

  void _initPlayer() {
    try {
      // Dispose player trước khi tạo mới
      blocRef.add(DisposePlayer(_player, sequentialMode: true));
    } catch (_) {}

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
    // Reduce latency:
    _player.setProperty('avformat.fflags', '+nobuffer');
    _player.setProperty('avformat.fpsprobesize', '0');
    _player.setProperty('avformat.analyzeduration', '100000');
    _player.setBufferRange(min: 0, max: 1, drop: true);
    _player.videoDecoders = AppConfig.MDK_DECODERS;

    if (widget.isSubStream) {
      _player.setFps(20);
      _player.activeAudioTracks = [];
    }
  }

  Future<void> _onConnecting([bool isRetry = false]) async {
    try {
      if (isRetry) _state.value = _PlayerState.initializing;

      _player
        ..media = widget.isSubStream
            ? widget.data.subStreamUri.toString()
            : widget.data.mainStreamUri.toString()
        ..loop = -1
        ..state = PlaybackState.playing;

      final textureConstraints = widget.size?.let(
        (size) => StandardResolution.snapFromSize(size, mode: RoundMode.up),
      );

      // await timeout thì catch ở ngoài ms bắt được, không phải dùng catchError/onError
      await _player
          .updateTexture(width: textureConstraints?.width, height: textureConstraints?.height)
          .timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT)
          .then((id) => _onInitialized(id));
    } catch (e) {
      _onError(e);
    }
  }

  Future<void> _onInitialized(int id) async {
    if (id == -1) return _onError();

    final size = await _player.textureSize;
    _aspectRatio = size == null ? 1.0 : size.width / size.height;
    _state.value = _PlayerState.initialized;

    _timer?.cancel();
    _lastPosition = -1;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return _timer?.cancel();

      _player.position.let((pos) {
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
        _onConnecting(true);
      } else {
        _countdown--;
      }
    });
  }

  void _debounceConnectionLost() {
    // Pause thì cancel debounce + không check disconnected
    if (_player.state == PlaybackState.paused) return;

    _debounce?.cancel();
    _debounce = Timer(AppConfig.PLAYER_DISCONNECTION_THRESHOLD, () {
      if (!mounted) return;

      Logger.warn("Camera '${widget.data.name}' disconnected");
      _timer?.cancel();
      _initPlayer();
      _onError();
    });
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
        child: state == _PlayerState.error
            ? _buildError()
            : state == _PlayerState.initializing
            ? const Center(child: CircularProgressIndicator.adaptive())
            : AspectRatio(
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

                    return widget.builder?.call(context, player, widget.data) ?? player;
                  },
                ),
              ),
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
          'Camera ${widget.data.name} đang ngoại tuyến',
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }
}
