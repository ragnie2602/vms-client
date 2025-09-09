import '../../domain/IRepositories/i_auth_repository.dart';
import '../../domain/usecases/login/login_output.dart';
import '../../domain/entities/user.dart';
import '../datasources/base_api_client.dart';
import '../models/user_model.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthRepository {
  final BaseApiClient apiClient;

  const AuthRepository({required this.apiClient});

  @override
  Future<LoginOutput> login(String username, String password) async {
    try {
      // Simulate API call with Socket.IO
      await apiClient.connect();
      
      // Send login request
      apiClient.send({
        'type': 'login',
        'username': username,
        'password': password,
      });

      // For testing, simulate successful login response
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock successful response
      final userModel = UserModel(
        id: '123',
        email: username,
        name: 'Test User',
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
      );

      print("Login successful with user: ${userModel.toEntity()}");

      return LoginOutput(
        user: userModel.toEntity(),
        isSuccess: true,
      );
    } catch (e) {
      return LoginOutput(
        user: const User(id: '', email: '', name: '', token: ''),
        isSuccess: false,
        errorMessage: 'Login failed: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> logout() async {
    await apiClient.disconnect();
  }

  @override
  Future<bool> isLoggedIn() async {
    return apiClient.isConnected;
  }
}