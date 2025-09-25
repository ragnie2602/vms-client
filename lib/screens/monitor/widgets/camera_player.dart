import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart';
import 'package:video_player/video_player.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class CameraPlayer extends StatefulWidget {
  const CameraPlayer({super.key, required this.data, this.isSubStream = true, this.builder});

  final CameraEntity data;
  final bool isSubStream;
  final Widget Function(BuildContext context, VideoPlayer playerWidget, CameraEntity data)? builder;

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();
}

class _CameraPlayerState extends State<CameraPlayer> {
  late VideoPlayerController _controller;
  List<int>? baseAudioTracks;

  Timer? _timer;
  Timer? _debounce;
  int _countdown = 5;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _connect({bool retry = false}) async {
    if (retry) {
      _controller.dispose();
    }

    try {
      _controller = VideoPlayerController.networkUrl(
        widget.isSubStream ? widget.data.subStreamUri : widget.data.mainStreamUri,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      _controller.addListener(_onMessage);
      _controller.setLooping(true);
      await _controller.initialize().timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT);

      onConnected();
    } on TimeoutException catch (e) {
      _controller.value = VideoPlayerValue.erroneous(e.toString());
    }
  }

  Future<void> onConnected() async {
    // Gán reference
    baseAudioTracks ??= _controller.getActiveAudioTracks();

    if (widget.isSubStream) {
      _controller.setBufferRange(min: 0, max: 1, drop: true);
      _controller.setFps(20);
      _controller.setAudioTracks([]); // Tắt âm thanh
    }

    setState(() {}); // Build lại để bắt đầu play video
    await _controller.play();
  }

  void _debounceConnectionLost() {
    _debounce?.cancel();
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
        boxShadow: [BoxShadow(color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 1)],
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
