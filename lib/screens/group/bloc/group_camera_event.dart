import 'package:vms_flutter_client/core/base_bloc.dart';

class GroupCameraEvent extends BaseEvent {
  const GroupCameraEvent();
}

class GetAllGroupCameraEvent extends GroupCameraEvent {}

class AddGroupCameraEvent extends GroupCameraEvent {
  final String groupName;
  final List<int> parentGroupId;
  const AddGroupCameraEvent({
    required this.groupName,
    required this.parentGroupId,
  });
  @override
  List<Object> get props => [groupName, parentGroupId];
}

class RemoveGroupCameraEvent extends GroupCameraEvent {
  final List<int> groupId;
  const RemoveGroupCameraEvent({required this.groupId});
  @override
  List<Object?> get props => [groupId];
}

class UpdateGroupCameraEvent extends GroupCameraEvent {
  final List<int> groupId;
  final String groupName;
  final List<int> parentGroupId;
  const UpdateGroupCameraEvent({
    required this.groupId,
    required this.groupName,
    required this.parentGroupId,
  });
  @override
  List<Object?> get props => [groupId, groupName, parentGroupId];
}
