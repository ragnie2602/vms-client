import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart';

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
          id: DateTime.now().microsecondsSinceEpoch,
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
}
