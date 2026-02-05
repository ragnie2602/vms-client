// To parse this JSON data, do
//
//     final eventDisplayConfigEntity = eventDisplayConfigEntityFromJson(jsonString);

import 'dart:convert';

EventDisplayConfigEntity eventDisplayConfigEntityFromJson(String str) => EventDisplayConfigEntity.fromJson(json.decode(str));

String eventDisplayConfigEntityToJson(EventDisplayConfigEntity data) => json.encode(data.toJson());

class EventDisplayConfigEntity {
    int? eventTypeId;
    String? eventTypeName;
    List<String>? fields;

    EventDisplayConfigEntity({
        this.eventTypeId,
        this.eventTypeName,
        this.fields,
    });

    EventDisplayConfigEntity copyWith({
        int? eventTypeId,
        String? eventTypeName,
        List<String>? fields,
    }) => 
        EventDisplayConfigEntity(
            eventTypeId: eventTypeId ?? this.eventTypeId,
            eventTypeName: eventTypeName ?? this.eventTypeName,
            fields: fields ?? this.fields,
        );

    factory EventDisplayConfigEntity.fromJson(Map<String, dynamic> json) => EventDisplayConfigEntity(
        eventTypeId: json["eventTypeId"],
        eventTypeName: json["eventTypeName"],
        fields: json["fields"] == null ? [] : List<String>.from(json["fields"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "eventTypeId": eventTypeId,
        "eventTypeName": eventTypeName,
        "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x)),
    };
}
