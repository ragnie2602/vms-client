import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';

import '../../IRepositories/i_auth_repository.dart';
import '../future_use_case.dart';
import 'login_input.dart';
import 'login_output.dart';

class LoginUseCase extends FutureUseCase<LoginInput, LoginOutput> {
  final IAuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    final Authentication authentication = await authRepository.login(input.username, input.password);
    return LoginOutput(account: input.username, isSuccess: authentication.sessionId.isNotEmpty && authentication.uid.isNotEmpty); 
  }
}