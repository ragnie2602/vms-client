import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/app_keys.dart';

import '../../i_repositories/i_auth_repository.dart';
import '../future_use_case.dart';
import 'login_input.dart';
import 'login_output.dart';

class LoginUseCase extends FutureUseCase<LoginInput, LoginOutput> {
  final IAuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    final authentication = await authRepository.authenticate(
      input.server,
      input.username,
      input.password,
    );
    final status = await authRepository.login(authentication);

    if (status) {
      await AppData.instance.save<String>(AppKeys.SP_USERNAME_KEY, input.username);
      await AppData.instance.save<String>(AppKeys.SP_PASSWORD_KEY, input.password);
      await AppData.instance.save<String>(AppKeys.SP_SERVER_KEY, input.server);
    }

    return LoginOutput(account: input.username, isSuccess: status);
  }
}
