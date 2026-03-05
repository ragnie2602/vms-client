import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/core/app_config.dart';

class SubjectGroup extends Equatable {
  final int? id;
  final String? name;
  final int? parentId;
  final int? level;
  final String? createdAt;
  final String? updatedAt;

  const SubjectGroup({
    this.id,
    this.name,
    this.parentId,
    this.level,
    this.createdAt,
    this.updatedAt,
  });

  factory SubjectGroup.fromJson(Map<String, dynamic> json) {
    return SubjectGroup(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      parentId: json['parentId'] as int? ?? 0,
      level: json['level'] as int? ?? 0,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'level': level,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [id, name, parentId, level, createdAt, updatedAt];
}

extension TreeObjectGroupExtension on TreeNode<SubjectGroup> {
  List<SubjectGroup> convertTreeToListOneLevel({
    int hideFromLevel = AppConfig.OBJECT_GROUP_MAX_LEVEL,
  }) {
    List<SubjectGroup> listGroupOneLevel = [];
    if (isRoot) {
      for (var child in childrenAsList) {
        listGroupOneLevel.addAll(
          (child as TreeNode<SubjectGroup>).convertTreeToListOneLevel(
            hideFromLevel: hideFromLevel,
          ),
        );
      }
      return listGroupOneLevel;
    }
    if (level < hideFromLevel) {
      if (data != null) {
        listGroupOneLevel.add(data!);
      }
      for (var child in childrenAsList) {
        listGroupOneLevel.addAll(
          (child as TreeNode<SubjectGroup>).convertTreeToListOneLevel(
            hideFromLevel: hideFromLevel,
          ),
        );
      }
    }
    return listGroupOneLevel;
  }
}
