import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/datasources/subject_group_service.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/check_subject_group_model.dart';

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
    List<int>? fileIds,
  }) async {
    final data = <String, dynamic>{
      'objectTypeId': objectTypeId,
      'fieldValues': fieldValues,
    };
    if (subjectGroupIds != null && subjectGroupIds.isNotEmpty) {
      data['subjectGroupIds'] = subjectGroupIds;
    }
    if (fileIds != null && fileIds.isNotEmpty) {
      data['fileIds'] = fileIds;
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
    List<int>? fileIds,
  }) async {
    final data = <String, dynamic>{
      'objectTypeId': objectTypeId,
      'fieldValues': fieldValues,
    };
    if (subjectGroupIds != null && subjectGroupIds.isNotEmpty) {
      data['subjectGroupIds'] = subjectGroupIds;
    }
    if (fileIds != null && fileIds.isNotEmpty) {
      data['fileIds'] = fileIds;
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

    // Handle both response formats:
    // 1. Raw JSON array: [{ ... }, { ... }]
    // 2. Wrapped response: { code: 200, data: [{ ... }] }
    List<dynamic> items;
    if (response is List) {
      items = response;
    } else if (response is Map<String, dynamic>) {
      final data = response['data'];
      if (data is List) {
        items = data;
      } else {
        items = [];
      }
    } else {
      throw Exception('Failed to load subject groups');
    }

    return items
        .map((item) => SubjectGroup.fromJson(item as Map<String, dynamic>))
        .toList();
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

  @override
  Future<Either<Failure, int>> deleteSubjectGroup({
    required int objectGroupId,
  }) async {
    return await catchError<int>(() async {
      await _subjectGroupService.deleteSubjectGroup(
        subjectGroupId: objectGroupId,
      );
      return Right(objectGroupId);
    });
  }

  @override
  Future<Either<Failure, CheckSubjectGroupModel>> checkSubjectGroup(
    int id,
  ) async {
    return await catchError<CheckSubjectGroupModel>(() async {
      final data = await _subjectGroupService.getCheckSubjectGroup(id);
      return Right(data);
    });
  }

  @override
  Future<String> downloadTemplate(int objectTypeId) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final tempDir = await Directory.systemTemp.createTemp('template_');
    final savePath = '${tempDir.path}/template_$objectTypeId.xlsx';

    await _apiClient.dio.download(
      '${EndPoints.baseUrl}/api/objects/template',
      savePath,
      queryParameters: {'objectTypeId': objectTypeId},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return savePath;
  }

  @override
  Future<int> importObjects(
    int objectTypeId,
    String filePath,
    List<int> subjectGroupIds,
  ) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final queryParams = <String, dynamic>{
      'objectTypeId': objectTypeId,
      'subjectGroupIds': subjectGroupIds.isNotEmpty ? subjectGroupIds : [0],
    };

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });

    final response = await _apiClient.dio.post(
      '${EndPoints.baseUrl}/api/objects/import',
      data: formData,
      queryParameters: queryParams,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return data['importId'] ?? data['id'] ?? 0;
      }
      return 0;
    }
    throw Exception('Failed to import objects');
  }

  @override
  Future<Map<String, dynamic>> getImportStatus(int importId) async {
    final response = await _apiClient.get(
      '${EndPoints.baseUrl}/api/objects/import/status/$importId',
    );

    if (response != null && response is Map<String, dynamic>) {
      return response;
    }
    throw Exception('Failed to get import status');
  }

  @override
  Future<String> exportObjects(
    int objectTypeId, {
    int? subjectGroupId,
    String? search,
  }) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final tempDir = await Directory.systemTemp.createTemp('export_');
    final savePath = '${tempDir.path}/export_$objectTypeId.xlsx';

    final queryParams = <String, dynamic>{
      'objectTypeId': objectTypeId,
      'subjectGroupIds': (subjectGroupId != null && subjectGroupId > 0)
          ? [subjectGroupId]
          : [0],
    };
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }

    await _apiClient.dio.download(
      '${EndPoints.baseUrl}/api/objects/export',
      savePath,
      queryParameters: queryParams,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return savePath;
  }
}
