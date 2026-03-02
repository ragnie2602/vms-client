import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_setting_event.dart';
part 'notification_setting_state.dart';

class NotificationSettingBloc
    extends Bloc<NotificationSettingEvent, NotificationSettingState> {
  NotificationSettingBloc() : super(const NotificationSettingState()) {}
}
