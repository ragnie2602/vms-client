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
  final String? source;
  final int? position;
  const ChangePlayerSource(this.source, {this.position});
}

class ChangePlayerStatus extends CameraLiveEvent {
  final PlayerStatus status;
  const ChangePlayerStatus(this.status);
}

class SeekPlayer extends CameraLiveEvent {
  final Duration amount;
  final int type;
  const SeekPlayer(this.amount, this.type);
}

class ChangeVolume extends CameraLiveEvent {
  final double volume;
  final bool? mute;
  const ChangeVolume(this.volume, {this.mute});
}

class ChangePlaybackDate extends CameraLiveEvent {
  final DateTime date;
  const ChangePlaybackDate(this.date);
}

class ChangeTimelineDisplayMode extends CameraLiveEvent {
  final TimelineDisplayMode mode;
  const ChangeTimelineDisplayMode(this.mode);
}
