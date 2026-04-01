part of 'role_bloc.dart';

class RoleEvent extends Equatable {
  const RoleEvent();

  @override
  List<Object?> get props => [];
}

class AddRole extends RoleEvent {
  final Role role;

  const AddRole({required this.role});

  @override
  List<Object?> get props => [role];
}

class DeleteRole extends RoleEvent {
  final int roleId;

  const DeleteRole({required this.roleId});

  @override
  List<Object?> get props => [roleId];
}

class EditRole extends RoleEvent {
  final Role role;

  const EditRole({required this.role});

  @override
  List<Object?> get props => [role];
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
