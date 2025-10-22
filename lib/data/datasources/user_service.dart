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
      (failure) => throw failure.toMessageFailure(AddUser_Error.valueOf),
      (buffer) => AddUser_Reply.fromBuffer(buffer).user,
    );
  }

  Future<List<int>> deleteUser({
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

  Future<bool> resetPassword({
    required List<int> userId,
    String? newPassword,
  }) async {
    final resetPasswordRequest = ResetPassword_Request();
    if (userId != null) {
      resetPasswordRequest.userId = userId;
    }
    if (newPassword != null) {
      resetPasswordRequest.newPassword = newPassword;
    }

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: resetPasswordRequest.writeToBuffer(),
          type: PacketType.resetPassword,
        ),
      ),
    );
    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(ResetPassword_Error.valueOf),
      (buffer) {
        return true;
      },
    );
    // if (responseBuffer.isLeft) {
    //   return false;
    //   // throw responseBuffer.left!.toString();
    // }
    // return true;
  }

  Future<User> editUser({
    required List<int> userId,
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
    final editUserRequest = EditUser_Request();
    if (account != null) {
      editUserRequest.account = account;
    }
    if (userId != null) {
      editUserRequest.userId = userId;
    }
    if (password != null) {
      editUserRequest.password = password;
    }
    editUserRequest.tel = tel ?? "";
    editUserRequest.email = email ?? "";
    editUserRequest.desc = desc ?? "";
    editUserRequest.userName = fullName ?? "";
    editUserRequest.address = address ?? "";
    editUserRequest.isAdmin = isAmin ?? false;
    editUserRequest.changePassDenied = changePassDenied ?? false;
    editUserRequest.addCamDenied = addCamDenied ?? false;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: editUserRequest.writeToBuffer(),
          type: PacketType.editUser,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(EditUser_Error.valueOf),
      (buffer) => EditUser_Reply.fromBuffer(buffer).user,
    );
  }
}
