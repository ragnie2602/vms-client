import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';

class ObjectData extends Equatable {
  final int id;
  final int objectTypeId;
  final Map<String, dynamic> fieldValues;
  final String? thumbnailUrl;
  final String? createdAt;
  final String? updatedAt;
  final List<SubjectGroup> subjectGroups;

  const ObjectData({
    required this.id,
    required this.objectTypeId,
    required this.fieldValues,
    this.thumbnailUrl,
    this.createdAt,
    this.updatedAt,
    this.subjectGroups = const [],
  });

  factory ObjectData.fromJson(Map<String, dynamic> json) {
    return ObjectData(
      id: json['id'] as int? ?? 0,
      objectTypeId: json['objectTypeId'] as int? ?? 0,
      fieldValues: Map<String, dynamic>.from(json['fieldValues'] as Map? ?? {}),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      subjectGroups:
          (json['subjectGroups'] as List<dynamic>?)
              ?.map((e) => SubjectGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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
      'subjectGroups': subjectGroups.map((e) => e.toJson()).toList(),
    };
  }

  ObjectData copyWith({
    int? id,
    int? objectTypeId,
    Map<String, dynamic>? fieldValues,
    String? thumbnailUrl,
    String? createdAt,
    String? updatedAt,
    List<SubjectGroup>? subjectGroups,
  }) {
    return ObjectData(
      id: id ?? this.id,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      fieldValues: fieldValues ?? this.fieldValues,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      subjectGroups: subjectGroups ?? this.subjectGroups,
    );
  }

  @override
  List<Object?> get props => [
    id,
    objectTypeId,
    fieldValues,
    thumbnailUrl,
    createdAt,
    updatedAt,
    subjectGroups,
  ];
}
