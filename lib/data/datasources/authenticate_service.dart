import 'dart:async';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/models/response/authenticate_response.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import 'package:vms_flutter_client/screens/login/login_screen.dart';

import '../models/packet.dart';
import '../proto/models/comm.profile.pb.dart';
import 'http_client.dart';
import 'socket_api_client.dart';

class AuthenticateService {
  final HttpClient _httpClient;
  final SocketApiClient _socketApiClient;

  AuthenticateService({required HttpClient httpClient, required SocketApiClient socketApiClient})
    : _httpClient = httpClient,
      _socketApiClient = socketApiClient;

  Future<AuthenticateResponse> authenticate({
    required String username,
    required String password,
    required String server,
  }) async {
    final request = {
      'username': username,
      'password': password,
      'appVersion': EnvService.appVersion,
      'platform': EnvService.platform,
    };

    final BaseResponse response = BaseResponse.fromJson(
      await _httpClient.post(url: '${EndPoints.baseAuth}${EndPoints.authenticate}', data: request),
    );

    if (response.code != 200) throw Exception(response.message);

    await AppData.instance.save<String>(AppKeys.SP_ACCESS_TOKEN, response.data['accessToken']);

    return AuthenticateResponse.fromJson(response.data);
  }

  Future<void> connectSocket({
    required String host,
    required int port,
    required String sessionId,
    required String uid,
  }) async {
    await _socketApiClient.connect(SocketConnectionParams(host, port));
    await _socketApiClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: Login_Request(uid: uid, sessionId: sessionId).writeToBuffer(),
          type: PacketType.login,
        ),
      ),
    );
  }

  Future<bool> login(Authentication data) async {
    if (data.uid.isEmpty || data.sessionId.isEmpty || data.host.isEmpty) return false;

    final status = await _socketApiClient.connect(SocketConnectionParams(data.host, data.port));
    if (status) {
      loginStatus.text += "Kết nối socket thành công\n";
      loginStatus.text += "Thực hiện đăng nhập...\n";
      final response = await _socketApiClient.send<List<int>>(
        SocketRequestPayload(
          Packet(
            id: DateTime.now().microsecondsSinceEpoch,
            data: Login_Request(uid: data.uid, sessionId: data.sessionId).writeToBuffer(),
            type: PacketType.login,
          ),
        ),
      );

      return response.fold(
        (failure) {
          final msg = failure.parseMessage(Login_Error.valueOf);
          loginStatus.text += "Đăng nhập thất bại ($msg)\n";
          return false;
        },
        (buffer) {
          final loginReply = Login_Reply.fromBuffer(buffer);
          Logger.log("Logged in as: ${loginReply.profile.account}");
          loginStatus.text += "Đăng nhập thành công\n";

          return true;
        },
      );
    }

    loginStatus.text += "Kết nối socket thất bại\n";
    return false;
  }

  Future<void> logOutSocket() async {
    await _socketApiClient.disconnect();
    AppData.instance.profile = null;
  }

  Future<void> logout() async {
    final BaseResponse response = BaseResponse.fromJson(
      await _httpClient.post(url: '${EndPoints.baseAuth}${EndPoints.logout}', data: null),
    );

    if (response.code != 200) throw Exception(response.message);
  }

  Future<void> register({
    required String account,
    required String password,
    required String server,
  }) async {
    // try {
    //   final request = Register_Request(account: account, password: password);

    //   loginStatus.text += "--- Thực hiện đăng ký tài khoản '$account' tại '$server' ---\n";

    //   final requestBytes = request.writeToBuffer();
    //   final responseBytes = await _httpClient.post(
    //     url: '$server${EnvService.registerEndpoint}',
    //     data: Uint8List.fromList(requestBytes),
    //   );
    //   final reply = Reply.fromBuffer(responseBytes);

    //   if (reply.isSuccess) {
    //     loginStatus.text += "Đăng ký thành công ($account)\n";
    //   } else {
    //     final registerError = Register_Error.valueOf(reply.type);
    //     final errorMessage = _getRegisterErrorMessage(registerError);
    //     loginStatus.text += "Đăng ký thất bại: $errorMessage\n";
    //     throw Exception(errorMessage);
    //   }
    // } catch (e) {
    //   rethrow;
    // }
  }
}
