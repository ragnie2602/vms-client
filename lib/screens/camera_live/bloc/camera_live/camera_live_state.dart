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
  });

  final LiveViewMode mode;
  final CameraEntity camera;
  final GlobalKey<CameraPlayerState> ref;
  final PlayerStatus status;

  @override
  List<Object?> get props => [mode, camera, status];

  CameraLiveState copyWith({
    LiveViewMode? mode,
    CameraEntity? camera,
    GlobalKey<CameraPlayerState>? ref,
    PlayerStatus? status,
  }) {
    return CameraLiveState(
      mode: mode ?? this.mode,
      camera: camera ?? this.camera,
      ref: ref ?? this.ref,
      status: status ?? this.status,
    );
  }
}
