import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

class ControlCameraState extends BaseState {
  const ControlCameraState();
}

class ControlCameraLoadingState extends ControlCameraState {
  @override
  StateType get type => StateType.loading;
}

class AddCameraSuccessState extends ControlCameraState {
  final List<DeviceGroup>? groups;
  const AddCameraSuccessState({required this.groups});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [groups];
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
