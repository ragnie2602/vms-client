import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import '../../domain/i_repositories/i_auth_repository.dart';
import '../datasources/authenticate_service.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthRepository {
  final AuthenticateService authenticateService;

  const AuthRepository({required this.authenticateService});

  @override
  Future<void> connectSocket({
    required String host,
    required int port,
    required String uid,
    required String sessionId,
  }) async {
    await authenticateService.connectSocket(
      host: host,
      port: port,
      uid: uid,
      sessionId: sessionId,
    );
  }

  @override
  Future<bool> login(Authentication authentication) async {
    return authenticateService.login(authentication);
  }

  @override
  Future<Authentication> authenticate(
    String server,
    String username,
    String password,
  ) async {
    // Call the real authenticate API - let exceptions propagate
    final authReply = await authenticateService.authenticate(
      username: username,
      password: password,
      server: server,
    );

    return Authentication(
      account: username,
      sessionId: authReply.sessionId,
      uid: authReply.uid,
      host: authReply.websocketHost,
      port: authReply.websocketPort,
    );
  }

  @override
  Future<void> logout() async {
    await authenticateService.logOutSocket();
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }

  @override
  Future<void> register(String server, String account, String password) async {
    await authenticateService.register(
      account: account,
      password: password,
      server: server,
    );
  }
}
