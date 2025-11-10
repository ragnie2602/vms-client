import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';
import '../base_output.dart';

class UpdateMyProfileOutput extends BaseOutput {
  final MyProfile? updatedProfile;
  final bool isSuccess;
  final String? errorMessage;

  const UpdateMyProfileOutput({
    required this.updatedProfile,
    required this.isSuccess,
    this.errorMessage,
  });
}
