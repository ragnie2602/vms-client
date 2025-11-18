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

      // Only send changed fields to the API
      String? displayName;
      String? email;
      String? tel;

      if (current?.displayName != updated.displayName) {
        displayName = updated.displayName;
      }

      if (current?.email != updated.email) {
        email = updated.email;
      }

      if (current?.tel != updated.tel) {
        tel = updated.tel;
      }

      // Only call API if there are changes
      if (displayName == null && email == null && tel == null) {
        return UpdateMyProfileOutput(
          updatedProfile: current,
          isSuccess: true,
        );
      }

      final result = await userManagementRepository.updateMyProfile(
        displayName: displayName,
        email: email,
        tel: tel,
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
          return UpdateMyProfileOutput(
            updatedProfile: updated,
            isSuccess: true,
          );
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
