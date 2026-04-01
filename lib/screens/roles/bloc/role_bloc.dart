import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission_tree.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_role_repository.dart';
import 'package:vms_flutter_client/domain/usecases/roles/search_roles_input.dart';
import 'package:vms_flutter_client/domain/usecases/roles/search_roles_use_case.dart';

part 'role_event.dart';
part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final IRoleRepository repository;

  final SearchRolesUseCase searchRolesUseCase;

  RoleBloc(this.repository, this.searchRolesUseCase) : super(RoleState()) {
    on<AddRole>(_onAddRole);
    on<DeleteRole>(_onDeleteRole);
    on<EditRole>(_onEditRole);
    on<GetRoles>(_onGetRoles);
    on<SearchRoles>(_onSearchRoles);

    on<GetPermissions>(_onGetPermissions);
  }

  FutureOr<void> _onAddRole(AddRole event, Emitter<RoleState> emit) async {
    emit(AddingRole());
    final result = await repository.addRole(event.role);

    result.fold(
      (failure) => emit(AddRoleFailure(message: failure.toString())),
      (role) => emit(AddRoleSuccess(role: role)),
    );
  }

  FutureOr<void> _onGetRoles(GetRoles event, Emitter<RoleState> emit) async {
    final result = await repository.getAllRoles();

    result.fold(
      (failure) => emit(GetAllRolesFailure()),
      (roles) => emit(GetAllRolesSuccess(roles: roles)),
    );
  }

  FutureOr<void> _onSearchRoles(SearchRoles event, Emitter<RoleState> emit) async {
    final result = searchRolesUseCase.execute(
      SearchRolesInput(keyword: event.keyword, roles: event.roles),
    );

    emit(SearchRolesSuccess(roles: result.roles));
  }

  FutureOr<void> _onGetPermissions(GetPermissions event, Emitter<RoleState> emit) async {
    emit(GetAllPermissionsLoading());
    final result = await repository.getPermissionTree();

    result.fold(
      (failure) => emit(GetAllPermissionsFailure(failure: failure)),
      (tree) => emit(GetAllPermissionsSuccess(tree)),
    );
  }


  FutureOr<void> _onEditRole(EditRole event, Emitter<RoleState> emit) async {
    emit(EditingRole());
    final result = await repository.editRole(event.role);

    result.fold(
      (failure) => emit(EditRoleFailure(message: failure.toString())),
      (role) => emit(EditRoleSuccess(role: role)),
    );
  }

  FutureOr<void> _onDeleteRole(DeleteRole event, Emitter<RoleState> emit) async {
    emit(DeletingRole());
    final result = await repository.deleteRole(event.roleId);

    result.fold(
      (failure) => emit(DeleteRoleFailure(message: failure.toString())),
      (_) => emit(DeleteRoleSuccess(roleId: event.roleId)),
    );
  }
}
