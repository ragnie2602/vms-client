part of 'camera_live_bloc.dart';

sealed class CameraLiveEvent extends BaseEvent {
  const CameraLiveEvent();
}

class ChangeViewMode extends CameraLiveEvent {
  final LiveViewMode mode;
  const ChangeViewMode(this.mode);
}

class ChangeCamera extends CameraLiveEvent {
  final CameraEntity camera;
  const ChangeCamera(this.camera);
}

class ChangePlayerSource extends CameraLiveEvent {
  final String source;
  final int? position;
  final Function(int)? onDuration;
  const ChangePlayerSource(this.source, {this.position, this.onDuration});
}
