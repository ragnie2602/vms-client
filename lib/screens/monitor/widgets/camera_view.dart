import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart';
import 'package:fvp/mdk.dart';
import 'package:video_player/video_player.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.data, required this.index});

  final CameraEntity data;
  final int index;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late VideoPlayerController _controller;

  Timer? _timer;
  final ValueNotifier<int> _countdown = ValueNotifier(5);
  bool isTimingOut = false;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect({bool retry = false}) async {
    if (retry) {
      _controller.dispose();
    }

    try {
      _controller = VideoPlayerController.networkUrl(
        widget.data.streamUri,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      _controller.addListener(_handleError);
      _controller.setLooping(true);
      await _controller.initialize().timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT);
      // _controller.setAudioTracks([]);
      await _controller.play();
      setState(() {}); // Build lại để bắt đầu play video
      setFPS(20);
    } on TimeoutException catch (e) {
      isTimingOut = true;
      _controller.value = VideoPlayerValue.erroneous(e.toString());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setFPS(double fps) {
    _controller.setFps(fps);
  }

  void _handleError() {
    if (_controller.value.errorDescription != null) {
      print("======xxxx=====> error : ${_controller.value.errorDescription}\n");
    }

    if (!mounted) return;

    if (_controller.value.hasError) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_countdown.value == 0) {
          timer.cancel();
          _countdown.value = 5;
          _connect(retry: true);
        } else {
          _countdown.value--;
        }
      });
    }

    if (_controller.value.isInitialized == false) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        boxShadow: [BoxShadow(color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 1)],
      ),
      child: _controller.value.hasError
          ? _buildError()
          : !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator.adaptive())
          : AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 14),
        Icon(Icons.error_outline, color: Colors.red, size: 36),
        ValueListenableBuilder(
          valueListenable: _countdown,
          builder: (context, value, child) {
            return Text('Kết nối lại sau ${value}s', style: TextStyle(fontSize: 14));
          },
        ),
      ],
    );
  }
}
