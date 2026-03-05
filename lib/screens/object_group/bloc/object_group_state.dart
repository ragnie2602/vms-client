import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

enum ObjectGroupStatus { initial, loading, loaded, error }

class ObjectGroupState extends Equatable {
  final ObjectGroupStatus status;
  final List<ObjectType> objectTypes;
  final ObjectType? selectedObjectType;
  final List<ObjectData> objects;
  final int currentObjectsPage;
  final int totalObjects;
  final String? errorMessage;
  final int totalPages;
  final List<SubjectGroup> subjectGroups;
  final TreeNode<SubjectGroup>? subjectGroupTree;
  final String treeKey;
  final int selectedSubjectGroupId;

  const ObjectGroupState({
    this.status = ObjectGroupStatus.initial,
    this.objectTypes = const [],
    this.selectedObjectType,
    this.objects = const [],
    this.currentObjectsPage = 1,
    this.totalObjects = 0,
    this.errorMessage,
    this.totalPages = 1,
    this.subjectGroups = const [],
    this.subjectGroupTree,
    this.treeKey = '',
    this.selectedSubjectGroupId = 0,
  });

  ObjectGroupState copyWith({
    ObjectGroupStatus? status,
    List<ObjectType>? objectTypes,
    ObjectType? selectedObjectType,
    List<ObjectData>? objects,
    int? currentObjectsPage,
    int? totalObjects,
    String? errorMessage,
    int? totalPages,
    List<SubjectGroup>? subjectGroups,
    TreeNode<SubjectGroup>? subjectGroupTree,
    String? treeKey,
    int? selectedSubjectGroupId,
  }) {
    return ObjectGroupState(
      status: status ?? this.status,
      objectTypes: objectTypes ?? this.objectTypes,
      selectedObjectType: selectedObjectType ?? this.selectedObjectType,
      objects: objects ?? this.objects,
      currentObjectsPage: currentObjectsPage ?? this.currentObjectsPage,
      totalObjects: totalObjects ?? this.totalObjects,
      errorMessage: errorMessage ?? this.errorMessage,
      totalPages: totalPages ?? this.totalPages,
      subjectGroups: subjectGroups ?? this.subjectGroups,
      subjectGroupTree: subjectGroupTree ?? this.subjectGroupTree,
      treeKey: treeKey ?? this.treeKey,
      selectedSubjectGroupId:
          selectedSubjectGroupId ?? this.selectedSubjectGroupId,
    );
  }

  @override
  List<Object?> get props => [
    status,
    objectTypes,
    selectedObjectType,
    objects,
    currentObjectsPage,
    totalObjects,
    errorMessage,
    totalPages,
    subjectGroups,
    subjectGroupTree,
    treeKey,
    selectedSubjectGroupId,
  ];
}
