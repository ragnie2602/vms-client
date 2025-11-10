import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';
import '../base_input.dart';

class UpdateMyProfileInput extends BaseInput {
  final MyProfile updatedProfile;

  const UpdateMyProfileInput({
    required this.updatedProfile,
  });
}
