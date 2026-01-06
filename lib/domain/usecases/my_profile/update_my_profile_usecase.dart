import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import '../future_use_case.dart';
import 'update_my_profile_input.dart';
import 'update_my_profile_output.dart';

class UpdateMyProfileUseCase extends FutureUseCase<UpdateMyProfileInput, UpdateMyProfileOutput> {
  final IUserManagementRepository userManagementRepository;

  const UpdateMyProfileUseCase({required this.userManagementRepository});

  @override
  Future<UpdateMyProfileOutput> buildUseCase(UpdateMyProfileInput input) async {
    try {
      final current = AppData.instance.profile;
      final updated = input.updatedProfile;

      if (current?.displayName == updated.displayName &&
          current?.email == updated.email &&
          current?.tel == updated.tel) {
        return UpdateMyProfileOutput(updatedProfile: current, isSuccess: true);
      }

      final result = await userManagementRepository.updateMyProfile(
        displayName: updated.displayName,
        email: updated.email,
        tel: updated.tel,
      );

      return result.fold(
        (failure) => UpdateMyProfileOutput(
          updatedProfile: current,
          isSuccess: false,
          errorMessage: failure.parseMessage(),
        ),
        (success) {
          // Update AppData with new profile
          AppData.instance.profile = updated;
          return UpdateMyProfileOutput(updatedProfile: updated, isSuccess: true);
        },
      );
    } catch (e) {
      return UpdateMyProfileOutput(
        updatedProfile: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
