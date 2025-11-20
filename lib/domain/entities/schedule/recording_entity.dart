import 'package:vms_flutter_client/domain/entities/schedule/recording_type_schedule.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';
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

  bool checkAllDay(ScheduleTimeDay day) {
    if (schedules == null || schedules!.isEmpty) {
      return false;
    }
    // đếm số lượng khung giờ đã được chọn trong ngày (nếu đủ 24 khung giờ thì trả về true)
    return schedules?.where((element) => element.dayRecord == day).length == 24;
  }
}
