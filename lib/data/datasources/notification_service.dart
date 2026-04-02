import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
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

  Future<NotificationSettingEntity> getNotificationSetting() async {
    final raw = await httpClient.get(EndPoints.notificationSetting);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return NotificationSettingEntity.fromJson(response.data);
  }

  Future<List<Object>> getNotifications() async {
    final raw = await httpClient.get(EndPoints.notifications);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
    return response.data;
  }

  Future<void> markReadNotification(String notificationId) async {
    final raw = await httpClient.post(
      EndPoints.markReadNotification,
      data: {'notificationId': notificationId},
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) {
      throw ApiException(response.message);
    }
  }
}
