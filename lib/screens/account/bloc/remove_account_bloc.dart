import '../../../core/base_bloc.dart';

// States
class RemoveAccountState extends BaseState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const RemoveAccountState({this.isLoading = false, this.isSuccess = false, this.errorMessage});

  RemoveAccountState copyWith({bool? isLoading, bool? isSuccess, String? errorMessage}) {
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
