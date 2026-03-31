import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/profile_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_profile_repository.dart';

class ProfileRepository extends BaseRepository implements IProfileRepository {
  final ProfileService service;
  const ProfileRepository({required this.service});

  @override
  Future<Either<Failure, OnboardProfileResponse>> getProfiles() async {
    return await catchError<OnboardProfileResponse>(() async {
      final data = await service.getProfiles();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, void>> setupProfile(int profileId) async {
    return await catchError<void>(() async {
      await service.setupProfile(profileId);
      return const Right(null);
    });
  }
}
