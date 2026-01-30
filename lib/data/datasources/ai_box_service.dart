import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';

class AiBoxService {
  final HttpClient httpClient;

  AiBoxService(this.httpClient);

  Future<List<AiBoxEntity>> getListAiBox() async {
    final raw = await httpClient.get(EndPoints.getListAiBox);
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);

    return (response.data as List<dynamic>)
        .map((e) => AiBoxEntity.fromJson(e))
        .toList();
  }
}
