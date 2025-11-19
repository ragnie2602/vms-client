import 'package:flutter/material.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class TagEntity {
  final String id;
  final String name;
  final Color color;

  TagEntity({required this.id, required this.name, required this.color});

  TagEntity.fromResponse(CamTag tag)
    : id = tag.tagId.toString(),
      name = tag.tagName,
      color = Color(int.parse(tag.tagColor));

  TagEntity copyWith({String? id, String? name, Color? color}) {
    return TagEntity(id: id ?? this.id, name: name ?? this.name, color: color ?? this.color);
  }
}
