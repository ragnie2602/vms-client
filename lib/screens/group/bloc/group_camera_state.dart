import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

class GroupCameraState extends BaseState {
  const GroupCameraState();
}

class GroupCameraLoadingState extends GroupCameraState {
  @override
  StateType get type => StateType.loading;
}

class AddGroupCameraSuccessState extends GroupCameraState {
  final List<DeviceGroup>? groups;
  const AddGroupCameraSuccessState({required this.groups});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [groups];
}

class AddGroupCameraFailState extends GroupCameraState {
  final String message;

  const AddGroupCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}
