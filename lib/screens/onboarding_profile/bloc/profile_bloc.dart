import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_profile_repository.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_event.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_state.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  final IProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(const ProfileState()) {
    on<GetProfilesEvent>(_onGetProfiles);
    on<SelectProfileEvent>(_onSelectProfile);
    on<SetupProfileEvent>(_onSetupProfile);
  }

  FutureOr<void> _onGetProfiles(
    GetProfilesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoadingState());
    final result = await profileRepository.getProfiles();
    result.fold(
      (failure) {
        emit(ProfileErrorState(errorMessage: failure.toString()));
      },
      (profileResponse) {
        // Mặc định chọn profile đầu tiên
        final firstProfile = (profileResponse.profiles?.isNotEmpty == true)
            ? profileResponse.profiles!.first
            : null;
        emit(ProfileLoadedState(
          profileResponse: profileResponse,
          selectedProfile: firstProfile,
        ));
      },
    );
  }

  void _onSelectProfile(
    SelectProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    if (state is ProfileLoadedState) {
      emit((state as ProfileLoadedState).copyWith(selectedProfile: event.profile));
    }
  }

  FutureOr<void> _onSetupProfile(
    SetupProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    // Only proceed if we have a currently loaded state
    if (state is! ProfileLoadedState) return;

    final currentState = state as ProfileLoadedState;
    
    emit(SetupProfileLoadingState(
      profileResponse: currentState.profileResponse,
      selectedProfile: currentState.selectedProfile,
    ));

    // Wait for BOTH the API call and a minimum of 5 seconds
    final results = await Future.wait([
      profileRepository.setupProfile(event.profileId),
      Future.delayed(const Duration(seconds: 5)),
    ]);

    // The first element in the array is the result from setupProfile
    final result = results[0] as Either<Failure, void>;

    result.fold(
      (failure) {
        emit(SetupProfileErrorState(
          errorMessage: failure.toString(),
          profileResponse: currentState.profileResponse,
          selectedProfile: currentState.selectedProfile,
        ));
      },
      (_) {
        // Sau khi ít nhất 5s trôi qua và API thành công thì emit success
        emit(SetupProfileSuccessState(
          profileResponse: currentState.profileResponse,
          selectedProfile: currentState.selectedProfile,
        ));
      },
    );
  }
}
