import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';

class RoleService {
  final HttpClient httpClient;

  const RoleService(this.httpClient);

  Future addRole(Map<String, dynamic> data) async {
    final Map<String, dynamic> raw = await httpClient.post(url: EndPoints.baseRole, data: data);
    final response = BaseResponse.fromJson(raw);

    if (response.code != 201) throw Exception(response.message);
    return response.data;
  }

  Future deleteRole(int roleId) async {
    final Map<String, dynamic> raw = await httpClient.delete(url: '${EndPoints.baseRole}/$roleId');
    final response = BaseResponse.fromJson(raw);

    if (response.code != 204) throw Exception(response.message);
    return response.data;
  }

  Future editRole(int roleId, Map<String, dynamic> data) async {
    final Map<String, dynamic> raw = await httpClient.put(
      url: '${EndPoints.baseRole}/$roleId',
      data: data,
    );
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    return response.data;
  }

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
