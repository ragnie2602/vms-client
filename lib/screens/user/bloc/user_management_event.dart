import 'package:vms_flutter_client/core/base_bloc.dart';

class UserManagementEvent extends BaseEvent {
  const UserManagementEvent();
}

class GetListUserEvent extends UserManagementEvent {}

class AddUserEvent extends UserManagementEvent {
  final String account;
  final String? email;
  final String? fullName;
  final String? tel;
  final String? address;
  final bool isAdmin;
  final String? desc;
  final String password;
  final bool changePassDenied;
  final bool addCamDenied;
  final int dataType; // 0=Tất cả dữ liệu, 1=Chỉ dữ liệu của tài khoản, 2=Dữ liệu được chia sẻ
  const AddUserEvent({
    required this.account,
    this.email,
    this.tel,
    this.address,
    required this.isAdmin,
    this.desc,
    required this.password,
    required this.changePassDenied,
    required this.addCamDenied,
    this.fullName,
    required this.dataType,
  });
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

class EditUserEvent extends UserManagementEvent {
  final int userId;
  final String account;
  final String? email;
  final String? tel;
  final String? address;
  final bool isAdmin;
  final String? desc;
  final bool changePassDenied;
  final bool addCamDenied;
  final String? fullName;

  const EditUserEvent({
    required this.userId,
    required this.account,
    this.email,
    this.tel,
    this.address,
    required this.isAdmin,
    this.desc,
    required this.changePassDenied,
    required this.addCamDenied,
    this.fullName,
  });
}

class SearchUserEvent extends UserManagementEvent {
  final String keyword;
  const SearchUserEvent({required this.keyword});
  @override
  List<Object?> get props => [keyword];
}
