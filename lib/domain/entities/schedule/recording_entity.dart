import 'package:vms_flutter_client/domain/entities/schedule/recording_type_schedule.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_entity.dart';

class RecordingEntity {
  final bool? turnOnRecording;
  final RecordingTypeSchedule? typeScheduleRecording;
  final String? prefixPath;
  final List<ScheduleTimeEntity>? schedules;

  const RecordingEntity({
    this.turnOnRecording,
    this.typeScheduleRecording,
    this.prefixPath,
    this.schedules,
  });
}