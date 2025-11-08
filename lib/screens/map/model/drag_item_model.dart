import 'dart:ui';

class DragItemModel {
  final String id;
  final Offset position;
  final String? cameraId;
  final String? label;

  const DragItemModel({
    required this.id,
    required this.position,
    this.cameraId,
    this.label,
  });

  DragItemModel copyWith({
    String? id,
    Offset? position,
    String? cameraId,
    String? label,
  }) {
    return DragItemModel(
      id: id ?? this.id,
      position: position ?? this.position,
      cameraId: cameraId ?? this.cameraId,
      label: label ?? this.label,
    );
  }
}
