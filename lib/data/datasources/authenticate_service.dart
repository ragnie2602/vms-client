import 'dart:typed_data';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

import '../proto/models/comm.profile.pb.dart';
import '../../core/env_service.dart';
import 'protobuf_http_client.dart';

class AuthenticateService {
  final ProtobufHttpClient _httpClient;
  
  AuthenticateService({required ProtobufHttpClient httpClient})
      : _httpClient = httpClient;
  
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
      final responseBytes = await _httpClient.authenticate(
        Uint8List.fromList(requestBytes),
      );
      
      final reply = Reply.fromBuffer(responseBytes);

      if (reply.type == 0) {
        final authenticateReplyBytes = reply.reply.value;
        final authenticateReply = Authenticate_Reply.fromBuffer(authenticateReplyBytes);
        return authenticateReply;
      } else {
        return Authenticate_Reply();
      }
    } catch (e) {
      rethrow;
    }
  }
}