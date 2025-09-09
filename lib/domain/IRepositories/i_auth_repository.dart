import '../usecases/login/login_output.dart';
import 'i_base_repository.dart';

abstract class IAuthRepository extends IBaseRepository {
  Future<LoginOutput> login(String username, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
}