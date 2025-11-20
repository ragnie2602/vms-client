import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';

class ScheduleTimeEntity {
  final int? startTime;
  final int? endTime;
  final bool? scheduleTimeEnable;
  final ScheduleTimeDay? dayRecord;

  const ScheduleTimeEntity({
    this.startTime,
    this.endTime,
    this.scheduleTimeEnable,
    this.dayRecord,
  });
}
