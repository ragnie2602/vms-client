part of 'notification_setting_bloc.dart';

sealed class NotificationSettingEvent extends BaseEvent {
  const NotificationSettingEvent();

  @override
  List<Object?> get props => [];
}

class GetNotificationSettingEvent extends NotificationSettingEvent {
  const GetNotificationSettingEvent();
  @override
  List<Object?> get props => [];
}

class UpdateNotificationSettingEvent extends NotificationSettingEvent {
  final NotificationSettingEntity notificationSetting;
  const UpdateNotificationSettingEvent({required this.notificationSetting});
  @override
  List<Object?> get props => [notificationSetting];
}