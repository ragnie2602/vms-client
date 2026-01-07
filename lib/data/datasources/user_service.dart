import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.profile.pb.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';

import '../proto/models/comm.command1.pb.dart';
import 'socket_api_client.dart';

class UserService {
  final SocketApiClient socketClient;
  final HttpClient httpClient;

  const UserService(this.socketClient, this.httpClient);

  Future<List<UserEntity>> getListUser() async {
    final List<dynamic> response = await httpClient.get(EndPoints.getListUser);
    return response.map((e) => UserEntity.fromJson(e)).toList();
  }

  Future<UserEntity> addUser({
    required String account,
    required String password,
    String? tel,
    String? email,
    String? address,
    String? desc,
    String? fullName,
    bool? isAdmin,
    bool? changePassDenied,
    bool? addCamDenied,
  }) async {
    final requestData = {
      "username": account,
      "password": password,
      "email": email,
      "phone": tel,
      "fullname": fullName,
      "tenantId": 1,
    };
    if (isAdmin == true) {
      requestData['roleId'] = 1;
    } else {
      List<String> _permissions = [];
      if (changePassDenied != true) _permissions.add("auth.change-password");
      if (addCamDenied != true) _permissions.add("camera.create");

      requestData["permissions"] = _permissions;
    }

    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.post(url: EndPoints.addUser, data: requestData),
    );

    if (response.code != 201) throw Exception(response.message);

    return UserEntity.fromJson(response.data);
  }

  Future<int> deleteUser({required int userId, String? rtspUrl}) async {
    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.delete(url: '${EndPoints.deleteUser}/$userId'),
    );

    if (response.code != 204) throw Exception(response.message);

    return userId;
  }

  Future<bool> resetPassword({required List<int> userId, String? newPassword}) async {
    final resetPasswordRequest = ResetPassword_Request();
    resetPasswordRequest.userId = userId;
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
      (failure) => throw failure.toMessageFailure(
        ResetPassword_Error.valueOf,
        PacketType.resetPassword.value,
      ),
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

  Future<UserEntity> editUser({
    required int userId,
    required String account,
    String? tel,
    String? email,
    String? address,
    String? desc,
    String? fullName,
    bool? isAdmin,
    bool? changePassDenied,
    bool? addCamDenied,
  }) async {
    final Map<String, dynamic> requestData = {
      "username": account,
      "email": email,
      "phone": tel,
      "fullname": fullName,
    };
    if (isAdmin == true) {
      requestData["isAdmin"] = true;
    } else {
      List<String> _permissions = [];
      if (changePassDenied != true) _permissions.add("auth.change-password");
      if (addCamDenied != true) _permissions.add("camera.create");

      requestData["permissions"] = _permissions;
    }

    final response = await httpClient.put(
      url: '${EndPoints.editUser}/$userId',
      data: requestData,
      successCode: [200],
    );

    return UserEntity.fromJson(response);
  }

  Future<bool> changeMyPassword({
    required String current,
    required String password,
    bool? kickOthers,
  }) async {
    // final changePasswordRequest = ChangePassword_Request();
    // changePasswordRequest.current = current;
    // changePasswordRequest.password = password;
    // changePasswordRequest.kickOthers = kickOthers ?? false;

    // final responseBuffer = await socketClient.send<List<int>>(
    //   SocketRequestPayload(
    //     Packet(
    //       id: DateTime.now().microsecondsSinceEpoch,
    //       data: changePasswordRequest.writeToBuffer(),
    //       type: PacketType.changePassword,
    //     ),
    //   ),
    // );

    // return responseBuffer.fold(
    //   (failure) => throw failure.toMessageFailure(
    //     ChangePassword_Error.valueOf,
    //     PacketType.changePassword.value,
    //   ),
    //   (buffer) => true,
    // );
    return true;
  }

  Future<bool> updateMyProfile({
    String? displayName,
    String? email,
    String? tel,
    String? address,
  }) async {
    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.post(
        url: '${EndPoints.updateProfile}/${AppData.instance.profile?.uid}',
        data: {'fullName': displayName, 'email': email, 'phone': tel},
      ),
    );

    if (response.code != 200) throw Exception(response.message);

    return true;
  }
}
