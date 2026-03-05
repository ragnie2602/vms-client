import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/mappers/detect_event_mapper.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.vsv.1.3.pb.dart'
    as pb;
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';

class NotificationService {
  final HttpClient httpClient;
  final SocketApiClient socketClient;
  NotificationService(this.httpClient, this.socketClient);

  Future<NotificationSettingEntity> updateNotificationSetting(
    NotificationSettingEntity notificationSetting,
  ) async {
    final raw = await httpClient.put(
      url: EndPoints.notificationSetting,
      data: notificationSetting.toJson(),
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return NotificationSettingEntity.fromJson(response.data);
  }
}
