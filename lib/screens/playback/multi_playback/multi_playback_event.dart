import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

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
class AddCameraEvent extends MultiPlaybackEvent {
  final CameraEntity newCam;
  final int indexCam;
  const AddCameraEvent({required this.newCam, required this.indexCam});
}

class RemoveCameraEvent extends MultiPlaybackEvent {}

// class OnUpdate
