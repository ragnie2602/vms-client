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

class ChangePlayerStatus extends CameraLiveEvent {
  final PlayerStatus status;
  const ChangePlayerStatus(this.status);
}

class SeekPlayer extends CameraLiveEvent {
  final Duration amount;
  const SeekPlayer(this.amount);
}

class ChangeVolume extends CameraLiveEvent {
  final double volume;
  const ChangeVolume(this.volume);
}

class ChangeSpeed extends CameraLiveEvent {
  final double speed;
  const ChangeSpeed(this.speed);
}

class ChangePlaybackDate extends CameraLiveEvent {
  final DateTime date;
  const ChangePlaybackDate(this.date);
}

class ChangeTimelineDisplayMode extends CameraLiveEvent {
  final TimelineDisplayMode mode;
  const ChangeTimelineDisplayMode(this.mode);
}
