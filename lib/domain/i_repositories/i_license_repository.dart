import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';

abstract class ILicenseRepository {
  Future<Either<Failure, CurrentLicenseData>> getCurrentLicense();
}
