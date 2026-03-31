import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';

class LicenseService {
  final HttpClient httpClient;

  LicenseService(this.httpClient);

  Future<CurrentLicenseData> getCurrentLicense() async {
    final raw = await httpClient.get(EndPoints.checkCurrentLicense);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return CurrentLicenseData.fromJson(response.data);
  }
}
