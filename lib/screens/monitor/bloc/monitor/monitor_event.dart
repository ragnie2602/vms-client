part of 'monitor_bloc.dart';

class MonitorEvent extends BaseEvent {}

class GetAllCamera extends MonitorEvent {}

class DisposePlayer extends MonitorEvent {
  final Player player;
  final bool sequentialMode;

  DisposePlayer(this.player, {this.sequentialMode = true});
}

class ChangeGridMode extends MonitorEvent {
  final ViewMode mode;

  ChangeGridMode(this.mode);
}
