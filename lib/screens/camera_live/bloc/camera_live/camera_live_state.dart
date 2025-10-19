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
    required this.ref,
    this.volume = 100,
    required this.playbackDate,
    this.timelineDisplayMode = TimelineDisplayMode.h8,
  });

  final LiveViewMode mode;
  final CameraEntity camera;
  final GlobalKey<CameraPlayerState> ref;
  final PlayerStatus status;
  final double volume;
  final DateTime playbackDate;
  final TimelineDisplayMode timelineDisplayMode;

  @override
  List<Object?> get props => [mode, camera, status, volume, playbackDate, timelineDisplayMode];

  CameraLiveState copyWith({
    LiveViewMode? mode,
    CameraEntity? camera,
    GlobalKey<CameraPlayerState>? ref,
    PlayerStatus? status,
    double? volume,
    DateTime? playbackDate,
    TimelineDisplayMode? timelineDisplayMode,
  }) {
    return CameraLiveState(
      mode: mode ?? this.mode,
      camera: camera ?? this.camera,
      ref: ref ?? this.ref,
      status: status ?? this.status,
      volume: volume ?? this.volume,
      playbackDate: playbackDate ?? this.playbackDate,
      timelineDisplayMode: timelineDisplayMode ?? this.timelineDisplayMode,
    );
  }
}
