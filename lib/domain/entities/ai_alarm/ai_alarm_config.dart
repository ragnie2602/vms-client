import 'package:intl/intl.dart';

import 'al_alarm_enums.dart';
export 'al_alarm_enums.dart';

class AlarmConditions {
  int? keepTimeThreshold; // xâm nhập, điện thoại
  int? minTime;
  FireAlarmType? busiType; // báo cháy (0: lửa, 1: khói, 2: pháo hoa)
  AlarmConditions({this.keepTimeThreshold, this.minTime, this.busiType});
  factory AlarmConditions.fromJson(Map<String, dynamic> json, AIAlarmType type) {
    return AlarmConditions(
      keepTimeThreshold: type == AIAlarmType.zoneIntrusion || type == AIAlarmType.usingPhone
          ? json['keepTimeThreshold'] ?? 10
          : null,
      minTime: json['minTime'],
      busiType: type == AIAlarmType.fireAlarm
          ? FireAlarmType.fromValue(
              json['busiType'] is List && (json['busiType'] as List).isNotEmpty
                  ? (json['busiType'] as List).first
                  : json['busiType'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (keepTimeThreshold != null) 'keepTimeThreshold': keepTimeThreshold,
      if (minTime != null) 'minTime': minTime,
      if (busiType != null) 'busiType': busiType?.value,
    };
  }

  bool isValid(AIAlarmType type) {
    switch (type) {
      case AIAlarmType.zoneIntrusion:
      case AIAlarmType.usingPhone:
        return keepTimeThreshold != null && keepTimeThreshold! >= 1 && keepTimeThreshold! <= 3600;
      case AIAlarmType.fireAlarm:
        return busiType != null;
      default:
        return true;
    }
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

  bool isEmpty() => days.isEmpty && startTime == null && endTime == null;
  bool isValid() =>
      isEmpty() ||
      (days.isNotEmpty &&
          startTime != null &&
          endTime != null &&
          DateFormat("HH:mm").parse(endTime!).compareTo(DateFormat("HH:mm").parse(startTime!)) > 0);
}

class AIAlarmConfig {
  final int? id;
  final AIAlarmType type;
  int status;
  int? nonHitAlarm;
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
    this.nonHitAlarm,
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
      alarmConditions: AlarmConditions.fromJson(json['alarmConditions'] ?? {}, type),
      rois: json['rois'] != null
          ? (json['rois'] as List).map<ROIConfig>((e) => ROIConfig.fromJson(e)).toList()
          : <ROIConfig>[],
      times: json['times'] != null
          ? (json['times'] as List).map<TimesConfig>((e) => TimesConfig.fromJson(e)).toList()
          : <TimesConfig>[],
      nonHitAlarm: type == AIAlarmType.faceDetection ? (json['nonHitAlarm'] ?? 0) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aiBoxId': aiBoxId,
      'status': status,
      'soundId': soundId,
      'rois': rois
          .map(
            (e) => {
              'points': e.points.map((e) => {'x': e.x, 'y': e.y, 'seq': e.seq}).toList(),
            },
          )
          .toList(),
      'times': times
          .where((e) => !e.isEmpty())
          .map((e) => {'days': e.days, 'startTime': e.startTime, 'endTime': e.endTime})
          .toList(),
      'alarmConditions': alarmConditions.toJson(),
      if (type == AIAlarmType.faceDetection) 'nonHitAlarm': nonHitAlarm ?? 0,
    };
  }

  bool validate() {
    if (aiBoxId == null) return false; // AI box
    if (soundId == null) return false; // Sound

    // Times
    if (times.isNotEmpty && times.any((data) => !data.isValid())) return false;

    // conditions
    if (!alarmConditions.isValid(type)) return false;

    return true;
  }
}
