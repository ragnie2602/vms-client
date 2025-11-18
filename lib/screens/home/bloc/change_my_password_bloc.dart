import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';

import '../../../core/base_bloc.dart';

// States
class ChangeMyPasswordState extends BaseState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  ChangeMyPasswordState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  ChangeMyPasswordState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ChangeMyPasswordState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}

// Events
class ChangeMyPasswordEvent extends BaseEvent {
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
class ChangeMyPasswordBloc extends BaseBloc<ChangeMyPasswordEvent, ChangeMyPasswordState> {
  final IUserManagementRepository repository;

  ChangeMyPasswordBloc(this.repository) : super(ChangeMyPasswordState()) {
    on<ChangeMyPasswordEvent>(_onChangeMyPassword);
  }

  FutureOr<void> _onChangeMyPassword(
    ChangeMyPasswordEvent event,
    Emitter<ChangeMyPasswordState> emit,
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
