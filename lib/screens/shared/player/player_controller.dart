import 'dart:async';
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
  Completer waitForAttached = Completer();
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
  DateTime? Function()? playerTime;
  PlayerState Function()? getPlayerState;
  Duration Function()? getCurrentPosition;
  DateTime? Function()? getCurrentDate;
  double Function()? getVolume;
  PlayerStatus Function()? getPlayerStatus;

  /* Function control player */
  void Function(double volume, {bool syncSystemVolume})? changeVolume;
  void Function(int type)? zoom;
  void Function()? toggleFullscreen;
  void Function(Duration duration)? seek;
  Future<void> Function(double speed)? changeSpeed;
  Future<void> Function()? togglePlay;
  Future<void> Function()? play;
  Future<void> Function()? pause;
  Future<Completer?> Function(DateTime date, {int? dateIndex})? jumpToDate;
  Future<Process?> Function(String output)? recording;
  Future<bool> Function(String path)? snapshot;
  Future<bool> Function(String path)? captureThumbnail;
  Future<void> Function({Duration? timeout})? waitForReady;
  Future<void> Function(DateTime time)? syncGlobalTime;

  void detach() {
    waitForAttached = Completer();
    onPlaybackChanged.clear();
    onTimeChanged.clear();

    changeVolume = null;
    seek = null;
    changeSpeed = null;
    togglePlay = null;
    getPlayerStatus = null;
    jumpToDate = null;
    recording = null;
    snapshot = null;
    captureThumbnail = null;
    toggleFullscreen = null;
    zoom = null;
    isInitialized = null;
    status = null;
    isSeeking = null;
    playerTime = null;
    getPlayerState = null;
    getCurrentPosition = null;
    getCurrentDate = null;
    play = null;
    pause = null;
    waitForReady = null;
    syncGlobalTime = null;
    getVolume = null;
  }
}
