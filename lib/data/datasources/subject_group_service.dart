import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';

class SubjectGroupService {
  final HttpClient httpClient;

  SubjectGroupService(this.httpClient);

  Future<SubjectGroup> putEditSubjectGroup({
    required int subjectGroupId,
    required SubjectGroup request,
  }) async {
    final raw = await httpClient.put(
      url: '${EndPoints.baseSubjectGroup}/$subjectGroupId',
      data: request.toJson(),
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return SubjectGroup.fromJson(response.data);
  }

  Future<void> deleteSubjectGroup({required int subjectGroupId}) async {
    final raw = await httpClient.delete(
      url: '${EndPoints.baseSubjectGroup}/$subjectGroupId',
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 204) {
      throw ApiException(response.message);
    }
    return response.data;
  }
}
