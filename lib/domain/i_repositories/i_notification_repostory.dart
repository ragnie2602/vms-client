import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/notification/header_notification.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';

abstract class INotificationRepository {
  Future<Either<Failure, NotificationSettingEntity>> updateNotificationSetting(
    NotificationSettingEntity notificationSetting,
  );

  Future<Either<Failure, NotificationSettingEntity>> getNotificationSetting();

  Future<Either<Failure, (int, List<HeaderNotification>)>> getNotifications({
    int? lastNotificationId,
  });
  Future<Either<Failure, int>> markReadNotification(int notificationId);
}
