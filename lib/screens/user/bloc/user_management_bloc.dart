import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_input.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_output.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_use_case.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';

class UserManagementBloc extends BaseBloc<UserManagementEvent, UserManagementState> {
  List<UserEntity> listUser = [];
  final SearchUserUseCase searchUserUseCase;
  final IUserManagementRepository userManagermentRepository;
  UserManagementBloc({required this.userManagermentRepository, required this.searchUserUseCase})
    : super(const UserManagementState()) {
    on<GetListUserEvent>(_onGetListUser);
    on<AddUserEvent>(_onAddUser);
    on<DeleteUserEvent>(_onDeleteUser);
    on<ResetPassWordEvent>(_onResetPassWord);
    on<EditUserEvent>(_onEditUser);
    on<SearchUserEvent>(_onSearch);
  }

  FutureOr<void> _onGetListUser(GetListUserEvent event, Emitter<UserManagementState> emit) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.listUser();
    groups.fold(
      (onFailure) {
        listUser = [];
        emit(GetListUserStateFail(groups.left.toString()));
      },
      (onSuccess) {
        listUser = onSuccess;
        emit(GetListUserState(users: groups.right));
      },
    );
  }

  FutureOr<void> _onAddUser(AddUserEvent event, Emitter<UserManagementState> emit) async {
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
      fullName: event.fullName,
    );
    groups.fold((onFailure) => emit(AddUserFail(groups.left.toString())), (onSuccess) {
      emit(AddUserSuccess(user: groups.right));
    });
  }

  FutureOr<void> _onDeleteUser(DeleteUserEvent event, Emitter<UserManagementState> emit) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.deleteUser(userId: event.userId);
    groups.fold((onFailure) => emit(DeleteUserFail(groups.left.toString())), (onSuccess) {
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
    groups.fold((onFailure) => emit(ResetPassWordFail(groups.left.toString())), (onSuccess) {
      emit(ResetPassWordSuccess());
    });
  }

  FutureOr<void> _onEditUser(EditUserEvent event, Emitter<UserManagementState> emit) async {
    emit(UserManagementLoadingState());
    final groups = await userManagermentRepository.editUser(
      userId: event.userId,
      account: event.account,
      password: event.password,
      tel: event.tel,
      email: event.email,
      address: event.address,
      desc: event.desc,
      addCamDenied: event.addCamDenied,
      isAmin: event.isAdmin,
      changePassDenied: event.changePassDenied,
      fullName: event.fullName,
    );
    groups.fold((onFailure) => emit(EditUserFail(groups.left.toString())), (onSuccess) {
      emit(EditUserSuccess(user: groups.right));
    });
  }

  void _onSearch(SearchUserEvent event, Emitter<UserManagementState> emit) {
    final SearchUserInput input = SearchUserInput(
      listUserOrigin: listUser,
      nameUser: event.keyword,
    );
    final SearchUserOutput output = searchUserUseCase.execute(input);
    emit(GetListUserState(users: output.listUserResult ?? []));
  }
}
