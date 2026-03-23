part of 'notification_setting_bloc.dart';

class NotificationSettingState extends Equatable {
  const NotificationSettingState();

  @override
  List<Object?> get props => [];
}

class NotificationSettingLoading extends NotificationSettingState {
  const NotificationSettingLoading();
  @override
  List<Object?> get props => [];
}

class NotificationSettingLoadFailed extends NotificationSettingState {
  final String message;
  const NotificationSettingLoadFailed({required this.message});
  @override
  List<Object?> get props => [message];
}

class NotificationSettingLoaded extends NotificationSettingState {
  final NotificationSettingEntity? notificationSetting;
  const NotificationSettingLoaded({this.notificationSetting});
  @override
  List<Object?> get props => [notificationSetting];
}
