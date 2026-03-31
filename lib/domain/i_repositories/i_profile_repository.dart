import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

abstract class IProfileRepository {
  Future<Either<Failure, OnboardProfileResponse>> getProfiles();
}
