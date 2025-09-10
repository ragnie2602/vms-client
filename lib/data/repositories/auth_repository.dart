import '../../domain/IRepositories/i_auth_repository.dart';
import '../../domain/usecases/login/login_output.dart';
import '../../domain/entities/user.dart';
import '../datasources/authenticate_service.dart';
import '../models/user_model.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthRepository {
  final AuthenticateService authenticateService;

  const AuthRepository({required this.authenticateService});

  @override
  Future<LoginOutput> login(String username, String password) async {
    try {
      print('Starting authentication for user: $username');
      
      // Call the real authenticate API
      final authReply = await authenticateService.authenticate(
        username: username,
        password: password,
      );
      
      // Create user from the authentication response
      final userModel = UserModel(
        id: String.fromCharCodes(authReply.uid),
        email: username,
        name: username, // Use username as name for now
        token: authReply.ssid, // Use session ID as token
      );

      return LoginOutput(
        user: userModel.toEntity(),
        isSuccess: true,
      );
    } catch (e) {
      print('Login failed: $e');
      
      return LoginOutput(
        user: const User(id: '', email: '', name: '', token: ''),
        isSuccess: false,
        errorMessage: 'Authentication failed: ${e.toString()}',
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