part of 'role_bloc.dart';

class RoleEvent extends Equatable {
  const RoleEvent();

  @override
  List<Object?> get props => [];
}

class GetPermissions extends RoleEvent {}

class GetRoles extends RoleEvent {}

class GetRolesById extends RoleEvent {}

class SearchRoles extends RoleEvent {
  final String keyword;
  final List<Role> roles;

  const SearchRoles({required this.keyword, required this.roles});

  @override
  List<Object?> get props => [keyword, roles];
}
