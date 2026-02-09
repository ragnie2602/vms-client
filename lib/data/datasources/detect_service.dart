import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/mappers/detect_event_mapper.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.vsv.1.3.pb.dart'
    as pb;
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';

class DetectService {
  final HttpClient httpClient;
  final SocketApiClient socketClient;
  DetectService(this.httpClient, this.socketClient);

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
    required String eventTypeName,
  }) async {
    final raw = await httpClient.get(
      EndPoints.eventDisplayConfigByName(eventTypeName),
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return EventDisplayConfigEntity.fromJson(response.data);
  }

  Future<EventDisplayConfigEntity> updateEventDisplayConfig({
    required List<String> listField,
    required String eventTypeName,
  }) async {
    final raw = await httpClient.put(
      url: EndPoints.eventDisplayConfigByName(eventTypeName),
      data: {'fields': listField},
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return EventDisplayConfigEntity.fromJson(response.data);
  }

  Stream<ReceiveEventEntity> get receiveEventStream {
    return socketClient
        .listen()
        .where((event) {
          return event['packetType'] == PacketType.receiveEvent.value;
        })
        .map((event) {
          return pb.ReceiveEvent.fromBuffer(
            event['data'] as List<int>,
          ).toDomain();
        });
  }
}
