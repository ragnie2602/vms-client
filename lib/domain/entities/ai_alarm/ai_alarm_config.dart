import 'al_alarm_type.dart';
export 'al_alarm_type.dart';

class AlarmConditions {
  int? keepTimeThreshold; // xâm nhập, điện thoại
  int? minTime;
  int? busiType; // báo cháy (0: lửa, 1: khói, 2: pháo hoa)
  AlarmConditions({this.keepTimeThreshold, this.minTime, this.busiType});
  factory AlarmConditions.fromJson(Map<String, dynamic> json) {
    return AlarmConditions(
      keepTimeThreshold: json['keepTimeThreshold'],
      minTime: json['minTime'],
      busiType: json['busiType'] is List && (json['busiType'] as List).isNotEmpty
          ? (json['busiType'] as List).first
          : json['busiType'],
    );
  }
}

class ROIData {
  double x;
  double y;
  int seq;
  ROIData({required this.seq, required this.x, required this.y});
  factory ROIData.fromJson(Map<String, dynamic> json) {
    return ROIData(seq: json['seq'], x: json['x'], y: json['y']);
  }
}

class ROIConfig {
  List<ROIData> points;
  ROIConfig({required this.points});
  factory ROIConfig.fromJson(Map<String, dynamic> json) {
    return ROIConfig(
      points: json['points'] != null
          ? (json['points'] as List).map<ROIData>((e) => ROIData.fromJson(e)).toList()
          : [],
    );
  }
}

class TimesConfig {
  List<int> days;
  String? startTime;
  String? endTime;
  TimesConfig({required this.days, required this.startTime, required this.endTime});
  factory TimesConfig.fromJson(Map<String, dynamic> json) {
    return TimesConfig(
      days: json['days'] != null ? (json['days'] as List).map<int>((e) => e).toList() : [],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }
  factory TimesConfig.empty() {
    return TimesConfig(days: [], startTime: null, endTime: null);
  }
}

class AIAlarmConfig {
  final int? id;
  final AIAlarmType type;
  int status;
  int? aiBoxId;
  int? suggestedAiBoxId;
  int? soundId;
  AlarmConditions alarmConditions;
  List<ROIConfig> rois;
  List<TimesConfig> times;
  AIAlarmConfig({
    required this.type,
    required this.status,
    this.id,
    this.aiBoxId,
    this.suggestedAiBoxId,
    this.soundId,
    AlarmConditions? alarmConditions,
    List<ROIConfig>? rois,
    List<TimesConfig>? times,
  }) : rois = rois ?? [],
       times = times ?? [],
       alarmConditions = alarmConditions ?? AlarmConditions();

  factory AIAlarmConfig.fromJson(Map<String, dynamic> json) {
    final type = AIAlarmType.fromKey(json['eventType'] ?? '');
    return AIAlarmConfig(
      type: type,
      status: json['status'],
      id: json['id'],
      aiBoxId: json['aiBoxId'],
      suggestedAiBoxId: json['suggestedAiBoxId'],
      soundId: json['soundId'],
      alarmConditions: json['alarmConditions'] != null
          ? AlarmConditions.fromJson(json['alarmConditions'])
          : null,
      rois: json['rois'] != null
          ? (json['rois'] as List).map<ROIConfig>((e) => ROIConfig.fromJson(e)).toList()
          : <ROIConfig>[],
      times: json['times'] != null
          ? (json['times'] as List).map<TimesConfig>((e) => TimesConfig.fromJson(e)).toList()
          : <TimesConfig>[],
    );
  }
}
