import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';

abstract class INotificationRepository {
  Future<Either<Failure, NotificationSettingEntity>> updateNotificationSetting(
    NotificationSettingEntity notificationSetting,
  );
}