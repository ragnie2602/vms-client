import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/license_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';
import 'package:vms_flutter_client/domain/entities/license/license_preview_data.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_license_repository.dart';

class LicenseRepository extends BaseRepository implements ILicenseRepository {
  final LicenseService service;
  
  const LicenseRepository({required this.service});

  @override
  Future<Either<Failure, CurrentLicenseData>> getCurrentLicense() async {
    return await catchError<CurrentLicenseData>(() async {
      final data = await service.getCurrentLicense();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, LicensePreviewData>> previewLicense(String licenseKey) async {
    return await catchError<LicensePreviewData>(() async {
      final data = await service.previewLicense(licenseKey);
      return Right(data);
    });
  }
}
