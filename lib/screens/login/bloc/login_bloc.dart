import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_profile_repository.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_event.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_state.dart';
import '../../../core/base_bloc.dart';
import '../../../domain/usecases/login/login_usecase.dart';
import '../../../domain/usecases/login/login_input.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final IProfileRepository profileRepository;

  LoginBloc({required this.loginUseCase, required this.profileRepository})
      : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginReset>(_onLoginReset);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final loginInput = LoginInput(
        username: event.username,
        password: event.password,
        server: event.server,
      );

      final loginOutput = await loginUseCase.execute(loginInput);

      if (loginOutput.isSuccess) {
        // case login thành công -> gọi API lấy thông tin onboarding profile
        final profileResult = await profileRepository.getProfiles();
        final needsOnboarding = profileResult.fold(
          (_) => false, // Nếu lỗi -> vẫn vào home như bình thường
          (response) => response.hasUsingProfile, 
        );

        emit(state.copyWith(
          isLoading: false,
          account: loginOutput.account,
          isSuccess: true,
          errorMessage: null,
          needsOnboarding: needsOnboarding,
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
