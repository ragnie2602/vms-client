import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';

import '../../i_repositories/i_auth_repository.dart';
import '../future_use_case.dart';
import 'login_input.dart';
import 'login_output.dart';

class LoginUseCase extends FutureUseCase<LoginInput, LoginOutput> {
  final IAuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    try {
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
        return LoginOutput(account: input.username, isSuccess: true);
      } else {
        return LoginOutput(
          account: input.username,
          isSuccess: false,
          errorMessage: 'Đăng nhập thất bại',
        );
      }
    } catch (e) {
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      if (errorMessage.startsWith('Network error:')) {
        errorMessage = 'Kết nối không thành công! Vui lòng kiểm tra lại địa chỉ máy chủ!';
      }
      return LoginOutput(account: input.username, isSuccess: false, errorMessage: errorMessage);
    }
  }
}
