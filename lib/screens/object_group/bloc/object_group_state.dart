import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';

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
  final List<SubjectGroup> filteredSubjectGroups;
  final TreeNode<SubjectGroup>? filteredSubjectGroupTree;
  final String treeKey;
  final String searchQuery;
  final SubjectGroup? selectedSubjectGroup;

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
    this.filteredSubjectGroups = const [],
    this.filteredSubjectGroupTree,
    this.treeKey = '',
    this.searchQuery = '',
    this.selectedSubjectGroup,
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
    List<SubjectGroup>? filteredSubjectGroups,
    TreeNode<SubjectGroup>? filteredSubjectGroupTree,
    String? treeKey,
    String? searchQuery,
    SubjectGroup? selectedSubjectGroup,
    bool clearSelectedSubjectGroup = false,
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
      filteredSubjectGroups:
          filteredSubjectGroups ?? this.filteredSubjectGroups,
      filteredSubjectGroupTree:
          filteredSubjectGroupTree ?? this.filteredSubjectGroupTree,
      treeKey: treeKey ?? this.treeKey,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedSubjectGroup: clearSelectedSubjectGroup
          ? null
          : (selectedSubjectGroup ?? this.selectedSubjectGroup),
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
    filteredSubjectGroups,
    filteredSubjectGroupTree,
    treeKey,
    searchQuery,
    selectedSubjectGroup,
  ];
}
