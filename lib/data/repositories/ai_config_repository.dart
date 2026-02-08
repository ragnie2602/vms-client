import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/ai_alarm_config.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/alarm_sound.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/camera_alarm_config.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_config_repository.dart';

import '../datasources/ai_config_service.dart';
import 'base_repository.dart';

class AiConfigRepository extends BaseRepository implements IAiConfigRepository {
  final AiConfigService service;
  const AiConfigRepository(this.service);

  @override
  Future<Either<Failure, List<CameraAlarmConfig>>> getAiAlarmConfigs(String cameraId) async {
    return await catchError<List<CameraAlarmConfig>>(() async {
      final cameraAlarmConfigs = await service.getAiAlarmConfigs(cameraId);
      return Right(cameraAlarmConfigs);
    });
  }

  @override
  Future<Either<Failure, AIAlarmConfig>> getAiAlarmConfigDetail({
    required String cameraId,
    required String alarmType,
    required int status,
  }) async {
    return await catchError<AIAlarmConfig>(() async {
      final aiAlarmConfig = await service.getAiAlarmConfigDetail(
        cameraId: cameraId,
        alarmType: alarmType,
        status: status,
      );
      return Right(aiAlarmConfig);
    });
  }

  @override
  Future<Either<Failure, List<AlarmSound>>> getAlarmSounds() async {
    return await catchError<List<AlarmSound>>(() async {
      final alarmSounds = await service.getAlarmSounds();
      return Right(alarmSounds);
    });
  }
}
