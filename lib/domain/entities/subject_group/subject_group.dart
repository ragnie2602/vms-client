import 'package:equatable/equatable.dart';

class SubjectGroup extends Equatable {
  final int? id;
  final String? name;
  final int? parentId;
  final String? createdAt;
  final String? updatedAt;

  const SubjectGroup({
    this.id,
    this.name,
    this.parentId,
    this.createdAt,
    this.updatedAt,
  });

  factory SubjectGroup.fromJson(Map<String, dynamic> json) {
    return SubjectGroup(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      parentId: json['parentId'] as int? ?? 0,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [id, name, parentId, createdAt, updatedAt];
}
