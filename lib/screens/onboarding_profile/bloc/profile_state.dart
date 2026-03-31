import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

class ProfileState extends BaseState {
  const ProfileState();
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();

  @override
  StateType get type => StateType.loading;
}

class ProfileLoadedState extends ProfileState {
  final OnboardProfileResponse profileResponse;

  const ProfileLoadedState({required this.profileResponse});

  ProfileLoadedState copyWith({OnboardProfileResponse? profileResponse}) {
    return ProfileLoadedState(
      profileResponse: profileResponse ?? this.profileResponse,
    );
  }

  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [profileResponse];
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;
  const ProfileErrorState({required this.errorMessage});

  @override
  StateType get type => StateType.failure;

  @override
  List<Object?> get props => [errorMessage];
}
