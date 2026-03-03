import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/sources.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';

class EventService {
  final HttpClient httpClient;

  const EventService(this.httpClient);

  exportEvent({
    int? startTime,
    int? endTime,
    List<String>? eventType,
    List<String>? cameraIds,
  }) async {
    final raw = await httpClient.post(
      url: EndPoints.exportEvent,
      data: {
        if (startTime != null) 'startTime': startTime,
        if (endTime != null) 'endTime': endTime,
        if (eventType != null) 'eventTypes': eventType,
        if (cameraIds != null) 'cameraIds': cameraIds,
      },
    );

    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    return response.data;
  }

  getAllEventType() async {
    final raw = await httpClient.get(EndPoints.eventType);

    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  getEventDetail(int eventId) async {
    final raw = await httpClient.get('${EndPoints.baseEvent}/$eventId');

    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  getEventDisplayConfig(String eventType, int typeConfig, {int? subjectTypeId}) async {
    final raw = await httpClient.get(
      EndPoints.configEventDisplay,
      queryParameters: {
        'eventType': eventType,
        'typeConfig': typeConfig,
        if (subjectTypeId != null) 'subjectTypeId': subjectTypeId,
      },
    );

    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  searchEvent({
    int? startTime,
    int? endTime,
    List<String>? eventType,
    List<String>? cameraIds,
    int? page,
  }) async {
    final raw = await httpClient.post(
      url: EndPoints.searchEvent,
      data: {
        if (startTime != null) 'startTime': startTime,
        if (endTime != null) 'endTime': endTime,
        if (eventType != null) 'eventTypes': eventType,
        if (cameraIds != null) 'cameraIds': cameraIds,
        'page': page,
      },
    );

    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    return response.data;
  }

  updateEvent(int eventId, String description) async {
    final raw = await httpClient.put(
      url: '${EndPoints.baseEvent}/$eventId',
      data: {'description': description},
    );

    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    return response.data;
  }

  updateEventDisplayConfig(List<Map<String, dynamic>> configs) async {
    final raw = await httpClient.put(url: EndPoints.configEventDisplay, data: configs);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }
}
