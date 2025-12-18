import '../base_output.dart';

class RegisterOutput extends BaseOutput {
  final String account;
  final bool isSuccess;
  final String? errorMessage;

  const RegisterOutput({
    required this.account,
    required this.isSuccess,
    this.errorMessage,
  });
}
