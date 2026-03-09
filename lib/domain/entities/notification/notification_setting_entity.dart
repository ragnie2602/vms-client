import 'dart:convert';

NotificationSettingEntity notificationSettingEntityFromJson(String str) =>
    NotificationSettingEntity.fromJson(json.decode(str));

String notificationSettingEntityToJson(NotificationSettingEntity data) =>
    json.encode(data.toJson());

class NotificationSettingEntity {
  int? id;
  int? cooldownValue;
  String? cooldownUnit;
  List<EventConfigEntity>? eventConfigs;

  NotificationSettingEntity({
    this.id,
    this.cooldownValue,
    this.cooldownUnit,
    this.eventConfigs,
  });

  NotificationSettingEntity copyWith({
    int? id,
    int? cooldownValue,
    String? cooldownUnit,
    List<EventConfigEntity>? eventConfigs,
  }) => NotificationSettingEntity(
    id: id ?? this.id,
    cooldownValue: cooldownValue ?? this.cooldownValue,
    cooldownUnit: cooldownUnit ?? this.cooldownUnit,
    eventConfigs: eventConfigs ?? this.eventConfigs,
  );

  factory NotificationSettingEntity.fromJson(Map<String, dynamic> json) =>
      NotificationSettingEntity(
        id: json["id"],
        cooldownValue: json["cooldownValue"],
        cooldownUnit: json["cooldownUnit"],
        eventConfigs: json["eventConfigs"] != null
            ? (json["eventConfigs"] as List<dynamic>)
                  .map((e) => EventConfigEntity.fromJson(e))
                  .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cooldownValue": cooldownValue,
    "cooldownUnit": cooldownUnit,
    "eventConfigs": eventConfigs?.map((e) => e.toJson()).toList(),
  };
}

class EventConfigEntity {
  int? id;
  String? eventType;
  bool? popupEnabled;
  bool? soundEnabled;

  EventConfigEntity({
    this.id,
    this.eventType,
    this.popupEnabled,
    this.soundEnabled,
  });

  EventConfigEntity copyWith({
    int? id,
    String? eventType,
    bool? popupEnabled,
    bool? soundEnabled,
  }) => EventConfigEntity(
    id: id ?? this.id,
    eventType: eventType ?? this.eventType,
    popupEnabled: popupEnabled ?? this.popupEnabled,
    soundEnabled: soundEnabled ?? this.soundEnabled,
  );

  factory EventConfigEntity.fromJson(Map<String, dynamic> json) =>
      EventConfigEntity(
        id: json["id"],
        eventType: json["eventType"],
        popupEnabled: json["popupEnabled"],
        soundEnabled: json["soundEnabled"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eventType": eventType,
    "popupEnabled": popupEnabled,
    "soundEnabled": soundEnabled,
  };
}
