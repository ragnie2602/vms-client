import '../entities/authentication/authentication.dart';

abstract class IAuthRepository {
  Future<Authentication> authenticate(String server, String username, String password);
  Future<bool> login(Authentication authentication);
  Future<void> logout();
  Future<bool> isLoggedIn();
}
