import 'package:flutter/material.dart';

class TagEntity {
  final String id;
  final String name;
  final Color color;
  bool isSelected;

  TagEntity({
    required this.id,
    required this.name,
    required this.color,
    this.isSelected = false,
  });

  TagEntity copyWith({
    String? id,
    String? name,
    Color? color,
    bool? isSelected,
  }) {
    return TagEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
