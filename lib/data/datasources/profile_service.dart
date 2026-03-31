import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

class ProfileService {
  final HttpClient httpClient;

  ProfileService(this.httpClient);

  Future<OnboardProfileResponse> getProfiles() async {
    final raw = await httpClient.get(EndPoints.baseProfiles);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return OnboardProfileResponse.fromJson(response.data);
  }
}
