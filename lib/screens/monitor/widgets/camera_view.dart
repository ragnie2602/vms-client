import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart';
import 'package:video_player/video_player.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.data, required this.index, this.isLiveView = false});

  final CameraEntity data;
  final int index;
  final bool isLiveView;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late VideoPlayerController _controller;
  List<int>? baseAudioTracks;

  Timer? _timer;
  Timer? _debounce;
  final ValueNotifier<int> _countdown = ValueNotifier(5);

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
    _countdown.dispose();
    super.dispose();
  }

  Future<void> _connect({bool retry = false}) async {
    if (retry) {
      _controller.dispose();
    }

    try {
      _controller = VideoPlayerController.networkUrl(
        widget.isLiveView ? widget.data.mainStreamUri : widget.data.subStreamUri,
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

    _controller.setFps(20);
    if (!widget.isLiveView) {
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
    } else {
      _debounceConnectionLost();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 1)],
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
      mainAxisSize: MainAxisSize.min,
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
