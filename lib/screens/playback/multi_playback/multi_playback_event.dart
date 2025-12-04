import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/components/player_timeline.dart';

class MultiPlaybackEvent extends BaseEvent {
  const MultiPlaybackEvent();
}

class InitEvent extends MultiPlaybackEvent {
  const InitEvent();
}

class ChangePlaybackDate extends MultiPlaybackEvent {
  final DateTime date;
  const ChangePlaybackDate({required this.date});
}

class ChangeTimelineDisplayMode extends MultiPlaybackEvent {
  final TimelineDisplayMode mode;
  const ChangeTimelineDisplayMode(this.mode);
}

class AddCameraEvent extends MultiPlaybackEvent {
  final CameraEntity newCam;
  final int indexCam;
  const AddCameraEvent({required this.newCam, required this.indexCam});
}

class RemoveCameraEvent extends MultiPlaybackEvent {
  final CameraEntity camera;
  final int indexCam;
  const RemoveCameraEvent({required this.camera, required this.indexCam});
}

class MultiTogglePlayEvent extends MultiPlaybackEvent {
  const MultiTogglePlayEvent();
}

class MultiSeekEvent extends MultiPlaybackEvent {
  final Duration duration;
  const MultiSeekEvent(this.duration);
}

class MultiChangeSpeedEvent extends MultiPlaybackEvent {
  final double speed;
  const MultiChangeSpeedEvent(this.speed);
}

class MultiChangeVolumeEvent extends MultiPlaybackEvent {
  final double volume;
  const MultiChangeVolumeEvent(this.volume);
}
