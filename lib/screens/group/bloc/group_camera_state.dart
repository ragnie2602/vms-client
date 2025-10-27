import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';

class GroupCameraState extends BaseState {
  const GroupCameraState();
}

class GroupCameraLoadingState extends GroupCameraState {
  @override
  StateType get type => StateType.loading;
}

class GetAllGroupCameraSuccessState extends GroupCameraState {
  final List<DeviceGroup>? groups;
  final TreeNode<DeviceGroup> tree;

  GetAllGroupCameraSuccessState({required this.groups})
    : tree = TreeNode.root() {
    for (var group in groups ?? <DeviceGroup>[]) {
      tree.add(group.toTreeNode());
    }
  }

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [groups];

  GetAllGroupCameraSuccessState copyWith({List<DeviceGroup>? groups}) {
    return GetAllGroupCameraSuccessState(groups: groups ?? this.groups);
  }
}

class GetAllGroupCameraFailState extends GroupCameraState {
  final String message;

  const GetAllGroupCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class AddGroupCameraLoadingState extends GroupCameraState {
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

// class RemoveGroupCameraSuccessState extends GroupCameraState {
//   final List<DeviceGroup>? groups;
//   const RemoveGroupCameraSuccessState({required this.groups});

//   @override
//   StateType get type => StateType.success;
//   @override
//   List<Object?> get props => [groups];
// }

class RemoveGroupCameraFailState extends GroupCameraState {
  final String message;

  const RemoveGroupCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class UpdateGroupCameraSuccessState extends GroupCameraState {
  final List<DeviceGroup>? groups;
  const UpdateGroupCameraSuccessState({required this.groups});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [groups];
}

class UpdateGroupCameraFailState extends GroupCameraState {
  final String message;

  const UpdateGroupCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class ListShareInviteGroupSuccessState extends GroupCameraState {
  final List<int> groupId;
  final List<InviteMessageEntity> inviteMessages;
  const ListShareInviteGroupSuccessState({
    required this.groupId,
    required this.inviteMessages,
  });
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [groupId, inviteMessages];
}

class ShareGroupFailState extends GroupCameraState {
  final String message;

  const ShareGroupFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}
