import '../../i_repositories/i_auth_repository.dart';
import '../future_use_case.dart';
import 'register_input.dart';
import 'register_output.dart';

class RegisterUseCase extends FutureUseCase<RegisterInput, RegisterOutput> {
  final IAuthRepository authRepository;

  const RegisterUseCase({required this.authRepository});

  @override
  Future<RegisterOutput> buildUseCase(RegisterInput input) async {
    try {
      await authRepository.register(
        input.server,
        input.account,
        input.password,
      );

      return RegisterOutput(
        account: input.account,
        isSuccess: true,
      );
    } catch (e) {
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      if (errorMessage.startsWith('Network error:')) {
        errorMessage = 'Kết nối không thành công! Vui lòng kiểm tra lại địa chỉ máy chủ!';
      }
      return RegisterOutput(
        account: input.account,
        isSuccess: false,
        errorMessage: errorMessage,
      );
    }
  }
}
