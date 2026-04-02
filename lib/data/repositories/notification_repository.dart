import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/notification_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/notification/header_notification.dart';
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
  Future<Either<Failure, (int, List<HeaderNotification>)>> getNotifications({
    int? lastNotificationId,
  }) async {
    return await catchError<(int, List<HeaderNotification>)>(() async {
      final Map<String, dynamic> data = await notificationService.getNotifications({
        'offsetId': lastNotificationId,
        'page': 0,
        'size': 6,
      });

      final int unreadCount = data['unreadCount'];
      final List<HeaderNotification> notifications = (data['notifications']['content'] as List)
          .map((e) => HeaderNotification.fromJson(e))
          .toList();

      return Right((unreadCount, notifications));
    });
  }

  @override
  Future<Either<Failure, int>> markReadNotification(int notificationId) async {
    return await catchError<int>(() async {
      await notificationService.markReadNotification(notificationId);
      return Right(notificationId);
    });
  }
}
