import 'dart:convert';

class ReceiveEventEntity {
  final String? eventType;
  final String? eventData;
  final List<int>? cameraId;

  ReceiveEventEntity({this.eventType, this.eventData, this.cameraId});

  EventDataEntity get eventDataEntity {
    if (eventData == null || eventData!.isEmpty) {
      return EventDataEntity();
    }
    try {
      final decoded = jsonDecode(eventData!);
      if (decoded is Map<String, dynamic>) {
        return EventDataEntity.fromJson(decoded);
      }
      return EventDataEntity();
    } catch (e) {
      return EventDataEntity();
    }
  }
}

class EventDataEntity {
  final String? captureTime;
  final String? imageUrl;
  final List<ConfigEventDataEntity>? configData;

  EventDataEntity({this.captureTime, this.imageUrl, this.configData});

  factory EventDataEntity.fromJson(Map<String, dynamic> json) {
    return EventDataEntity(
      captureTime: json['captureTime'],
      imageUrl: json['imageUrl'],
      configData: json['configData'] != null
          ? (json['configData'] as List)
                .map((e) => ConfigEventDataEntity.fromJson(e))
                .toList()
          : null,
    );
  }
}

class ConfigEventDataEntity {
  final String? icon;
  final String? data;

  ConfigEventDataEntity({this.icon, this.data});

  factory ConfigEventDataEntity.fromJson(Map<String, dynamic> json) {
    return ConfigEventDataEntity(icon: json['icon'], data: json['data']);
  }
}
