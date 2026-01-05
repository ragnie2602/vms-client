import 'package:vms_flutter_client/data/models/response/authenticate_response.dart';

import '../entities/authentication/authentication.dart';

abstract class IAuthRepository {
  Future<AuthenticateResponse> authenticate(String server, String username, String password);
  Future<bool> login(Authentication authentication);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<void> register(String server, String account, String password);

  Future<void> connectSocket({
    required String host,
    required int port,
    required String uid,
    required String sessionId,
  });
}
