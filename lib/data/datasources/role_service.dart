import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';

class RoleService {
  final HttpClient httpClient;

  const RoleService(this.httpClient);

  Future getPermissionTree() async {
    final Map<String, dynamic> raw = await httpClient.get(EndPoints.permissionTree);
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    
    return response.data;
  }

  Future getAllRoles() async {
    final Map<String, dynamic> raw = await httpClient.get(EndPoints.baseRole);
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }
}
