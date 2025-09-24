import '../base_input.dart';

class LoginInput extends BaseInput {
  final String username;
  final String password;
  final String server;

  const LoginInput({
    required this.username,
    required this.password,
    required this.server,
  });
}
