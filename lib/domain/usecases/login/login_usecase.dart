import '../../i_repositories/i_auth_repository.dart';
import '../future_use_case.dart';
import 'login_input.dart';
import 'login_output.dart';

class LoginUseCase extends FutureUseCase<LoginInput, LoginOutput> {
  final IAuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    final authentication = await authRepository.authenticate(input.username, input.password);
    final status = await authRepository.login(authentication);

    return LoginOutput(account: input.username, isSuccess: status);
  }
}
