// To parse this JSON data, do
//
//     final fieldConfigEntity = fieldConfigEntityFromJson(jsonString);

import 'dart:convert';

FieldConfigEntity fieldConfigEntityFromJson(String str) =>
    FieldConfigEntity.fromJson(json.decode(str));

String fieldConfigEntityToJson(FieldConfigEntity data) => json.encode(data.toJson());

class FieldConfigEntity {
    String? code;
    String? label;
    String? group;
    String? icon;

    FieldConfigEntity({
        this.code,
        this.label,
        this.group,
        this.icon,
    });

    FieldConfigEntity copyWith({
        String? code,
        String? label,
        String? group,
        String? icon,
    }) => 
        FieldConfigEntity(
            code: code ?? this.code,
            label: label ?? this.label,
            group: group ?? this.group,
            icon: icon ?? this.icon,
        );

    factory FieldConfigEntity.fromJson(Map<String, dynamic> json) => FieldConfigEntity(
        code: json["code"],
        label: json["label"],
        group: json["group"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "label": label,
        "group": group,
        "icon": icon,
    };
}
