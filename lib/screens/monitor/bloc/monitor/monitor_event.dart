part of 'monitor_bloc.dart';

class MonitorEvent extends BaseEvent {}

class GetAllCamera extends MonitorEvent {
  final ViewMode? mode;
  final bool refresh;

  GetAllCamera({this.mode, this.refresh = false});
}

class GetAllCameraInGroup extends MonitorEvent {
  final List<int> groupId;

  GetAllCameraInGroup(this.groupId);
}

class GetAllCameraNoGroup extends MonitorEvent {}

class GetCameraAtPage extends MonitorEvent {
  final int page;

  GetCameraAtPage(this.page);
}

class ChangeGridMode extends MonitorEvent {
  final ViewMode mode;

  ChangeGridMode(this.mode);
}

class ResetFilter extends MonitorEvent {}

class MultiWindowEventReceived extends MonitorEvent {
  final MWE multiWindowEvent;

  MultiWindowEventReceived(this.multiWindowEvent);
}

class ReopenMonitor extends MonitorEvent {
  final List<int> id;
  final int mode;

  ReopenMonitor(this.id, this.mode);
}
