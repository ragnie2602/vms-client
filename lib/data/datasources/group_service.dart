import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/utils/unique_id.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';

import '../proto/models/comm.command1.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'socket_api_client.dart';

class GroupService {
  final SocketApiClient socketClient;

  const GroupService(this.socketClient);

  Future<List<DeviceGroup>> getAllGroup() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id:  UniqueId.getUniqueId(PacketType.getAllGroup.value),
          data: GetAllGroup_Request().writeToBuffer(),
          type: PacketType.getAllGroup,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => GetAllGroup_Reply.fromBuffer(buffer).groups,
    );
  }

  Future<List<DeviceGroup>> addGroupCamera({
    String? groupName,
    List<int>? parentGroupId,
  }) async {
    final addGroupCameraRequest = AddGroupCamera_Request();
    if (groupName != null) {
      addGroupCameraRequest.groupName = groupName;
    }
    if (parentGroupId != null) {
      addGroupCameraRequest.parentGroupId = parentGroupId;
    }
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: addGroupCameraRequest.writeToBuffer(),
          type: PacketType.addGroupCamera,
        ),
      ),
    );
    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(AddGroupCamera_Error.valueOf),
      (buffer) => AddGroupCamera_Reply.fromBuffer(buffer).groups,
    );
  }

  // xóa nhóm camera
  Future<List<DeviceGroup>> removeGroupCamera({List<int>? groupId}) async {
    final removeGroupCameraRequest = RemoveGroupCamera_Request();

    if (groupId != null) {
      removeGroupCameraRequest.groupId = groupId;
    }
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: removeGroupCameraRequest.writeToBuffer(),
          type: PacketType.removeGroupCamera,
        ),
      ),
    );
    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(RemoveGroupCamera_Error.valueOf),
      (buffer) => RemoveGroupCamera_Reply.fromBuffer(buffer).groups,
    );
  }

  // sửa nhóm camera
  Future<List<DeviceGroup>> updateGroupCamera({
    List<int>? groupId,
    String? groupName,
    List<int>? parentGroupId,
  }) async {
    final updateGroupCameraRequest = UpdateGroupDevice_Request();
    if (groupName != null) {
      updateGroupCameraRequest.groupName = groupName;
    }
    if (parentGroupId != null) {
      updateGroupCameraRequest.parentGroup = parentGroupId;
    }
    if (groupId != null) {
      updateGroupCameraRequest.groupId = groupId;
    }
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: updateGroupCameraRequest.writeToBuffer(),
          type: PacketType.updateGroupDevice,
        ),
      ),
    );
    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(UpdateGroupDevice_Error.valueOf),
      (buffer) => UpdateGroupDevice_Reply.fromBuffer(buffer).groups,
    );
  }

  // share group
  Future<List<int>> shareGroup({
    List<int>? groupId,
    DeviceGroupRole? role,
    List<int>? accountInviteId,
  }) async {
    final shareGroupRequest = ShareGroupCamera_Request();
    if (groupId != null) {
      shareGroupRequest.groupId = groupId;
    }
    if (role != null) {
      shareGroupRequest.role =
          ShareGroupCamera_GroupShareRole.valueOf(role.value) ??
          ShareGroupCamera_GroupShareRole.VIEW;
    }
    if (accountInviteId != null) {
      shareGroupRequest.accountInviteId = accountInviteId;
    }
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: shareGroupRequest.writeToBuffer(),
          type: PacketType.shareGroupCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(ShareGroupCamera_Error.valueOf),
      (buffer) => ShareGroupCamera_Reply.fromBuffer(buffer).groupId,
    );
  }
}
