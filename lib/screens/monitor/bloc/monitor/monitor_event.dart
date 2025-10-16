part of 'monitor_bloc.dart';

class MonitorEvent extends BaseEvent {}

class GetAllCamera extends MonitorEvent {}

class ChangeGridMode extends MonitorEvent {
  final ViewMode mode;

  ChangeGridMode(this.mode);
}
