import 'dart:async';
import 'dart:typed_data';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/models/response/authenticate_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import 'package:vms_flutter_client/screens/login/login_screen.dart';

import '../models/packet.dart';
import '../proto/models/comm.profile.pb.dart';
import 'http_client.dart';
import 'socket_api_client.dart';

class AuthenticateService {
  final HttpClient _httpClient;
  final SocketApiClient _socketApiClient;

  AuthenticateService({
    required HttpClient httpClient,
    required SocketApiClient socketApiClient,
  }) : _httpClient = httpClient,
       _socketApiClient = socketApiClient;

  Future<AuthenticateResponse> authenticate({
    required String username,
    required String password,
    required String server,
  }) async {
    try {
      final request = {
        'username': username,
        'password': password,
        'appVersion': EnvService.appVersion,
        'platform': EnvService.platform,
      };

      final Map<String, dynamic> response = await _httpClient.post(
        url: EndPoints.authenticate,
        data: request,
      );

      await AppData.instance.save<String>(AppKeys.SP_ACCESS_TOKEN, response['accessToken']);
      
      return AuthenticateResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
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
            data: Login_Request(
              uid: data.uid,
              sessionId: data.sessionId,
            ).writeToBuffer(),
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
          final loginReply = Login_Reply.fromBuffer(response.right!);
          Logger.log("Logged in as: ${loginReply.profile.account}");
          loginStatus.text += "Đang đăng thành công\n";

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
    await _httpClient.post(url: EndPoints.logout, data: null);
  }

  Future<void> register({
    required String account,
    required String password,
    required String server,
  }) async {
    try {
      final request = Register_Request(
        account: account,
        password: password,
      );

      loginStatus.text +=
          "--- Thực hiện đăng ký tài khoản '$account' tại '$server' ---\n";

      final requestBytes = request.writeToBuffer();
      final responseBytes = await _httpClient.post(
        url: '$server${EnvService.registerEndpoint}',
        data: Uint8List.fromList(requestBytes),
      );
      final reply = Reply.fromBuffer(responseBytes);

      if (reply.isSuccess) {
        loginStatus.text += "Đăng ký thành công ($account)\n";
      } else {
        final registerError = Register_Error.valueOf(reply.type);
        final errorMessage = _getRegisterErrorMessage(registerError);
        loginStatus.text += "Đăng ký thất bại: $errorMessage\n";
        throw Exception(errorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getRegisterErrorMessage(Register_Error? error) {
    switch (error) {
      case Register_Error.ACCOUNT_EXIST:
        return 'Tài khoản đã tồn tại';
      case Register_Error.OTP_NOT_MATCH:
        return 'Mã OTP không khớp';
      case Register_Error.OTP_EXPIRED:
        return 'Mã OTP đã hết hạn';
      case Register_Error.EMAIL_INVALID:
        return 'Email không hợp lệ';
      case Register_Error.TEL_INVALID:
        return 'Số điện thoại không hợp lệ';
      case Register_Error.PASSWORD_INVALID:
        return 'Mật khẩu không hợp lệ';
      case Register_Error.ACCOUNT_INVALID:
        return 'Tài khoản không hợp lệ';
      case Register_Error.PASSWORD_CONTAINING_SPECIAL_CHARACTERS:
        return 'Mật khẩu chứa ký tự đặc biệt không hợp lệ';
      case Register_Error.PASSWORD_WEAKNESS:
        return 'Mật khẩu quá yếu';
      default:
        return 'Đăng ký thất bại';
    }
  }
}
