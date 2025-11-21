import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pbenum.dart'
    as pb;
import 'package:vms_flutter_client/domain/entities/schedule/camera_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_type_schedule.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_entity.dart';

extension RecordingTypeScheduleExtension on pb.Recording_TypeSchedule {
  RecordingTypeSchedule toDomain() {
    return RecordingTypeSchedule.fromValue(value);
  }
}

extension ScheduleTimeDayExtension on ScheduleTime_Day {
  ScheduleTimeDay toDomain() {
    return ScheduleTimeDay.getTypeFromValue(value);
  }
}

extension ScheduleTimeExtension on ScheduleTime {
  ScheduleTimeEntity toDomain() {
    return ScheduleTimeEntity(
      startTime: startTime,
      endTime: endTime,
      scheduleTimeEnable: scheduleTimeEnable,
      dayRecord: dayRecord.toDomain(),
    );
  }
}

extension RecordingExtion on Recording {
  RecordingEntity toDomain() {
    return RecordingEntity(
      turnOnRecording: turnOnRecording,
      typeScheduleRecording: typeScheduleRecording.toDomain(),
      prefixPath: prefixPath,
      schedules: schedules.map((schedule) => schedule.toDomain()).toList(),
    );
  }
}

extension CameraConfigExtion on CameraConfig {
  CameraConfigEntity toDomain() {
    return CameraConfigEntity(
      mirror: mirror,
      flip: flip,
      nightvision: nightvision,
      brightness: brightness,
      recording: recording.toDomain(),
    );
  }
}
