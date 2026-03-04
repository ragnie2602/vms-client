import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/datasources/subject_group_service.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

class ObjectGroupRepository extends BaseRepository
    implements IObjectGroupRepository {
  final HttpClient _apiClient;
  final SubjectGroupService _subjectGroupService;

  ObjectGroupRepository(this._apiClient, this._subjectGroupService);

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
  Future<Map<String, dynamic>> getObjects(
    int objectTypeId,
    int page,
    int subjectGroupId,
    int size, {
    String? search,
  }) async {
    var url =
        '${EndPoints.baseUrl}/api/objects?objectTypeId=$objectTypeId&page=$page&size=$size&subjectGroupId=$subjectGroupId';
    if (search != null && search.isNotEmpty) {
      url += '&search=${Uri.encodeComponent(search)}';
    }
    final response = await _apiClient.get(url);

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
    final response = await _apiClient.get(
      '${EndPoints.baseUrl}/api/object-types/$id',
    );

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
  Future<void> createObject(
    int objectTypeId,
    Map<String, dynamic> fieldValues, {
    List<int>? subjectGroupIds,
  }) async {
    final data = <String, dynamic>{
      'objectTypeId': objectTypeId,
      'fieldValues': fieldValues,
    };
    if (subjectGroupIds != null && subjectGroupIds.isNotEmpty) {
      data['subjectGroupIds'] = subjectGroupIds;
    }
    final response = await _apiClient.post(
      url: '${EndPoints.baseUrl}/api/objects',
      data: data,
    );

    if (response != null &&
        (response['code'] == 200 ||
            response['code'] == 0 ||
            response['code'] == 201)) {
      return;
    }
    throw Exception(response?['message'] ?? 'Failed to create object');
  }

  @override
  Future<ObjectData> getObjectDetail(int objectId) async {
    final response = await _apiClient.get(
      '${EndPoints.baseUrl}/api/objects/$objectId',
    );

    if (response['code'] == 200 || response['code'] == 0) {
      return ObjectData.fromJson(response['data'] as Map<String, dynamic>);
    }
    throw Exception(response['message'] ?? 'Failed to load object detail');
  }

  @override
  Future<void> updateObject(
    int objectId,
    int objectTypeId,
    Map<String, dynamic> fieldValues, {
    List<int>? subjectGroupIds,
  }) async {
    final data = <String, dynamic>{
      'objectTypeId': objectTypeId,
      'fieldValues': fieldValues,
    };
    if (subjectGroupIds != null && subjectGroupIds.isNotEmpty) {
      data['subjectGroupIds'] = subjectGroupIds;
    }
    final response = await _apiClient.put(
      url: '${EndPoints.baseUrl}/api/objects/$objectId',
      data: data,
    );

    if (response != null &&
        (response['code'] == 200 ||
            response['code'] == 0 ||
            response['code'] == 201)) {
      return;
    }
    throw Exception(response?['message'] ?? 'Failed to update object');
  }

  @override
  Future<void> deleteObject(int objectId) async {
    final response = await _apiClient.delete(
      url: '${EndPoints.baseUrl}/api/objects/$objectId',
    );

    if (response != null &&
        (response['code'] == 200 ||
            response['code'] == 0 ||
            response['code'] == 204)) {
      return;
    }
    throw Exception(response?['message'] ?? 'Failed to delete object');
  }

  @override
  Future<List<SubjectGroup>> getSubjectGroups() async {
    final response = await _apiClient.get(
      '${EndPoints.baseUrl}${EndPoints.baseSubjectGroup}',
    );

    // API returns raw JSON array directly (not wrapped in {code, data})
    if (response is List) {
      return response
          .map((item) => SubjectGroup.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load subject groups');
  }

  @override
  Future<void> createSubjectGroup(String name, int parentId) async {
    final response = await _apiClient.post(
      url: '${EndPoints.baseUrl}${EndPoints.baseSubjectGroup}',
      data: {'name': name, 'parentId': parentId},
    );

    // API may return the created object or a success response
    if (response != null) {
      return;
    }
    throw Exception('Failed to create subject group');
  }

  @override
  Future<Either<Failure, SubjectGroup>> editObjectGroup({
    required int objectGroupId,
    required SubjectGroup request,
  }) async {
    return await catchError<SubjectGroup>(() async {
      final data = await _subjectGroupService.putEditSubjectGroup(
        subjectGroupId: objectGroupId,
        request: request,
      );
      return Right(data);
    });
  }
}
