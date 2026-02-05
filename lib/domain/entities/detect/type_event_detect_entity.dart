import 'dart:convert';

TypeEventDetectEntity typeEventDetectEnityFromJson(String str) =>
    TypeEventDetectEntity.fromJson(json.decode(str));

String typeEventDetectEnityToJson(TypeEventDetectEntity data) =>
    json.encode(data.toJson());

class TypeEventDetectEntity {
  int? type;
  String? name;
  String? shortName;

  TypeEventDetectEntity({this.type, this.name, this.shortName});

  TypeEventDetectEntity copyWith({
    int? type,
    String? name,
    String? shortName,
  }) => TypeEventDetectEntity(
    type: type ?? this.type,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
  );

  factory TypeEventDetectEntity.fromJson(Map<String, dynamic> json) =>
      TypeEventDetectEntity(
        type: json["type"],
        name: json["name"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "shortName": shortName,
  };
}
