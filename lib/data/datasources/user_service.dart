import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';

import 'socket_api_client.dart';

class UserService {
  final SocketApiClient socketClient;
  final HttpClient httpClient;

  const UserService(this.socketClient, this.httpClient);

  Future<List<UserEntity>> getListUser() async {
    final Map<String, dynamic> raw = await httpClient.get(EndPoints.baseUser);
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);

    return (response.data as List<dynamic>).map((e) => UserEntity.fromJson(e)).toList();
  }

  Future<UserEntity> addUser({
    required String account,
    required String password,
    String? fullName,
    String? email,
    String? tel,
    String? description,
    int? roleId,
  }) async {
    final requestData = {
      "username": account,
      "password": password,
      "description": description,
      "email": email,
      "fullname": fullName,
      "phone": tel,
      "roleId": roleId,
    };

    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.post(url: EndPoints.baseUser, data: requestData),
    );

    if (response.code != 201) throw Exception(response.message);

    return UserEntity.fromJson(response.data);
  }

  Future<int> deleteUser({required int userId, String? rtspUrl}) async {
    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.delete(url: '${EndPoints.baseUser}/$userId'),
    );

    if (response.code != 204) throw Exception(response.message);

    return userId;
  }

  Future<bool> resetPassword({required int userId, String? newPassword}) async {
    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.put(
        url: '${EndPoints.baseUser}/$userId/${EndPoints.resetPassword}',
        data: {'newPassword': newPassword},
      ),
    );

    if (response.code != 200) throw Exception(response.message);

    return true;
  }

  Future<UserEntity> editUser({
    required int userId,
    String? tel,
    String? email,
    String? desc,
    String? fullName,
    required int roleId,
  }) async {
    final Map<String, dynamic> requestData = {
      "email": email,
      "phone": tel,
      "fullname": fullName,
      "description": desc,
      "roleId": roleId,
    };

    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.put(url: '${EndPoints.baseUser}/$userId', data: requestData),
    );

    if (response.code != 200) throw Exception(response.message);

    return UserEntity.fromJson(response.data);
  }

  Future<bool> changeMyPassword({
    required String current,
    required String password,
    bool? kickOthers,
  }) async {
    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.put(
        url: '${EndPoints.baseAuth}${EndPoints.changePassword}',
        data: {'oldPassword': current, 'newPassword': password},
      ),
    );

    if (response.code != 200) throw Exception(response.message);

    return true;
  }

  Future<bool> updateMyProfile({
    String? displayName,
    String? email,
    String? tel,
    String? address,
  }) async {
    final BaseResponse response = BaseResponse.fromJson(
      await httpClient.put(
        url: '${EndPoints.baseAuth}${EndPoints.updateProfile}',
        data: {'fullName': displayName, 'email': email, 'phone': tel},
      ),
    );

    if (response.code != 200) throw Exception(response.message);

    return true;
  }
}
