import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/add_camera.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';

class ControlCameraState extends BaseState {
  final CameraStatus? status;
  const ControlCameraState({this.status});
}

class ListCameraSuccessState extends ControlCameraState {
  final List<CameraEntity> cameras;
  const ListCameraSuccessState({required this.cameras});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameras];
}

class ListCameraFailState extends ControlCameraState {
  final String message;

  const ListCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class ControlCameraLoadingState extends ControlCameraState {
  @override
  StateType get type => StateType.loading;
}

class ListShareCameraSuccessState extends ControlCameraState {
  final List<int> cameraId;
  final List<InviteMessageEntity> inviteMessages;
  const ListShareCameraSuccessState({required this.cameraId, required this.inviteMessages});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameraId, inviteMessages];
}

// class ListShareInviteGroupSuccessState extends ControlCameraState {
//   final List<int> groupId;
//   final List<InviteMessageEntity> inviteMessages;
//   const ListShareInviteGroupSuccessState({
//     required this.groupId,
//     required this.inviteMessages,
//   });
//   @override
//   StateType get type => StateType.success;
//   @override
//   List<Object?> get props => [groupId, inviteMessages];
// }

class AddCameraSuccessState extends ControlCameraState {
  final AddCameraEntity cameraEntity;
  const AddCameraSuccessState({required this.cameraEntity});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameraEntity];
}

class AddCameraFailState extends ControlCameraState {
  final String message;

  const AddCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class ValidateCameraState extends ControlCameraState {
  final String message;

  const ValidateCameraState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class CheckOnvifSuccessState extends ControlCameraState {
  final CameraOnvif cameraOnvif;
  const CheckOnvifSuccessState({required this.cameraOnvif});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameraOnvif];
}

class CheckOnvifFailState extends ControlCameraState {
  final String message;
  const CheckOnvifFailState(this.message);
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class UpdateCameraSuccessState extends ControlCameraState {
  final CameraEntity cameraEntity;
  const UpdateCameraSuccessState({required this.cameraEntity});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameraEntity];
}

class DeleteCameraSuccessState extends ControlCameraState {
  final List<int> deletedCameraId;
  const DeleteCameraSuccessState({required this.deletedCameraId});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [deletedCameraId];
}

class RemoveCameraFromGroupFailState extends ControlCameraState {
  final String message;
  final int? timeId;
  const RemoveCameraFromGroupFailState(this.message, {this.timeId});
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
  @override
  List<Object?> get props => [message, timeId];
}

class RemoveCameraFromGroupSuccessState extends ControlCameraState {
  final List<CameraEntity> cameras;
  const RemoveCameraFromGroupSuccessState(this.cameras);
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameras];
}

class GetAllTagsSuccessState extends ControlCameraState {
  final List<TagEntity> tags;
  const GetAllTagsSuccessState({required this.tags});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [tags];
}

class GetAllTagsFailState extends ControlCameraState {
  final String message;
  const GetAllTagsFailState(this.message);
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
  @override
  List<Object?> get props => [message];
}

class GetAllTagsLoadingState extends ControlCameraState {
  @override
  StateType get type => StateType.loading;
}

class CreateTagSuccessState extends ControlCameraState {
  final TagEntity tag;
  const CreateTagSuccessState({required this.tag});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [tag];
}

class CreateTagFailState extends ControlCameraState {
  final String message;
  const CreateTagFailState(this.message);
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
  @override
  List<Object?> get props => [message];
}

class CreateTagLoadingState extends ControlCameraState {
  @override
  StateType get type => StateType.loading;
}

class DeleteTagSuccessState extends ControlCameraState {
  final List<int> id;
  const DeleteTagSuccessState(this.id);
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [id];
}

class DeleteTagFailState extends ControlCameraState {
  final String message;
  const DeleteTagFailState(this.message);
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
  @override
  List<Object?> get props => [message];
}

class DeleteTagLoadingState extends ControlCameraState {
  final List<int> id;

  const DeleteTagLoadingState(this.id);
  @override
  StateType get type => StateType.loading;
}

class UpdateTagSuccessState extends ControlCameraState {
  final TagEntity tag;
  const UpdateTagSuccessState({required this.tag});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [tag];
}

class UpdateTagFailState extends ControlCameraState {
  final String message;
  const UpdateTagFailState(this.message);
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
  @override
  List<Object?> get props => [message];
}

class UpdateTagLoadingState extends ControlCameraState {
  final List<int> id;

  const UpdateTagLoadingState(this.id);
  @override
  StateType get type => StateType.loading;
}
