part of 'role_bloc.dart';

class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object?> get props => [];
}

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
