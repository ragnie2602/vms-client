import 'dart:ui';

class DragItemModel {
  final String id;
  final Offset position;
  final String? cameraId;
  final String? label;
  final String source;
  final List<int>? cameraEmapInfoId; // ID của record camera trên map

  const DragItemModel({
    required this.id,
    required this.position,
    this.cameraId,
    this.label,
    required this.source,
    this.cameraEmapInfoId,
  });

  DragItemModel copyWith({
    String? id,
    Offset? position,
    String? cameraId,
    String? label,
    String? source,
    List<int>? cameraEmapInfoId,
  }) {
    return DragItemModel(
      id: id ?? this.id,
      position: position ?? this.position,
      cameraId: cameraId ?? this.cameraId,
      label: label ?? this.label,
      source: source ?? this.source,
      cameraEmapInfoId: cameraEmapInfoId ?? this.cameraEmapInfoId,
    );
  }
}
