import 'package:vms_flutter_client/core/base_response.dart';

import '../entities/ai_alarm/ai_alarm_config.dart';
import '../entities/ai_alarm/alarm_sound.dart';
import '../entities/ai_alarm/camera_alarm_config.dart';

abstract class IAiConfigRepository {
  Future<Either<Failure, List<CameraAlarmConfig>>> getAiAlarmConfigs(String cameraId);
  Future<Either<Failure, AIAlarmConfig>> getAiAlarmConfigDetail({
    required String cameraId,
    required String alarmType,
    required int status,
  });
  Future<Either<Failure, AIAlarmConfig>> updateAiAlarmConfigDetail({
    required String cameraId,
    required String alarmType,
    required AIAlarmConfig config,
  });
  Future<Either<Failure, List<AlarmSound>>> getAlarmSounds();
}
