import 'package:equatable/equatable.dart';

class ObjectData extends Equatable {
  final int id;
  final int objectTypeId;
  final Map<String, dynamic> fieldValues;
  final String? thumbnailUrl;
  final String? createdAt;
  final String? updatedAt;

  const ObjectData({
    required this.id,
    required this.objectTypeId,
    required this.fieldValues,
    this.thumbnailUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory ObjectData.fromJson(Map<String, dynamic> json) {
    return ObjectData(
      id: json['id'] as int? ?? 0,
      objectTypeId: json['objectTypeId'] as int? ?? 0,
      fieldValues: Map<String, dynamic>.from(json['fieldValues'] as Map? ?? {}),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'objectTypeId': objectTypeId,
      'fieldValues': fieldValues,
      'thumbnailUrl': thumbnailUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  ObjectData copyWith({
    int? id,
    int? objectTypeId,
    Map<String, dynamic>? fieldValues,
    String? thumbnailUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    return ObjectData(
      id: id ?? this.id,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      fieldValues: fieldValues ?? this.fieldValues,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, objectTypeId, fieldValues, thumbnailUrl, createdAt, updatedAt];
}
