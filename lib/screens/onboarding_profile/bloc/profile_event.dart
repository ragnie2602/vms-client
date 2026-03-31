import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

class ProfileEvent extends BaseEvent {
  const ProfileEvent();
}

class GetProfilesEvent extends ProfileEvent {
  const GetProfilesEvent();
}

class SelectProfileEvent extends ProfileEvent {
  final Profile profile;
  const SelectProfileEvent(this.profile);

  @override
  List<Object?> get props => [profile];
}
