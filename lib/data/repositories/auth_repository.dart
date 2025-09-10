import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import '../../domain/IRepositories/i_auth_repository.dart';
import '../../domain/usecases/login/login_output.dart';
import '../../domain/entities/user/user.dart';
import '../datasources/authenticate_service.dart';
import '../models/user_model.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthRepository {
  final AuthenticateService authenticateService;

  const AuthRepository({required this.authenticateService});

  @override
  Future<Authentication> login(String username, String password) async {
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
        ssid: authReply.ssid
      );
    } catch (e) {
      return Authentication(
        account: username, 
        sessionId: [], 
        uid: [], 
        ssid: ''
      );
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