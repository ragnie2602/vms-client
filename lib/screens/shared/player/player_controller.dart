import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart' show GlobalKey;

enum MonitorMode { liveview, monitoring }

// error_again <=> error (để trigger được listener khi từ error --> error)
enum PlayerState {
  initializing,
  initialized,
  empty,
  error,
  error_again;

  bool get isError => this == error || this == error_again;
}

enum PlayerStatus { playing, paused, finished }

class PlayerController {
  GlobalKey ref = GlobalKey();

  Function(int)? onPlaybackChanged;
  Function(DateTime, [bool])? onTimeChanged;

  /* Function control player */
  void Function(double volume)? changeVolume;
  void Function()? toggleFullscreen;
  Future<void> Function(Duration duration)? seek;
  Future<void> Function(double speed)? changeSpeed;
  Future<void> Function()? togglePlay;
  Future<Uint8List?> Function()? snapshot;
  Future<void> Function(DateTime date, {int? dateIndex})? jumpToDate;
  bool Function()? isInitialized;
}
