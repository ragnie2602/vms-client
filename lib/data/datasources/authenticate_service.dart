import 'dart:async';
import 'dart:typed_data';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import 'package:vms_flutter_client/screens/login/login_screen.dart';

import '../models/packet.dart';
import '../proto/models/comm.profile.pb.dart';
import 'protobuf_http_client.dart';
import 'socket_api_client.dart';

class AuthenticateService {
  final ProtobufHttpClient _httpClient;
  final SocketApiClient _socketApiClient;

  AuthenticateService({
    required ProtobufHttpClient httpClient,
    required SocketApiClient socketApiClient,
  }) : _httpClient = httpClient,
       _socketApiClient = socketApiClient;

  Future<Authenticate_Reply> authenticate({
    required String username,
    required String password,
    required String server,
  }) async {
    try {
      // Create the authenticate request with only required fields
      final request = Authenticate_Request(
        account: username,
        password: password,
        platform: 5, // Fixed platform value as requested
      );

      loginStatus.text += "--- Thực hiện xác thực tài khoản '$username' tại '$server' ---\n";

      // Serialize the request to protobuf bytes
      final requestBytes = request.writeToBuffer();
      // Send the request and get response
      final responseBytes = await _httpClient.post(
        url: '$server${EnvService.authenticateEndpoint}',
        data: Uint8List.fromList(requestBytes),
      );
      final reply = Reply.fromBuffer(responseBytes);

      if (reply.isSuccess) {
        final authenticateReplyBytes = reply.reply.value;
        final authenticateReply = Authenticate_Reply.fromBuffer(authenticateReplyBytes);

        loginStatus.text += "Xác thực thành công ($username)\n";

        return authenticateReply;
      } else {
        final msg = Authenticate_Error.valueOf(reply.type).translate();
        Logger.error('Authenticate failed: $msg');
        loginStatus.text += "Xác thực thất bại ($msg)\n";
        return Authenticate_Reply();
      }
    } catch (e) {
      loginStatus.text += "Xác thực thất bại (${e.toString()})\n";
      rethrow;
    }
  }

  Future<bool> login(Authentication data) async {
    if (data.uid.isEmpty || data.sessionId.isEmpty || data.host.isEmpty) return false;

    loginStatus.text += "--- Thực hiện đăng nhập ---\n";
    loginStatus.text += "Đang kết nối socket ws://${data.host}:${data.port}...\n";

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
}
