import '../base_input.dart';

class RegisterInput extends BaseInput {
  final String account;
  final String password;
  final String server;

  const RegisterInput({
    required this.account,
    required this.password,
    required this.server,
  });
}
