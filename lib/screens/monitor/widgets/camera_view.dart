import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart';
import 'package:video_player/video_player.dart';

import '../camera_data.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.data, required this.index});

  final CameraData data;
  final int index;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      widget.data.buildUri(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();

    Future.delayed(const Duration(seconds: 10), () {
      setFps(15);
      print("${widget.index}: Đã cập nhập FPS");
    });
  }

  void setFps(double fps) {
    _controller.setFps(fps);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.hasError) {
      return const Center(child: Icon(Icons.error_outline, color: Colors.red));
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        boxShadow: [BoxShadow(color: Colors.grey.shade100, spreadRadius: 2, blurRadius: 2)],
      ),
      child: !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
    );
  }
}
