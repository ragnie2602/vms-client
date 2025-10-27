// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'camera_live_bloc.dart';

enum LiveViewMode {
  playback,
  live;

  bool get isPlayback => this == LiveViewMode.playback;
  bool get isLive => this == LiveViewMode.live;
}

class CameraLiveState extends BaseState {
  const CameraLiveState({
    this.status = PlayerStatus.playing,
    required this.mode,
    required this.camera,
    this.volume = 100,
    this.speed = 1,
    required this.playbackDate,
    this.timelineDisplayMode = TimelineDisplayMode.h8,
    required this.cameraLiveController,
  });

  final LiveViewMode mode;
  final CameraEntity camera;
  final PlayerStatus status;
  final double volume;
  final double speed;
  final DateTime playbackDate;
  final TimelineDisplayMode timelineDisplayMode;
  final CameraLiveController cameraLiveController;

  @override
  List<Object?> get props => [mode, camera, status, volume, speed, playbackDate, timelineDisplayMode];

  CameraLiveState copyWith({
    LiveViewMode? mode,
    CameraEntity? camera,
    PlayerStatus? status,
    double? volume,
    double? speed,
    DateTime? playbackDate,
    TimelineDisplayMode? timelineDisplayMode,
    CameraLiveController? cameraLiveController,
  }) {
    return CameraLiveState(
      mode: mode ?? this.mode,
      camera: camera ?? this.camera,
      status: status ?? this.status,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
      playbackDate: playbackDate ?? this.playbackDate,
      timelineDisplayMode: timelineDisplayMode ?? this.timelineDisplayMode,
      cameraLiveController: cameraLiveController ?? this.cameraLiveController,
    );
  }
}
