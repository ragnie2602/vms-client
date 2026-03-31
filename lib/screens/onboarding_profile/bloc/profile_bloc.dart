import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_profile_repository.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_event.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_state.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  final IProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(const ProfileState()) {
    on<GetProfilesEvent>(_onGetProfiles);
    on<SelectProfileEvent>(_onSelectProfile);
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
}
