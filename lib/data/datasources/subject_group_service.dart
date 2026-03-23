import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/check_subject_group_model.dart';

class SubjectGroupService {
  final HttpClient httpClient;

  SubjectGroupService(this.httpClient);

  Future<List<SubjectGroup>> getSubjectGroups() async {
    final raw = await httpClient.get(EndPoints.baseSubjectGroup);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return (response.data as List)
        .map((json) => SubjectGroup.fromJson(json))
        .toList();
  }

  Future<SubjectGroup> postSubjectGroup({
    required String name,
    int? parentId,
  }) async {
    final raw = await httpClient.post(
      url: EndPoints.baseSubjectGroup,
      data: {'name': name, 'parentId': parentId},
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return SubjectGroup.fromJson(response.data);
  }

  Future<SubjectGroup> putEditSubjectGroup({
    required int subjectGroupId,
    required SubjectGroup request,
  }) async {
    final raw = await httpClient.put(
      url: '${EndPoints.baseSubjectGroup}/$subjectGroupId',
      data: request.toJsonEdit(),
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return SubjectGroup.fromJson(response.data);
  }

  Future<bool> deleteSubjectGroup({required int subjectGroupId}) async {
    final raw = await httpClient.delete(
      url: '${EndPoints.baseSubjectGroup}/$subjectGroupId',
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return true;
  }

  Future<CheckSubjectGroupModel> getCheckSubjectGroup(int id) async {
    final raw = await httpClient.get(EndPoints.checkSubjectGroup(id));
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return CheckSubjectGroupModel.fromJson(response.data);
  }
}
