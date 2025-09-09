import '../../entities/user.dart';
import '../base_output.dart';

class LoginOutput extends BaseOutput {
  final User user;
  final bool isSuccess;
  final String? errorMessage;

  const LoginOutput({
    required this.user,
    required this.isSuccess,
    this.errorMessage,
  });
}