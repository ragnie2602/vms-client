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

class CheckOnvifEvent extends ControlCameraEvent {
  final String xaddrs;
  final String userName;
  final String password;
  final List<int>? boxId;
  const CheckOnvifEvent({required this.xaddrs, required this.userName, required this.password, this.boxId});
}
