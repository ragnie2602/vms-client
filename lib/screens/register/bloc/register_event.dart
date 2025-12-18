import 'package:vms_flutter_client/core/base_bloc.dart';

class RegisterEvent extends BaseEvent {
  const RegisterEvent();
}

class RegisterSubmitted extends RegisterEvent {
  final String account;
  final String password;
  final String server;

  const RegisterSubmitted({
    required this.account,
    required this.password,
    required this.server,
  });

  @override
  List<Object> get props => [account, password];
}

class RegisterReset extends RegisterEvent {
  const RegisterReset();
}
