import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';
import 'package:vms_flutter_client/screens/schedule_recording/config_dialog.dart';

class ScheduleEvent extends BaseEvent {}

class InitScheduleEvent extends ScheduleEvent {
  final List<int> cameraId;

  InitScheduleEvent({required this.cameraId});
  @override
  List<Object?> get props => [cameraId];
}

class ChangeTabEvent extends ScheduleEvent {
  final ConfigCameraTab newTab;

  ChangeTabEvent(this.newTab);
}

class SubmitNewScheduleRecordEvent extends ScheduleEvent {
  final List<int> cameraId;
  final RecordingEntity? newRecording;

  @override
  List<Object?> get props => [cameraId, newRecording];

  SubmitNewScheduleRecordEvent({required this.cameraId, this.newRecording});
}
