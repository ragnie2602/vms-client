import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';

class UserManagementState extends BaseState {
  const UserManagementState();
}

class UserManagementLoadingState extends UserManagementState {
  @override
  StateType get type => StateType.loading;
}

class GetListUserState extends UserManagementState {
  final List<UserEntity>? users;
  const GetListUserState({required this.users});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [users];
}

class GetListUserStateFail extends UserManagementState {
  final String message;

  const GetListUserStateFail(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class AddUserFail extends UserManagementState {
  final String message;

  const AddUserFail(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class AddUserLoadingState extends UserManagementState {
  @override
  StateType get type => StateType.loading;
}

class AddUserSuccess extends UserManagementState {
  final UserEntity? user;
  const AddUserSuccess({required this.user});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [user];
}

class DeleteUserSuccess extends UserManagementState {
  final List<int>? userId;
  const DeleteUserSuccess({required this.userId});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [userId];
}

class DeleteUserFail extends UserManagementState {
  final String message;

  const DeleteUserFail(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class DeleteUserLoadingState extends UserManagementState {
  @override
  StateType get type => StateType.loading;
}

class ReSetPassWordLoadingState extends UserManagementState {
  @override
  StateType get type => StateType.loading;
}

class ResetPassWordFail extends UserManagementState {
  final String message;

  const ResetPassWordFail(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class ResetPassWordSuccess extends UserManagementState {
  const ResetPassWordSuccess();
}

class EditUserFail extends UserManagementState {
  final String message;

  const EditUserFail(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class EditUserLoadingState extends UserManagementState {
  @override
  StateType get type => StateType.loading;
}

class EditUserSuccess extends UserManagementState {
  final UserEntity? user;
  const EditUserSuccess({required this.user});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [user];
}
