part of 'role_bloc.dart';

class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object?> get props => [];
}

class GetAllPermissionsSuccess extends RoleState {
  final List<Permissions> permissions;

  const GetAllPermissionsSuccess({required this.permissions});

  @override
  List<Object?> get props => [permissions];
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
