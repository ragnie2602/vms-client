import 'package:vms_flutter_client/core/base_bloc.dart';

class UserManagementEvent extends BaseEvent {
  const UserManagementEvent();
}

class GetListUserEvent extends UserManagementEvent {}

class AddUserEvent extends UserManagementEvent {
  final String account;
  final String email;
  final String tel;
  final String address;
  final bool isAdmin;
  final String desc;
  final String password;
  final bool changePassDenied;
  final bool addCamDenied;
  const AddUserEvent({
    required this.account,
    required this.email,
    required this.tel,
    required this.address,
    required this.isAdmin,
    required this.desc,
    required this.password,
    required this.changePassDenied,
    required this.addCamDenied,
  });
  @override
  List<Object> get props => [
    account,
    email,
    tel,
    address,
    isAdmin,
    desc,
    password,
    changePassDenied,
    addCamDenied,
  ];
}
