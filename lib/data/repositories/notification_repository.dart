import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/notification_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_notification_repostory.dart';

class NotificationRepository extends BaseRepository implements INotificationRepository {
  final NotificationService notificationService;
  const NotificationRepository({required this.notificationService});

  @override
  Future<Either<Failure, NotificationSettingEntity>> updateNotificationSetting(
    NotificationSettingEntity notificationSetting,
  ) async {
    return await catchError<NotificationSettingEntity>(() async {
      final data = await notificationService.updateNotificationSetting(notificationSetting);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, NotificationSettingEntity>> getNotificationSetting() async {
    return await catchError<NotificationSettingEntity>(() async {
      final data = await notificationService.getNotificationSetting();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, List<Object>>> getNotifications() {
    return await catchError<List<Object>>(() async {
      final data = await notificationService.getNotifications();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, void>> markReadNotification(String notificationId) {
    return await catchError<void>(() async {
      await notificationService.markReadNotification(notificationId);
      return Right(null);
    });
  }
}
