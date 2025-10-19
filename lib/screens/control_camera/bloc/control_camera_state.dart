import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/add_camera.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';

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
  const RemoveCameraFromGroupFailState(this.message);
  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}
