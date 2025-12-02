import 'package:vms_flutter_client/core/base_bloc.dart';

class MultiPlaybackEvent extends BaseEvent {}

class AddCameraEvent extends MultiPlaybackEvent {}

class RemoveCameraEvent extends MultiPlaybackEvent {}
// class OnUpdate
