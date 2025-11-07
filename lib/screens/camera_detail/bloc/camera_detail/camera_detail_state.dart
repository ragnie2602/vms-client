// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'camera_detail_bloc.dart';

enum CameraDetailMode {
  playback,
  live;

  bool get isPlayback => this == CameraDetailMode.playback;
  bool get isLive => this == CameraDetailMode.live;
}

class CameraDetailState extends BaseState {
  const CameraDetailState({
    this.status = PlayerStatus.playing,
    required this.mode,
    required this.camera,
    this.volume = 100,
    this.speed = 1,
    required this.playbackDate,
    this.timelineDisplayMode = TimelineDisplayMode.h8,
    required this.cameraDetailController,
    this.isRecording = false,
    this.stream,
  });

  final CameraDetailMode mode;
  final CameraEntity? camera;
  final PlayerStatus status;
  final double volume;
  final double speed;
  final DateTime playbackDate;
  final TimelineDisplayMode timelineDisplayMode;
  final CameraDetailController cameraDetailController;
  final bool isRecording;
  final CameraStreamUrlStream? stream;

  @override
  List<Object?> get props => [
    mode,
    camera,
    status,
    volume,
    speed,
    playbackDate,
    timelineDisplayMode,
    isRecording,
    stream,
  ];

  CameraDetailState copyWith({
    CameraDetailMode? mode,
    CameraEntity? camera,
    PlayerStatus? status,
    double? volume,
    double? speed,
    DateTime? playbackDate,
    TimelineDisplayMode? timelineDisplayMode,
    CameraDetailController? cameraDetailController,
    bool? isRecording,
    CameraStreamUrlStream? stream,
  }) {
    return CameraDetailState(
      mode: mode ?? this.mode,
      camera: camera ?? this.camera,
      status: status ?? this.status,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
      playbackDate: playbackDate ?? this.playbackDate,
      timelineDisplayMode: timelineDisplayMode ?? this.timelineDisplayMode,
      cameraDetailController: cameraDetailController ?? this.cameraDetailController,
      isRecording: isRecording ?? this.isRecording,
      stream: stream ?? this.stream,
    );
  }
}
