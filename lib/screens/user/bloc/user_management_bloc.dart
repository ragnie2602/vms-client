import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';

class UserManagementBloc
    extends BaseBloc<UserManagementEvent, UserManagementState> {
  final IUserManagementRepository userManagermentRepository;
  UserManagementBloc({required this.userManagermentRepository})
    : super(const UserManagementState()) {
    on<GetListUserEvent>(_onGetListUser);
    on<AddUserEvent>(_onAddUser);
    on<DeleteUserEvent>(_onDeleteUser);
    on<ResetPassWordEvent>(_onResetPassWord);
  }

  FutureOr<void> _onGetListUser(
    GetListUserEvent event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.listUser();
    groups.fold(
      (onFailure) => emit(GetListUserStateFail(groups.left.toString())),
      (onSuccess) {
        emit(GetListUserState(users: groups.right));
      },
    );
  }

  FutureOr<void> _onAddUser(
    AddUserEvent event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.addUser(
      account: event.account,
      password: event.password,
      tel: event.tel,
      email: event.email,
      address: event.address,
      desc: event.desc,
      addCamDenied: event.addCamDenied,
      isAmin: event.isAdmin,
      changePassDenied: event.changePassDenied,
    );
    groups.fold(
      (onFailure) => emit(GetListUserStateFail(groups.left.toString())),
      (onSuccess) {
        emit(AddUserSuccess(user: groups.right));
      },
    );
  }

  FutureOr<void> _onDeleteUser(
    DeleteUserEvent event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.deleteUser(
      userId: event.userId,
    );
    groups.fold((onFailure) => emit(DeleteUserFail(groups.left.toString())), (
      onSuccess,
    ) {
      emit(DeleteUserSuccess(userId: groups.right));
    });
  }

  FutureOr<void> _onResetPassWord(
    ResetPassWordEvent event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.resetPassword(
      newPassword: event.newPassword,
      userId: event.userId,
    );
    groups.fold(
      (onFailure) => emit(ResetPassWordFail(groups.left.toString())),
      (onSuccess) {
        emit(ResetPassWordSuccess());
      },
    );
  }
}
