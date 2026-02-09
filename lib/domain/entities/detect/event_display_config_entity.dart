import 'dart:convert';

import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';

EventDisplayConfigEntity eventDisplayConfigEntityFromJson(String str) =>
    EventDisplayConfigEntity.fromJson(json.decode(str));

String eventDisplayConfigEntityToJson(EventDisplayConfigEntity data) =>
    json.encode(data.toJson());

class EventDisplayConfigEntity {
  int? eventTypeId;
  String? eventTypeName;
  List<FieldConfigEntity>? fields;

  EventDisplayConfigEntity({this.eventTypeId, this.eventTypeName, this.fields});

  EventDisplayConfigEntity copyWith({
    int? eventTypeId,
    String? eventTypeName,
    List<FieldConfigEntity>? fields,
  }) => EventDisplayConfigEntity(
    eventTypeId: eventTypeId ?? this.eventTypeId,
    eventTypeName: eventTypeName ?? this.eventTypeName,
    fields: fields ?? this.fields,
  );

  factory EventDisplayConfigEntity.fromJson(Map<String, dynamic> json) =>
      EventDisplayConfigEntity(
        eventTypeId: json["eventTypeId"],
        eventTypeName: json["eventTypeName"],
        fields: json["fields"] == null
            ? []
            : List<FieldConfigEntity>.from(
                json["fields"]!.map((x) => FieldConfigEntity.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "eventTypeId": eventTypeId,
    "eventTypeName": eventTypeName,
    "fields": fields == null
        ? []
        : List<FieldConfigEntity>.from(fields!.map((x) => x.toJson())),
  };
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventDisplayConfigEntity &&
        other.eventTypeId == eventTypeId;
  }

  @override
  int get hashCode => eventTypeId.hashCode;
}
