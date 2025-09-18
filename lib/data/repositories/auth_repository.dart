import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import '../../domain/i_repositories/i_auth_repository.dart';
import '../datasources/authenticate_service.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthRepository {
  final AuthenticateService authenticateService;

  const AuthRepository({required this.authenticateService});

  @override
  Future<bool> login(Authentication authentication) async {
    return authenticateService.login(authentication);
  }

  @override
  Future<Authentication> authenticate(String username, String password) async {
    try {
      // Call the real authenticate API
      final authReply = await authenticateService.authenticate(
        username: username,
        password: password,
      );

      return Authentication(
        account: username,
        sessionId: authReply.sessionId,
        uid: authReply.uid,
        ssid: authReply.ssid,
        host: authReply.webSockHost,
        port: authReply.webSockPort,
      );
    } catch (e) {
      return Authentication(account: username, sessionId: [], uid: [], ssid: '', host: '', port: 0);
    }
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }
}
