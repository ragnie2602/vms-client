import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/constants/common_extensions.dart';

enum AudioPlayerState { idle, initializing, initialized, playing, paused, error }

class AudioPlayer {
  late Player _player;
  Timer? _positionTimer;
  Completer<void> _waitForUnloadedOldMedia = Completer<void>()..safeComplete();
  Completer<bool>? _waitForFirstFrame;

  /* Controller */
  final state = ValueNotifier<AudioPlayerState>(AudioPlayerState.idle);
  final positionController = ValueNotifier<int>(0);
  int get duration => _player.mediaInfo.duration;

  Future<void> dispose() async {
    _stopPositionTracker();
    _player.state = PlaybackState.paused;
    await Future.delayed(Duration.zero);
    await _player.dispose();
    state.dispose();
    positionController.dispose();
  }

  /* ==================== Constructor ==================== */
  AudioPlayer() {
    _initPlayer();
  }

  void _initPlayer() {
    _player = Player();

    /* Callbacks */
    _player.onStateChanged((pre, cur) {
      // Trường hợp gọi play lại --> state về stopped (đổi/reload url)
      if (cur == PlaybackState.stopped && state.value != AudioPlayerState.initializing) stop();

      // print("=========================> STATE: $pre - $cur");
    });
    _player.onMediaStatus((pre, cur) {
      // Load xong
      if (_waitForFirstFrame != null && !_waitForFirstFrame!.isCompleted) {
        if (cur.test(MediaStatus.invalid)) _waitForFirstFrame!.safeComplete(false);
        if (pre.test(MediaStatus.buffering) && cur.test(MediaStatus.buffered)) {
          _waitForFirstFrame!.safeComplete(true);
        }
      }

      // Case mất kết nối giữ chừng (== giống khi kết thúc video)
      // Khi đổi playback thì media cũ có thể bị unloaded + end
      if (_waitForUnloadedOldMedia.isCompleted &&
          cur.test(MediaStatus.unloaded) &&
          cur.test(MediaStatus.end) &&
          _player.position + 3000 < duration) {
        state.value = AudioPlayerState.error;
      }

      // Completer unloaded old media
      if (!_waitForUnloadedOldMedia.isCompleted && cur.test(MediaStatus.unloaded)) {
        _waitForUnloadedOldMedia.safeComplete();
      }

      // Case bị lỗi
      if (!pre.test(MediaStatus.invalid) &&
          cur.test(MediaStatus.invalid) &&
          state.value != AudioPlayerState.idle) {
        state.value = AudioPlayerState.error;
      }

      // print("=========================> STATUS: $pre - $cur");
      return true;
    });

    // 0. Base
    _player.setProperty('avformat.strict', 'experimental');
    _player.setProperty('avformat.safe', '0');
    _player.setProperty('avformat.rtsp_transport', 'tcp');

    // 1. Chặn hoàn toàn các thành phần liên quan đến Video
    _player.setProperty("video.disable", "true");
    _player.videoDecoders = [];
    _player.activeVideoTracks = [];
    _player.setProperty("avformat.fpsprobesize", "0"); // Không cần check FPS cho audio

    // 2. Tối ưu hóa tốc độ bắt đầu (Với MP3 không cần phân tích quá lâu)
    _player.setProperty("avformat.probesize", "32768"); // 32KB
    _player.setProperty("avformat.analyzeduration", "100000"); // 0.1s
    _player.setProperty("avformat.fflags", "+nobuffer+fastseek+genpts");

    // 3. Tối ưu hóa kết nối mạng (Network Resilience)
    _player.setProperty("avio.reconnect", "1");
    _player.setProperty("avio.reconnect_streamed", "1");
    _player.setProperty("avio.reconnect_delay_max", "7");
    _player.setProperty("avformat.timeout", "15000000"); // 15s
    _player.setProperty("http_persistent", "1"); // HTTP persistent --> next/seek mượt hơn

    // 4. Giảm tải CPU
    _player.setProperty("avcodec.threads", "1"); // Audio decode rất nhẹ, 1 thread là đủ

    // Cấu hình bộ đệm RAM (Buffer Range) --> Min cao để mượt, max cao để cache trước
    _player.setBufferRange(
      min: 250, // Nạp trước 0.25s để mượt
      max: 15000, // ~15s cache
      drop: false,
    );
  }

  void _stopPositionTracker() => _positionTimer?.cancel();
  void _startPositionTracker() {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      positionController.value = _player.position;

      // print("=========================> ${_player.position}/${_player.mediaInfo.duration}");
    });
  }

  /* ==================== Functions ==================== */
  Future<void> play(String source, {bool autoPlay = true, bool loop = false}) async {
    state.value = AudioPlayerState.initializing;
    _stopPositionTracker();

    // Trường hợp reconnect
    if (_player.media == source) {
      _waitForUnloadedOldMedia = Completer<void>();
      _player.media = "";
      await _waitForUnloadedOldMedia.future.timeout(Duration(seconds: 1), onTimeout: () => false);
      _waitForUnloadedOldMedia.safeComplete();
    }

    _waitForFirstFrame = Completer<bool>();
    _player.media = source;
    if (_player.loop != (loop ? -1 : 0)) _player.loop = loop ? -1 : 0;
    _player.state = PlaybackState.playing;

    final ret = await _waitForFirstFrame?.future.timeout(
      Duration(seconds: 10),
      onTimeout: () => false,
    );
    _waitForFirstFrame = null;

    if (ret != true) {
      state.value = AudioPlayerState.error;
    } else {
      autoPlay ? resume() : pause();
    }
  }

  void pause() {
    _player.state = PlaybackState.paused;
    state.value = AudioPlayerState.paused;
    _stopPositionTracker();
  }

  void resume() {
    _player.state = PlaybackState.playing;
    state.value = AudioPlayerState.playing;
    _startPositionTracker();
  }

  void stop() {
    _player.state = PlaybackState.stopped;
    state.value = AudioPlayerState.idle;
    positionController.value = 0;
    _stopPositionTracker();
  }
}
