import 'package:vms_flutter_client/core/base_bloc.dart';

class UserManagementEvent extends BaseEvent {
  const UserManagementEvent();
}

class GetListUserEvent extends UserManagementEvent {}

class AddUser extends UserManagementEvent {
  final String account;
  final String? email;
  final String? fullName;
  final String? tel;
  final String? desc;
  final String password;
  final int? roleId;

  const AddUser({
    required this.account,
    this.email,
    this.tel,
    this.desc,
    this.fullName,
    required this.password,
    this.roleId,
  });

  @override
  List<Object?> get props => [account, email, fullName, tel, desc, password, roleId];
}

class DeleteUserEvent extends UserManagementEvent {
  final int userId;
  final String uidStr;
  const DeleteUserEvent({required this.userId, required this.uidStr});
  @override
  List<Object> get props => [userId, uidStr];
}

class ResetPassWordEvent extends UserManagementEvent {
  final int userId;
  final String newPassword;
  const ResetPassWordEvent({required this.userId, required this.newPassword});
  @override
  List<Object> get props => [userId, newPassword];
}

class EditUser extends UserManagementEvent {
  final int userId;
  final String? email;
  final String? tel;
  final String? desc;
  final String? fullName;
  final int roleId;

  const EditUser({
    required this.userId,
    this.email,
    this.tel,
    this.fullName,
    this.desc,
    required this.roleId,
  });

  @override
  List<Object?> get props => [userId, email, tel, desc, fullName];
}

class SearchUserEvent extends UserManagementEvent {
  final String keyword;
  const SearchUserEvent({required this.keyword});
  @override
  List<Object?> get props => [keyword];
}
