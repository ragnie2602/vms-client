import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/screens/schedule_recording/config_dialog.dart';

class ScheduleEvent extends BaseEvent {}

class InitScheduleEvent extends ScheduleEvent {}

class ChangeTabEvent extends ScheduleEvent {
  final ConfigCameraTab newTab;

  ChangeTabEvent(this.newTab);
}
