import 'dart:ui';

class DragItemModel {
  final String id;
  final Offset position;
  final String? cameraId;
  final String? label;
  final List<int>? cameraEmapInfoId; // ID của record camera trên map

  const DragItemModel({
    required this.id,
    required this.position,
    this.cameraId,
    this.label,
    this.cameraEmapInfoId,
  });

  DragItemModel copyWith({
    String? id,
    Offset? position,
    String? cameraId,
    String? label,
    List<int>? cameraEmapInfoId,
  }) {
    return DragItemModel(
      id: id ?? this.id,
      position: position ?? this.position,
      cameraId: cameraId ?? this.cameraId,
      label: label ?? this.label,
      cameraEmapInfoId: cameraEmapInfoId ?? this.cameraEmapInfoId,
    );
  }
}
