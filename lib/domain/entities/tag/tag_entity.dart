import 'package:flutter/material.dart';

class TagEntity {
  final List<int> id;
  final String name;
  final Color color;

  TagEntity({required this.id, required this.name, required this.color});

  TagEntity copyWith({List<int>? id, String? name, Color? color}) {
    return TagEntity(id: id ?? this.id, name: name ?? this.name, color: color ?? this.color);
  }
}
