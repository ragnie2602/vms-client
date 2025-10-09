import 'package:vms_flutter_client/core/base_bloc.dart';

class ControlCameraEvent extends BaseEvent {
  const ControlCameraEvent();
}

class ValidateCameraEvent extends ControlCameraEvent {
  final String message;
  const ValidateCameraEvent({required this.message});
}

class GetListCameraEvent extends ControlCameraEvent {
  final List<int>? cameraId;
  final int? status;
  final int? ivaType;
  const GetListCameraEvent({this.cameraId, this.ivaType, this.status});
}
