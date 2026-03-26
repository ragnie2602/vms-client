part of 'role_bloc.dart';

class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object?> get props => [];
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
