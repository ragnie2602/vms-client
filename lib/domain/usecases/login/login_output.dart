import '../base_output.dart';

class LoginOutput extends BaseOutput {
  final String account;
  final bool isSuccess;
  final String? errorMessage;

  const LoginOutput({
    required this.account,
    required this.isSuccess,
    this.errorMessage,
  });
}
