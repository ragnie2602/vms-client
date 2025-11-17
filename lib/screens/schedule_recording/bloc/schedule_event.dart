import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class ScheduleEvent extends BaseEvent {}

class GetListCameraEvent extends ScheduleEvent {
  // tag
}
class ChangeCameraEvent extends ScheduleEvent {
  final CameraEntity newCamera;

  ChangeCameraEvent(this.newCamera);
}