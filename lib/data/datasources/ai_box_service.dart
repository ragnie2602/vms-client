import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';

class AiBoxService {
  final HttpClient httpClient;

  AiBoxService(this.httpClient);

  Future<List<AiBoxEntity>> getListAiBox() async {
    final raw = await httpClient.get(EndPoints.baseUrlAiBox);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return (response.data as List<dynamic>)
        .map((e) => AiBoxEntity.fromJson(e))
        .toList();
  }

  Future<AiBoxEntity> postCreateAiBox({required AiBoxEntity request}) async {
    try {
      final raw = await httpClient.post(
        url: EndPoints.baseUrlAiBox,
        data: request.toJson(),
      );
      final response = BaseResponse.fromJson(raw);
      if (response.code != 201) {
        throw ApiException(response.message);
      }
      return AiBoxEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException(parseError(e));
    }
  }
  Future<void> deleteAiBox ({required int aiBoxId}) async {
    try {
      final raw = await httpClient.delete(
        url: EndPoints.aiBoxDetail(aiBoxId),
      );
      final response = BaseResponse.fromJson(raw);
      if (response.code != 200) {
        throw ApiException(response.message);
      }
      return response.data;
    } on DioException catch (e) {
      throw ApiException(parseError(e));
    }
  }
}
