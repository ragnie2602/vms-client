import 'package:vms_flutter_client/core/base_bloc.dart';

class LoginEvent extends BaseEvent {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;

  const LoginSubmitted({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class LoginReset extends LoginEvent {
  const LoginReset();
}