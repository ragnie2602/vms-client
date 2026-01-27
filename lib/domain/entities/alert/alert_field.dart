import 'package:flutter/material.dart';

class AlertField {
  final int id;
  final String name;
  final Widget icon;

  const AlertField({required this.id, required this.name, required this.icon});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AlertField && runtimeType == other.runtimeType && id == other.id);
  }

  @override
  int get hashCode => id.hashCode;
}
