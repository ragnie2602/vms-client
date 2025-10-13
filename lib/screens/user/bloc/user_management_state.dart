import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/user/user.dart';

class UserManagementState extends BaseState {
  const UserManagementState();
}

class UserManagementLoadingState extends UserManagementState {
  @override
  StateType get type => StateType.loading;
}

class GetListUserState extends UserManagementState {
  final List<User>? users;
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
