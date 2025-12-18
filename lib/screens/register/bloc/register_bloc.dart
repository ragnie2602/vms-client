import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/register/bloc/register_event.dart';
import 'package:vms_flutter_client/screens/register/bloc/register_state.dart';
import '../../../core/base_bloc.dart';
import '../../../domain/usecases/register/register_usecase.dart';
import '../../../domain/usecases/register/register_input.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(const RegisterState()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<RegisterReset>(_onRegisterReset);
  }

  void _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final registerInput = RegisterInput(
        account: event.account,
        password: event.password,
        server: event.server,
      );

      final registerOutput = await registerUseCase.execute(registerInput);

      if (registerOutput.isSuccess) {
        emit(state.copyWith(
          isLoading: false,
          account: registerOutput.account,
          isSuccess: true,
          errorMessage: null
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: registerOutput.errorMessage ?? 'Register failed',
          isSuccess: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Register failed: ${e.toString()}',
        isSuccess: false,
      ));
    }
  }

  void _onRegisterReset(RegisterReset event, Emitter<RegisterState> emit) {
    emit(const RegisterState());
  }
}
