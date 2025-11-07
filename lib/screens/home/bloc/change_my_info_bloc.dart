import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';

import '../../../core/base_bloc.dart';

// States
class ChangeMyInfoState extends BaseState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  ChangeMyInfoState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  ChangeMyInfoState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ChangeMyInfoState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}

// Events
class ChangeMyInfoEvent extends BaseEvent {
  final String currentPassword;
  final String newPassword;
  final bool kickOthers;

  const ChangeMyInfoEvent({
    required this.currentPassword,
    required this.newPassword,
    this.kickOthers = false,
  });
}

// Bloc
class ChangeMyInfoBloc extends BaseBloc<ChangeMyInfoEvent, ChangeMyInfoState> {
  final IUserManagementRepository repository;

  ChangeMyInfoBloc(this.repository) : super(ChangeMyInfoState()) {
    on<ChangeMyInfoEvent>(_onChangeMyInfo);
  }

  FutureOr<void> _onChangeMyInfo(
    ChangeMyInfoEvent event,
    Emitter<ChangeMyInfoState> emit,
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
