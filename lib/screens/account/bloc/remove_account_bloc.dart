import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/usecases/my_profile/remove_account_input.dart';
import 'package:vms_flutter_client/domain/usecases/my_profile/remove_account_usecase.dart';

import '../../../core/base_bloc.dart';

// States
class RemoveAccountState extends BaseState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const RemoveAccountState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  RemoveAccountState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return RemoveAccountState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}

// Events
class RemoveAccountEvent extends BaseEvent {
  const RemoveAccountEvent();
}

// Bloc
class RemoveAccountBloc extends BaseBloc<RemoveAccountEvent, RemoveAccountState> {
  final RemoveAccountUseCase removeAccountUseCase;

  RemoveAccountBloc(this.removeAccountUseCase) : super(RemoveAccountState()) {
    on<RemoveAccountEvent>(_onRemoveAccount);
  }

  FutureOr<void> _onRemoveAccount(
    RemoveAccountEvent event,
    Emitter<RemoveAccountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: null));

    final input = RemoveAccountInput();

    final output = await removeAccountUseCase.execute(input);

    if (output.isSuccess) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        errorMessage: null,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: output.errorMessage,
      ));
    }
  }
}
