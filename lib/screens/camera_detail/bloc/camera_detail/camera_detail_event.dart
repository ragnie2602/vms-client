part of 'camera_detail_bloc.dart';

sealed class CameraDetailEvent extends BaseEvent {
  const CameraDetailEvent();
}

class ChangeViewMode extends CameraDetailEvent {
  final CameraDetailMode mode;
  const ChangeViewMode(this.mode);
}

class ChangeCamera extends CameraDetailEvent {
  final CameraEntity camera;
  const ChangeCamera(this.camera);
}

class ChangePlayerStatus extends CameraDetailEvent {
  final PlayerStatus status;
  const ChangePlayerStatus(this.status);
}

class SeekPlayer extends CameraDetailEvent {
  final Duration amount;
  const SeekPlayer(this.amount);
}

class ChangeVolume extends CameraDetailEvent {
  final double volume;
  const ChangeVolume(this.volume);
}

class ChangeSpeed extends CameraDetailEvent {
  final double speed;
  const ChangeSpeed(this.speed);
}

class ChangePlaybackDate extends CameraDetailEvent {
  final DateTime date;
  const ChangePlaybackDate(this.date);
}

class ChangeTimelineDisplayMode extends CameraDetailEvent {
  final TimelineDisplayMode mode;
  const ChangeTimelineDisplayMode(this.mode);
}

class OnRecording extends CameraDetailEvent {
  final int? cancelStatus;
  final Future<String> Function()? buildPath;
  final Function(Process?, String? output)? cb;
  const OnRecording({this.cb, this.cancelStatus, this.buildPath});
}

class ChangeStream extends CameraDetailEvent {
  final CameraStreamUrlStream stream;
  const ChangeStream(this.stream);
}
