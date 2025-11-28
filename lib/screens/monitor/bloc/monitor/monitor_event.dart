part of 'monitor_bloc.dart';

class MonitorEvent extends BaseEvent {}

class GetAllCamera extends MonitorEvent {
  final ViewMode? mode;
  final Set<TagEntity>? tags;

  GetAllCamera({this.mode, this.tags});
}

class GetAllCameraInGroup extends MonitorEvent {
  final List<int> groupId;
  final Set<TagEntity>? tags;

  GetAllCameraInGroup(this.groupId, {this.tags});
}

class GetAllCameraNoGroup extends MonitorEvent {
  final Set<TagEntity>? tags;

  GetAllCameraNoGroup({this.tags});
}

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
