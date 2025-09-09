import '../base_input.dart';

class LoginInput extends BaseInput {
  final String username;
  final String password;

  const LoginInput({
    required this.username,
    required this.password,
  });
}