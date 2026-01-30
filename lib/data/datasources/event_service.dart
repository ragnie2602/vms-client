import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/sources.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';

class EventService {
  final HttpClient httpClient;

  const EventService(this.httpClient);

  getAllEventType() async {
    final raw = await httpClient.get(EndPoints.eventType);

    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  searchEvent({
    int? startTime,
    int? endTime,
    int? eventType,
    List<int>? cameraIds,
    int? page,
  }) async {
    final raw = await httpClient.post(
      url: EndPoints.searchEvent,
      data: {
        if (startTime != null) 'startTime': startTime,
        if (endTime != null) 'endTime': endTime,
        if (eventType != null) 'eventType': eventType,
        if (cameraIds != null) 'cameraIds': cameraIds,
        'page': page,
      },
    );

    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    return response.data;
  }
}
