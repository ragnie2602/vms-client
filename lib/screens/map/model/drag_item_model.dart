import 'dart:ui';

class DragItemModel {
  final String id;
  final Offset position;
  final String? cameraId;
  final String? label;
  final String source;

  const DragItemModel({
    required this.id,
    required this.position,
    this.cameraId,
    this.label,
    required this.source,
  });

  DragItemModel copyWith({
    String? id,
    Offset? position,
    String? cameraId,
    String? label,
    String? source,
  }) {
    return DragItemModel(
      id: id ?? this.id,
      position: position ?? this.position,
      cameraId: cameraId ?? this.cameraId,
      label: label ?? this.label,
      source: source ?? this.source,
    );
  }
}
