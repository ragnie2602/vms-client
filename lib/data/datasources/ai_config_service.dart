import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/ai_alarm_config.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/alarm_sound.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/camera_alarm_config.dart';

import '../models/response/base_response.dart';
import 'http_client.dart';

class AiConfigService {
  final HttpClient httpClient;

  const AiConfigService(this.httpClient);

  Future<List<CameraAlarmConfig>> getAiAlarmConfigs(String cameraId) async {
    final raw = await httpClient.get('${EndPoints.cameraAiConfig}/$cameraId');
    final response = BaseResponse.fromJson(raw);

    return (response.data as List)
        .map<CameraAlarmConfig>((e) => CameraAlarmConfig.fromJson(e))
        .toList();
  }

  Future<AIAlarmConfig> getAiAlarmConfigDetail({
    required String cameraId,
    required String alarmType,
    required int status,
  }) async {
    final raw = await httpClient.get('${EndPoints.cameraAiConfig}/$cameraId/$alarmType');
    final response = BaseResponse.fromJson(raw);

    late AIAlarmConfig res;
    if (response.data is Map) {
      res = AIAlarmConfig.fromJson(response.data);
    } else {
      res = AIAlarmConfig(type: AIAlarmType.fromKey(alarmType), status: status);
    }

    return res;
  }

  Future<List<AlarmSound>> getAlarmSounds() async {
    final raw = await httpClient.get(EndPoints.alarmSound);
    final response = BaseResponse.fromJson(raw);
    return (response.data as List).map<AlarmSound>((e) => AlarmSound.fromJson(e)).toList();
  }
}
