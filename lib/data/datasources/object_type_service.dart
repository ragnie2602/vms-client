import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

class ObjectTypeService {
  final HttpClient httpClient;

  const ObjectTypeService(this.httpClient);

  /// Fetch paginated list of object types
  /// Returns a Map with 'items', 'totalElements', 'totalPages'
  Future<Map<String, dynamic>> getObjectTypes({
    int page = 1,
    int size = 20,
    String? keyword,
    String? status,
  }) async {
    final queryParams = <String, dynamic>{'page': page, 'size': size};
    if (keyword != null && keyword.isNotEmpty) {
      queryParams['keyword'] = keyword;
    }
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    final raw = await httpClient.get(
      EndPoints.baseObjectType,
      queryParameters: queryParams,
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw ApiException(response.message);
    final data = response.data as Map<String, dynamic>;
    final dataList = (data['data'] as List<dynamic>?) ?? [];
    final items = dataList
        .map((e) => ObjectType.fromJson(e as Map<String, dynamic>))
        .toList();
    return {
      'items': items,
      'totalElements': data['totalElements'] ?? items.length,
      'totalPages': data['totalPages'] ?? 1,
    };
  }

  /// Fetch object type detail by ID (includes dataFields)
  Future<ObjectType> getObjectTypeDetail(int id) async {
    final raw = await httpClient.get('${EndPoints.baseObjectType}/$id');
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw ApiException(response.message);
    return ObjectType.fromJson(response.data as Map<String, dynamic>);
  }

  /// Create a new object type
  Future<void> createObjectType(Map<String, dynamic> data) async {
    final raw = await httpClient.post(
      url: EndPoints.baseObjectType,
      data: data,
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200 && response.code != 201)
      throw ApiException(response.message);
  }

  /// Update an existing object type
  Future<void> updateObjectType(int id, Map<String, dynamic> data) async {
    final raw = await httpClient.put(
      url: '${EndPoints.baseObjectType}/$id',
      data: data,
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200 && response.code != 201)
      throw ApiException(response.message);
  }

  /// Delete an object type by ID
  Future<void> deleteObjectType(int id) async {
    final raw = await httpClient.delete(url: '${EndPoints.baseObjectType}/$id');
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw ApiException(response.message);
  }

  /// Fetch available icons for object type fields
  Future<List<Map<String, dynamic>>> getIcons() async {
    final raw = await httpClient.get(EndPoints.objectTypeIcons);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw ApiException(response.message);
    return (response.data as List<dynamic>).cast<Map<String, dynamic>>();
  }
}
