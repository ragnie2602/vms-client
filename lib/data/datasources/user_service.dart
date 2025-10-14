import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';

import '../proto/models/comm.command1.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'socket_api_client.dart';

class UserService {
  final SocketApiClient socketClient;

  const UserService(this.socketClient);

  Future<List<User>> getListUser() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: ListUser_Request().writeToBuffer(),
          type: PacketType.listUser,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => ListUser_Reply.fromBuffer(buffer).users,
    );
  }

  Future<User> addUser() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: AddUser_Request().writeToBuffer(),
          type: PacketType.addUser,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => AddUser_Reply.fromBuffer(buffer).user,
    );
  }
}
