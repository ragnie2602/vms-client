import '../entities/authentication/authentication.dart';
import 'i_base_repository.dart';

abstract class IAuthRepository extends IBaseRepository {
  Future<Authentication> authenticate(String username, String password);
  Future<bool> login(Authentication authentication);
  Future<void> logout();
  Future<bool> isLoggedIn();
}
