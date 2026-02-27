import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

class ObjectGroupRepository implements IObjectGroupRepository {
  final HttpClient _apiClient;

  ObjectGroupRepository(this._apiClient);

  @override
  Future<Map<String, dynamic>> getObjectTypes(int page, int size) async {
    final response = await _apiClient.get(
      '${EndPoints.baseUrl}/api/object-types?page=$page&size=$size',
    );

    if (response['code'] == 200 || response['code'] == 0) {
      final data = response['data'];
      final list = (data['data'] as List)
          .map((item) => ObjectType.fromJson(item as Map<String, dynamic>))
          .toList();
      return {
        'data': list,
        'totalElements': data['totalElements'] ?? 0,
        'totalPages': data['totalPages'] ?? 0,
      };
    }
    throw Exception(response['message'] ?? 'Failed to load object types');
  }

  @override
  Future<Map<String, dynamic>> getObjects(int objectTypeId, int page, int size) async {
    final response = await _apiClient.get(
      '${EndPoints.baseUrl}/api/objects?objectTypeId=$objectTypeId&page=$page&size=$size',
    );

    if (response['code'] == 200 || response['code'] == 0) {
      final data = response['data'];
      final list = (data['data'] as List)
          .map((item) => ObjectData.fromJson(item as Map<String, dynamic>))
          .toList();
      return {
        'data': list,
        'totalElements': data['totalElements'] ?? 0,
        'totalPages': data['totalPages'] ?? 0,
      };
    }
    throw Exception(response['message'] ?? 'Failed to load objects');
  }

  @override
  Future<ObjectType> getObjectTypeDetail(int id) async {
    final response = await _apiClient.get('${EndPoints.baseUrl}/api/object-types/$id');

    if (response['code'] == 200 || response['code'] == 0) {
      return ObjectType.fromJson(response['data'] as Map<String, dynamic>);
    }
    throw Exception(response['message'] ?? 'Failed to load object type detail');
  }

  @override
  Future<int> uploadFile(String filePath) async {
    final response = await _apiClient.postMultipart(
      url: '${EndPoints.baseUrl}/api/files/upload?imageOnly=false',
      data: {'file': await MultipartFile.fromFile(filePath)},
    );

    if (response != null && response['fileId'] != null) {
      return response['fileId'] as int;
    }
    throw Exception('Failed to upload file');
  }

  @override
  Future<void> createObject(int objectTypeId, Map<String, dynamic> fieldValues) async {
    final response = await _apiClient.post(
      url: '${EndPoints.baseUrl}/api/objects',
      data: {'objectTypeId': objectTypeId, 'fieldValues': fieldValues},
    );

    if (response != null &&
        (response['code'] == 200 || response['code'] == 0 || response['code'] == 201)) {
      return;
    }
    throw Exception(response?['message'] ?? 'Failed to create object');
  }
}
