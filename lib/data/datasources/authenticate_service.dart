import 'dart:async';
import 'dart:typed_data';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';

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
  }) async {
    try {
      // Create the authenticate request with only required fields
      final request = Authenticate_Request(
        account: username,
        password: password,
        platform: 5, // Fixed platform value as requested
      );

      // Serialize the request to protobuf bytes
      final requestBytes = request.writeToBuffer();
      // Send the request and get response
      final responseBytes = await _httpClient.authenticate(Uint8List.fromList(requestBytes));
      final reply = Reply.fromBuffer(responseBytes);

      if (reply.isSuccess) {
        final authenticateReplyBytes = reply.reply.value;
        final authenticateReply = Authenticate_Reply.fromBuffer(authenticateReplyBytes);
        return authenticateReply;
      } else {
        Logger.error('Authenticate failed: ${Authenticate_Error.valueOf(reply.type).translate()}');
        return Authenticate_Reply();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> login(Authentication data) async {
    if (data.uid.isEmpty || data.sessionId.isEmpty || data.host.isEmpty) return false;

    final status = await _socketApiClient.connect(SocketConnectionParams(data.host, data.port));
    if (status) {
      final response = await _socketApiClient.send<List<int>>(
        SocketRequestPayload(
          Packet(
            id: DateTime.now().microsecondsSinceEpoch,
            data: Login_Request(uid: data.uid, sessionId: data.sessionId).writeToBuffer(),
            type: PacketType.login,
          ),
        ),
      );

      if (response != null) {
        final loginReply = Login_Reply.fromBuffer(response);
        Logger.log("Logged in as: ${loginReply.profile.account}");
      }

      return response != null;
    }

    return false;
  }
}
