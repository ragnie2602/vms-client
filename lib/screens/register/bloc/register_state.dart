import 'package:vms_flutter_client/core/base_bloc.dart';

class RegisterState extends BaseState {
  final bool isLoading;
  final String? account;
  final String? errorMessage;
  final bool isSuccess;

  const RegisterState({
    this.isLoading = false,
    this.account,
    this.errorMessage,
    this.isSuccess = false,
  });

  RegisterState copyWith({bool? isLoading, String? account, String? errorMessage, bool? isSuccess}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      account: account ?? this.account,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, account, errorMessage, isSuccess];
}
