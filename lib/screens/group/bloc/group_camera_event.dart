import 'package:vms_flutter_client/core/base_bloc.dart';

class GroupCameraEvent extends BaseEvent {
  const GroupCameraEvent();
}

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
