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
}
