import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/utils/common_util.dart';

class TagEntity {
  final List<int> id;
  final String name;
  final Color color;
  bool isSelected;

  TagEntity({required this.id, required this.name, required this.color, this.isSelected = false});

  TagEntity copyWith({List<int>? id, String? name, Color? color}) {
    return TagEntity(id: id ?? this.id, name: name ?? this.name, color: color ?? this.color);
  }

  @override
  int get hashCode => Object.hashAll(id);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is TagEntity && id.equals(other.id));
  }

  @override
  String toString() => name;
}
