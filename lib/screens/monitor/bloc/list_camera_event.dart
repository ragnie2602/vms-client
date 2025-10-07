part of 'list_camera_bloc.dart';

class ListCameraEvent extends BaseEvent {}

class GetAllCamera extends ListCameraEvent {}

class DisposePlayer extends ListCameraEvent {
  final Player player;
  final bool sequentialMode;

  DisposePlayer(this.player, {this.sequentialMode = true});
}

class ChangeGridMode extends ListCameraEvent {
  final BaseView mode;

  ChangeGridMode(this.mode);
}
