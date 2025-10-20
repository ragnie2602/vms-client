part of 'monitor_bloc.dart';

class MonitorEvent extends BaseEvent {}

class GetAllCamera extends MonitorEvent {}

class GetCameraAtPage extends MonitorEvent {
  final int page;

  GetCameraAtPage(this.page);
}

class ChangeGridMode extends MonitorEvent {
  final ViewMode mode;

  ChangeGridMode(this.mode);
}
