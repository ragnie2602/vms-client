import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';
import 'package:vms_flutter_client/domain/usecases/my_profile/update_my_profile_input.dart';
import 'package:vms_flutter_client/domain/usecases/my_profile/update_my_profile_usecase.dart';

import '../../../core/base_bloc.dart';

// States
class ChangeMyInfoState extends BaseState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final MyProfile? profile;

  ChangeMyInfoState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.profile
  });

  ChangeMyInfoState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    MyProfile? profile
  }) {
    return ChangeMyInfoState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      profile: profile
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}

// Events
class ChangeMyInfoEvent extends BaseEvent {
  final MyProfile? updateProfile;

  const ChangeMyInfoEvent({
    this.updateProfile
  });
}

class GetMyInfoEvent extends ChangeMyInfoEvent {}

// Bloc
class ChangeMyInfoBloc extends BaseBloc<ChangeMyInfoEvent, ChangeMyInfoState> {
  final UpdateMyProfileUseCase updateMyProfileUseCase;
  final AppBloc appBloc;

  ChangeMyInfoBloc(this.updateMyProfileUseCase, this.appBloc) : super(ChangeMyInfoState()) {
    on<ChangeMyInfoEvent>(_onChangeMyInfo);
    on<GetMyInfoEvent>(_onGetMyInfo);
    add(GetMyInfoEvent());
  }

  void _onGetMyInfo(
    ChangeMyInfoEvent event,
    Emitter<ChangeMyInfoState> emit
  ) {
    final MyProfile? currentProfile = AppData.instance.profile;
    emit(state.copyWith(profile: currentProfile));
  }

  FutureOr<void> _onChangeMyInfo(
    ChangeMyInfoEvent event,
    Emitter<ChangeMyInfoState> emit,
  ) async {
    if (event.updateProfile == null) return;

    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: null));

    final input = UpdateMyProfileInput(
      updatedProfile: event.updateProfile!,
    );

    final output = await updateMyProfileUseCase.execute(input);

    if (output.isSuccess) {
      // Notify AppBloc that profile has changed
      appBloc.add(MyProfileInfoChanged());

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        errorMessage: null,
        profile: output.updatedProfile,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: output.errorMessage,
        profile: event.updateProfile
      ));
    }
  }
}
