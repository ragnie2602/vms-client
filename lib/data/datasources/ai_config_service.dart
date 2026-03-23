import 'dart:convert';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
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

  Future<AIAlarmConfig> updateAiAlarmConfigDetail({
    required String cameraId,
    required String alarmType,
    required AIAlarmConfig config,
  }) async {
    final raw = await httpClient.put(
      url: '${EndPoints.cameraAiConfig}/$cameraId/$alarmType',
      data: config.toJson(),
    );
    final response = BaseResponse.fromJson(raw);

    late AIAlarmConfig res;
    if (response.data is Map) {
      res = AIAlarmConfig.fromJson(response.data);
    } else {
      throw Exception(response.data.runtimeType);
    }

    return res;
  }

  Future<List<AlarmSound>> getAlarmSounds() async {
    try {
      final raw = await httpClient.get(EndPoints.alarmSound);
      final response = BaseResponse.fromJson(raw);

      // Có dữ liệu mới ==> cache
      if (response.data is List && (response.data as List).isNotEmpty) {
        AppData.instance.save<String>(AppKeys.SP_ALARM_SOUNDS, jsonEncode(response.data));
      }

      return (response.data as List).map<AlarmSound>((e) => AlarmSound.fromJson(e)).toList();
    } catch (e) {
      final cachedSounds = _getCachedAlarmSounds();
      if (cachedSounds != null) return cachedSounds;

      rethrow;
    }
  }

  List<AlarmSound>? _getCachedAlarmSounds() {
    try {
      final cachedSounds = AppData.instance.read<String>(AppKeys.SP_ALARM_SOUNDS);
      if (cachedSounds != null) {
        return (jsonDecode(cachedSounds) as List)
            .map<AlarmSound>((e) => AlarmSound.fromJson(e))
            .toList();
      }
    } catch (_) {}

    return null;
  }
}
