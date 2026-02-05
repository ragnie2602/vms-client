import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';

class DetectService {
  final HttpClient httpClient;
  DetectService(this.httpClient);

  Future<List<TypeEventDetectEntity>> getListTypeEventDetect() async {
    final raw = await httpClient.get(EndPoints.getListTypeEventDetect);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return (response.data as List<dynamic>)
        .map((e) => TypeEventDetectEntity.fromJson(e))
        .toList();
  }

  Future<List<FieldConfigEntity>> getListFieldAvailable() async {
    final raw = await httpClient.get(EndPoints.getAvailableFields);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return (response.data as List<dynamic>)
        .map((e) => FieldConfigEntity.fromJson(e))
        .toList();
  }

  Future<EventDisplayConfigEntity> getEventDisplayConfig({
    required int eventTypeId,
  }) async {
    final raw = await httpClient.get(
      EndPoints.eventDisplayConfigById(eventTypeId),
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return EventDisplayConfigEntity.fromJson(response.data);
  }

  Future<EventDisplayConfigEntity> updateEventDisplayConfig({
    required List<String> listField,
    required int eventTypeId,
  }) async {
    final raw = await httpClient.put(
      url: EndPoints.eventDisplayConfigById(eventTypeId),
      data: {'fields': listField},
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return EventDisplayConfigEntity.fromJson(response.data);
  }
}
