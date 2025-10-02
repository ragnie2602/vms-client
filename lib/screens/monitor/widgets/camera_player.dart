import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/core/utils/resolution.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../bloc/list_camera_bloc.dart';

class CameraPlayer extends StatefulWidget {
  const CameraPlayer({
    super.key,
    required this.data,
    this.isSubStream = true,
    this.builder,
    this.size,
  });

  final CameraEntity data;
  final bool isSubStream;
  final Widget Function(BuildContext context, VideoPlayer playerWidget, CameraEntity data)? builder;
  final Size? size;

  @override
  State<CameraPlayer> createState() => CameraPlayerState();
}

class CameraPlayerState extends State<CameraPlayer> {
  late VideoPlayerController _controller;
  List<int>? baseAudioTracks;
  late ListCameraBloc blocRef;

  Timer? _timer;
  Timer? _debounce;
  int _countdown = 5;

  VideoPlayerController get controller => _controller;

  @override
  void initState() {
    blocRef = context.read<ListCameraBloc>();
    super.initState();
    _connect();
  }

  @override
  void dispose() {
    blocRef.add(DisposePlayer(_controller, sequentialMode: true));
    _timer?.cancel();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _connect({bool retry = false}) async {
    if (retry) {
      blocRef.add(DisposePlayer(_controller, sequentialMode: true));
    }

    try {
      final headers = widget.size != null
          ? StandardResolution.snapFromSize(widget.size!, mode: RoundMode.up).let(
              (size) => {
                'texture_width': size.width.toString(),
                'texture_height': size.height.toString(),
              },
            )
          : <String, String>{};

      _controller = VideoPlayerController.networkUrl(
        widget.isSubStream ? widget.data.subStreamUri : widget.data.mainStreamUri,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        httpHeaders: headers,
      );

      _controller.addListener(_onMessage);
      _controller.setLooping(true);
      await _controller.initialize().timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT);

      onConnected();
    } on TimeoutException catch (e) {
      if (mounted) _controller.value = VideoPlayerValue.erroneous(e.toString());
    }
  }

  Future<void> onConnected() async {
    _controller.setBufferRange(min: 0, max: 1, drop: true);
    if (widget.isSubStream) {
      _controller.setFps(20);

      // Gán reference
      baseAudioTracks ??= _controller.getActiveAudioTracks();
      _controller.setAudioTracks([]); // Tắt âm thanh
    }

    if (mounted) setState(() {}); // Build lại để bắt đầu play video
    await _controller.play();
  }

  void _debounceConnectionLost() {
    _debounce?.cancel();

    // Pause thì cancel debounce + không check disconnected
    if (_controller.value.isPlaying == false) return;

    _debounce = Timer(AppConfig.PLAYER_DISCONNECTION_THRESHOLD, () {
      if (!mounted) return;

      Logger.warn("Camera '${widget.data.name}' disconnected");
      _controller.value = VideoPlayerValue.erroneous("Disconnected");
    });
  }

  void _onMessage() {
    if (!mounted) return;

    if (_controller.value.hasError) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_countdown == 0) {
          timer.cancel();
          _countdown = 5;
          _connect(retry: true);
        } else {
          _countdown--;
        }
      });
    }

    if (_controller.value.isInitialized == false) {
      setState(() {});
    } else {
      _debounceConnectionLost();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: _controller.value.isInitialized
            ? [BoxShadow(color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 1)]
            : null,
      ),
      child: _controller.value.hasError
          ? _buildError()
          : !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator.adaptive())
          : AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child:
                  widget.builder?.call(context, VideoPlayer(_controller), widget.data) ??
                  VideoPlayer(_controller),
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
