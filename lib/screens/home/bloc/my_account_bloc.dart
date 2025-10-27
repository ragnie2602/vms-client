import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';

import '../../../core/base_bloc.dart';

// States
class MyAccountState extends BaseState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  MyAccountState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  MyAccountState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MyAccountState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}

// Events
class MyAccountEvent extends BaseEvent {
  const MyAccountEvent();
}

class ChangeMyPasswordEvent extends MyAccountEvent {
  final String currentPassword;
  final String newPassword;
  final bool kickOthers;

  const ChangeMyPasswordEvent({
    required this.currentPassword,
    required this.newPassword,
    this.kickOthers = false,
  });
}

// Bloc
class MyAccountBloc extends BaseBloc<MyAccountEvent, MyAccountState> {
  final IUserManagementRepository repository;

  MyAccountBloc(this.repository) : super(MyAccountState()) {
    on<ChangeMyPasswordEvent>(_onChangeMyPassword);
  }

  FutureOr<void> _onChangeMyPassword(
    ChangeMyPasswordEvent event,
    Emitter<MyAccountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: null));

    final result = await repository.changeMyPassword(
      current: event.currentPassword,
      password: event.newPassword,
      kickOthers: event.kickOthers,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: failure.parseMessage(),
      )),
      (success) => emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        errorMessage: null,
      )),
    );
  }
}
