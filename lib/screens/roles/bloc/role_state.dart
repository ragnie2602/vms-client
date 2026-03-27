part of 'role_bloc.dart';

class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object?> get props => [];
}

class AddingRole extends RoleState {
  @override
  List<Object?> get props => [];
}

class AddRoleSuccess extends RoleState {
  final Role role;

  const AddRoleSuccess({required this.role});

  @override
  List<Object?> get props => [];
}

class AddRoleFailure extends RoleState {
  final String? message;

  const AddRoleFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeletingRole extends RoleState {
  @override
  List<Object?> get props => [];
}

class DeleteRoleSuccess extends RoleState {
  final int roleId;

  const DeleteRoleSuccess({required this.roleId});

  @override
  List<Object?> get props => [];
}

class DeleteRoleFailure extends RoleState {
  final String? message;

  const DeleteRoleFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class EditingRole extends RoleState {
  @override
  List<Object?> get props => [];
}

class EditRoleSuccess extends RoleState {
  final Role role;

  const EditRoleSuccess({required this.role});

  @override
  List<Object?> get props => [role];
}

class EditRoleFailure extends RoleState {
  final String? message;

  const EditRoleFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
class GetAllPermissionsSuccess extends RoleState {
  final PermissionTree tree;

  const GetAllPermissionsSuccess(this.tree);

  @override
  List<Object?> get props => [tree];
}

class GetAllPermissionsFailure extends RoleState {
  final Failure failure;

  const GetAllPermissionsFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class GetAllPermissionsLoading extends RoleState {}

class GetAllRolesSuccess extends RoleState {
  final List<Role> roles;

  const GetAllRolesSuccess({required this.roles});

  @override
  List<Object?> get props => [roles];
}

class GetAllRolesFailure extends RoleState {}

class GetAllRolesLoading extends RoleState {}

class SearchRolesSuccess extends RoleState {
  final List<Role> roles;

  const SearchRolesSuccess({required this.roles});

  @override
  List<Object?> get props => [roles];
}
