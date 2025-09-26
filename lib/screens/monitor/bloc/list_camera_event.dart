part of 'list_camera_bloc.dart';

class ListCameraEvent extends BaseEvent {}

class GetAllCamera extends ListCameraEvent {}

class DisposePlayer extends ListCameraEvent {
  final VideoPlayerController player;
  final bool sequentialMode;

  DisposePlayer(this.player, {this.sequentialMode = true});
}
