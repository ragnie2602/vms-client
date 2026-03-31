import 'package:vms_flutter_client/core/base_bloc.dart';

class LoginState extends BaseState {
  final bool isLoading;
  final String? account;
  final String? errorMessage;
  final bool isSuccess;
  final bool needsOnboarding;

  const LoginState({
    this.isLoading = false,
    this.account,
    this.errorMessage,
    this.isSuccess = false,
    this.needsOnboarding = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? account,
    String? errorMessage,
    bool? isSuccess,
    bool? needsOnboarding,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      account: account ?? this.account,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      needsOnboarding: needsOnboarding ?? this.needsOnboarding,
    );
  }

  @override
  List<Object?> get props => [isLoading, account, errorMessage, isSuccess, needsOnboarding];
}
