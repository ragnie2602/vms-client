import 'dart:convert';

TypeEventDetectEntity typeEventDetectEnityFromJson(String str) =>
    TypeEventDetectEntity.fromJson(json.decode(str));

String typeEventDetectEnityToJson(TypeEventDetectEntity data) => json.encode(data.toJson());

class TypeEventDetectEntity {
  int? type;
  String? typeName; // dùng filter
  String? name;
  String? shortName;

  TypeEventDetectEntity({this.type, this.typeName, this.name, this.shortName});
  TypeEventDetectEntity copyWith({
    int? type,
    String? typeName,
    String? name,
    String? shortName,
  }) => TypeEventDetectEntity(
    type: type ?? this.type,
    typeName: typeName ?? this.typeName,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
  );

  factory TypeEventDetectEntity.fromJson(Map<String, dynamic> json) =>
      TypeEventDetectEntity(
        type: json["type"],
        typeName: json["typeName"],
        name: json["name"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
    "type": type,
    "typeName": typeName,
    "name": name,
    "shortName": shortName,
  };
}
