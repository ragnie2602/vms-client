import 'dart:convert';

TypeEventDetectEntity typeEventDetectEnityFromJson(String str) =>
    TypeEventDetectEntity.fromJson(json.decode(str));

String typeEventDetectEnityToJson(TypeEventDetectEntity data) => json.encode(data.toJson());

class TypeEventDetectEntity {
  int? type;
  String? name;
  String? typeName;
  String? shortName;

  TypeEventDetectEntity({this.type, this.name, this.typeName, this.shortName});

  TypeEventDetectEntity copyWith({int? type, String? name, String? typeName, String? shortName}) =>
      TypeEventDetectEntity(
        type: type ?? this.type,
        name: name ?? this.name,
        typeName: typeName ?? this.typeName,
        shortName: shortName ?? this.shortName,
      );

  factory TypeEventDetectEntity.fromJson(Map<String, dynamic> json) => TypeEventDetectEntity(
    type: json["type"],
    name: json["name"],
    typeName: json["typeName"],
    shortName: json["shortName"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "typeName": typeName,
    "shortName": shortName,
  };
}
