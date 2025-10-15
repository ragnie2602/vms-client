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

  Future<User> addUser({
    required String account,
    required String password,
    String? tel,
    String? email,
    String? address,
    String? desc,
    String? fullName,
    bool? isAmin,
    bool? changePassDenied,
    bool? addCamDenied,
  }) async {
    final addUserRequest = AddUser_Request();
    if (account != null) {
      addUserRequest.account = account;
    }
    if (password != null) {
      addUserRequest.password = password;
    }
    addUserRequest.tel = tel ?? "";
    addUserRequest.email = email ?? "";
    addUserRequest.desc = desc ?? "";
    addUserRequest.userName = fullName ?? "";
    addUserRequest.address = address ?? "";
    addUserRequest.isAdmin = isAmin ?? false;
    addUserRequest.changePassDenied = changePassDenied ?? false;
    addUserRequest.addCamDenied = addCamDenied ?? false;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: addUserRequest.writeToBuffer(),
          type: PacketType.addUser,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => AddUser_Reply.fromBuffer(buffer).user,
    );
  }

  Future<List<int>> removeUser({
    required List<int> userId,
    String? rtspUrl,
  }) async {
    final deleteUserRequest = DeleteUser_Request();
    if (userId != null) {
      deleteUserRequest.userId = userId;
    }

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: deleteUserRequest.writeToBuffer(),
          type: PacketType.deleteUser,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(DeleteUser_Error.valueOf),
      (buffer) => DeleteUser_Reply.fromBuffer(buffer).userId,
    );
  }
}
