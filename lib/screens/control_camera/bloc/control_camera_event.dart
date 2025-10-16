import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';

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
class GetListCameraNoGroupEvent extends ControlCameraEvent {
  const GetListCameraNoGroupEvent();
}

class CheckOnvifEvent extends ControlCameraEvent {
  final String xaddrs;
  final String userName;
  final String password;
  final List<int>? boxId;
  const CheckOnvifEvent({required this.xaddrs, required this.userName, required this.password, this.boxId});
}

class FilterCameraEvent extends ControlCameraEvent {
  final String? cameraName;
  final CameraStatus? cameraStatus;
  const FilterCameraEvent({this.cameraName, this.cameraStatus});
}

class AddCameraRTSPEvent extends ControlCameraEvent {
  final String name;
  final String username;
  final String password;
  final String rtspUrl;
  final CameraMap location;
  final List<int> boxId;
  final List<int> groupId;
  final List<String> subStreamUrls;
  const AddCameraRTSPEvent({
    required this.name,
    required this.username,
    required this.password,
    required this.rtspUrl,
    required this.location,
    required this.boxId,
    required this.groupId,
    required this.subStreamUrls,
  });
}

class AddCameraOnvifEvent extends ControlCameraEvent {
  final String name;
  final String username;
  final String password;
  final String onvifDeviceIp;
  final String rtspUrl;
  final String serialNumber;
  final CameraMap location;
  final List<int> boxId;
  final List<int> groupId;
  final String urn;
  final List<String> subStreamUrls;
  const AddCameraOnvifEvent({
    required this.rtspUrl,
    required this.serialNumber,
    required this.location,
    required this.boxId,
    required this.groupId,
    required this.urn,
    required this.subStreamUrls,
    required this.name,
    required this.username,
    required this.password,
    required this.onvifDeviceIp,
  });
}

class UpdateCameraEvent extends ControlCameraEvent {
  final List<int> cameraId;
  final String? name;
  final String? rtspUrl;
  final String? userName;
  final String? password;
  final String? xaddr;
  final CameraMap? location;
  final List<String>? subStreamUrls;
  const UpdateCameraEvent({
    required this.cameraId,
    this.name,
    this.rtspUrl,
    this.userName,
    this.password,
    this.xaddr,
    this.location,
    this.subStreamUrls,
  });
}
