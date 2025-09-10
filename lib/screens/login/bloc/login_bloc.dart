import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_event.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_state.dart';
import '../../../core/base_bloc.dart';
import '../../../domain/usecases/login/login_usecase.dart';
import '../../../domain/usecases/login/login_input.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginReset>(_onLoginReset);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final loginInput = LoginInput(
        username: event.username,
        password: event.password,
      );

      final loginOutput = await loginUseCase.execute(loginInput);

      if (loginOutput.isSuccess) {
        emit(state.copyWith(
          isLoading: false,
          account: loginOutput.account,
          isSuccess: true,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: loginOutput.errorMessage ?? 'Login failed',
          isSuccess: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Login failed: ${e.toString()}',
        isSuccess: false,
      ));
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(const LoginState());
  }
}