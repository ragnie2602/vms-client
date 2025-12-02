import 'package:vms_flutter_client/core/base_bloc.dart';

class MultiPlaybackEvent extends BaseEvent {
  const MultiPlaybackEvent();
}

class ChangePlaybackDate extends MultiPlaybackEvent {
  final DateTime date;
  const ChangePlaybackDate({required this.date});
}

class AddCameraEvent extends MultiPlaybackEvent {}

class RemoveCameraEvent extends MultiPlaybackEvent {}

// class OnUpdate
