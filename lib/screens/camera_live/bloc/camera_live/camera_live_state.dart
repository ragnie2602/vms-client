// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'camera_live_bloc.dart';

enum LiveViewMode {
  playback,
  live;

  bool get isPlayback => this == LiveViewMode.playback;
  bool get isLive => this == LiveViewMode.live;
}

class CameraLiveState extends BaseState {
  const CameraLiveState({required this.mode, required this.camera, required this.ref});

  final LiveViewMode mode;
  final CameraEntity camera;
  final GlobalKey<CameraPlayerState> ref;

  @override
  List<Object?> get props => [mode, camera];

  CameraLiveState copyWith({
    LiveViewMode? mode,
    CameraEntity? camera,
    GlobalKey<CameraPlayerState>? ref,
  }) {
    return CameraLiveState(
      mode: mode ?? this.mode,
      camera: camera ?? this.camera,
      ref: ref ?? this.ref,
    );
  }
}
