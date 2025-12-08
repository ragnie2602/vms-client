import 'dart:io' show Process;
import 'package:flutter/material.dart' show GlobalKey, ValueNotifier;

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

  /* Listeners */
  Set<Function(int)> onPlaybackChanged = {};
  Set<Function(DateTime, [bool])> onTimeChanged = {};

  void markPlaybackChanged(int currentIndex) {
    for (var callback in onPlaybackChanged) {
      callback(currentIndex);
    }
  }

  void markTimeChanged(DateTime param1, [bool param2 = false]) {
    for (var callback in onTimeChanged) {
      callback(param1, param2);
    }
  }

  /* Getter */
  bool Function()? isInitialized;
  ValueNotifier<PlayerStatus> Function()? status;
  ValueNotifier<bool> Function()? isSeeking;
  DateTime Function()? playerTime;

  /* Function control player */
  void Function(double volume)? changeVolume;
  void Function(int type)? zoom;
  void Function()? toggleFullscreen;
  void Function(Duration duration)? seek;
  Future<void> Function(double speed)? changeSpeed;
  Future<void> Function()? togglePlay;
  Future<void> Function(DateTime date, {int? dateIndex})? jumpToDate;
  Future<Process?> Function(String output)? recording;
  Future<bool> Function(String path)? snapshot;
}
