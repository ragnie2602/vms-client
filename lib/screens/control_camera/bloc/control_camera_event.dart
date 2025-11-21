import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';

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

class GetListCameraInGroupEvent extends ControlCameraEvent {
  final List<int>? groupId;
  const GetListCameraInGroupEvent({this.groupId});
}

class CheckOnvifEvent extends ControlCameraEvent {
  final String xaddrs;
  final String userName;
  final String password;
  final List<int>? boxId;
  const CheckOnvifEvent({
    required this.xaddrs,
    required this.userName,
    required this.password,
    this.boxId,
  });
}

class FilterCameraEvent extends ControlCameraEvent {
  final String? cameraName;
  final bool? isOnline;
  const FilterCameraEvent({this.cameraName, this.isOnline});
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
  final Set<TagEntity> tags;

  const AddCameraRTSPEvent({
    required this.name,
    required this.username,
    required this.password,
    required this.rtspUrl,
    required this.location,
    required this.boxId,
    required this.groupId,
    required this.subStreamUrls,
    required this.tags,
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
  final Set<TagEntity> tags;

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
    required this.tags,
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
  final Set<TagEntity> tags;
  const UpdateCameraEvent({
    required this.cameraId,
    this.name,
    this.rtspUrl,
    this.userName,
    this.password,
    this.xaddr,
    this.location,
    this.subStreamUrls,
    required this.tags,
  });
}

class ReplaceCameraEvent extends ControlCameraEvent {
  final CameraEntity newCamera;
  const ReplaceCameraEvent({required this.newCamera});
  @override
  List<Object?> get props => [newCamera];
}

class DeleteCameraEvent extends ControlCameraEvent {
  final List<int> cameraId;
  const DeleteCameraEvent({required this.cameraId});
}

class ShareCameraEvent extends ControlCameraEvent {
  final List<int> cameraId;
  final int role; // 0 VIEW, 1 FULL
  final String accountInvite;
  const ShareCameraEvent({
    required this.cameraId,
    required this.role,
    required this.accountInvite,
  });
}

class CheckAccountShareEvent extends ControlCameraEvent {
  final List<int>? cameraId;
  final String account;

  /// 0 CAMERA, 1 GROUP_CAMERA
  final int shareType;
  final List<int>? groupId;
  const CheckAccountShareEvent({
    this.cameraId,
    required this.account,
    required this.shareType,
    this.groupId,
  });
}

class AddCameraToGroupEvent extends ControlCameraEvent {
  final List<List<int>> cameraIds;
  final List<int> groupId;
  const AddCameraToGroupEvent({required this.cameraIds, required this.groupId});
}

// class ListShareInviteGroupEvent extends ControlCameraEvent {
//   final List<int> groupId;
//   const ListShareInviteGroupEvent({required this.groupId});
// }

class ListShareCameraEvent extends ControlCameraEvent {
  final List<int> cameraId;
  const ListShareCameraEvent({required this.cameraId});
}

class DeleteShareCameraEvent extends ControlCameraEvent {
  final List<int> cameraId;
  final String accountB;
  final List<int> shareId;
  const DeleteShareCameraEvent({
    required this.cameraId,
    required this.accountB,
    required this.shareId,
  });
}

class RemoveCameraFromGroupEvent extends ControlCameraEvent {
  final List<int> cameraId;
  final List<int>? groupId;
  const RemoveCameraFromGroupEvent({required this.cameraId, this.groupId});
}

class GetAllTagsEvent extends ControlCameraEvent {
  const GetAllTagsEvent();

  @override
  List<Object?> get props => [hashCode];
}

class FilterTagCameraEvent extends ControlCameraEvent {
  final String? tagName;
  final String? keyWord;
  const FilterTagCameraEvent({this.tagName, this.keyWord});
}

class CreateTagEvent extends ControlCameraEvent {
  final TagEntity tag;
  const CreateTagEvent(this.tag);
}

class DeleteTagEvent extends ControlCameraEvent {
  final List<int> id;
  const DeleteTagEvent(this.id);
}

class UpdateTagEvent extends ControlCameraEvent {
  final TagEntity tag;
  const UpdateTagEvent(this.tag);
}
