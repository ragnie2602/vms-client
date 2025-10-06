import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';

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
}
