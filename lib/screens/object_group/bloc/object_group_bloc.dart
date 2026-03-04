import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/create_subject_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_object_types_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_objects_by_type_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_subject_groups_usecase.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/group_object_tree_widget.dart';

class ObjectGroupBloc extends Bloc<ObjectGroupEvent, ObjectGroupState> {
  final GetObjectTypesUsecase _getObjectTypesUseCase;
  final GetObjectsByTypeUsecase _getObjectsByTypeUsecase;
  final GetSubjectGroupsUsecase _getSubjectGroupsUsecase;
  final CreateSubjectGroupUsecase _createSubjectGroupUsecase;

  ObjectGroupBloc(
    this._getObjectTypesUseCase,
    this._getObjectsByTypeUsecase,
    this._getSubjectGroupsUsecase,
    this._createSubjectGroupUsecase,
  ) : super(const ObjectGroupState()) {
    on<LoadObjectGroups>(_onLoadObjectGroups);
    on<SelectObjectType>(_onSelectObjectType);
    on<LoadObjects>(_onLoadObjects);
    on<LoadSubjectGroups>(_onLoadSubjectGroups);
    on<CreateSubjectGroup>(_onCreateSubjectGroup);
  }

  Future<void> _onLoadObjectGroups(
    LoadObjectGroups event,
    Emitter<ObjectGroupState> emit,
  ) async {
    emit(state.copyWith(status: ObjectGroupStatus.loading));
    try {
      final input = GetObjectTypesInput(page: event.page, size: event.size);
      final result = await _getObjectTypesUseCase.execute(input);
      final objectTypes = result.data['data'] as List<dynamic>;

      if (objectTypes.isNotEmpty) {
        emit(
          state.copyWith(
            status: ObjectGroupStatus.loaded,
            objectTypes: List.from(objectTypes),
            selectedObjectType: objectTypes.first,
          ),
        );
        add(SelectObjectType(objectTypes.first));
      } else {
        emit(
          state.copyWith(
            status: ObjectGroupStatus.loaded,
            objectTypes: [],
            selectedObjectType: null,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ObjectGroupStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSelectObjectType(
    SelectObjectType event,
    Emitter<ObjectGroupState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedObjectType: event.objectType,
        objects: [], // Clear objects when switching tabs
        currentObjectsPage: 1,
      ),
    );
    add(
      LoadObjects(
        objectTypeId: event.objectType.id,
        page: event.page,
        size: event.size,
      ),
    );
  }

  Future<void> _onLoadObjects(
    LoadObjects event,
    Emitter<ObjectGroupState> emit,
  ) async {
    emit(state.copyWith(status: ObjectGroupStatus.loading));
    try {
      final input = GetObjectsByTypeInput(
        objectTypeId: event.objectTypeId,
        page: event.page,
        size: event.size,
        search: event.search,
      );
      final result = await _getObjectsByTypeUsecase.execute(input);

      emit(
        state.copyWith(
          status: ObjectGroupStatus.loaded,
          objects: List.from(result.data['data']),
          totalObjects: result.data['totalElements'] ?? 0,
          currentObjectsPage: event.page,
          totalPages: result.data['totalPages'] ?? 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ObjectGroupStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadSubjectGroups(
    LoadSubjectGroups event,
    Emitter<ObjectGroupState> emit,
  ) async {
    try {
      final input = GetSubjectGroupsInput();
      final result = await _getSubjectGroupsUsecase.execute(input);
      final groups = result.data;

      // Build tree from flat list
      final tree = _buildTreeFromFlatList(groups);

      emit(state.copyWith(subjectGroups: groups, subjectGroupTree: tree));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onCreateSubjectGroup(
    CreateSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    try {
      final input = CreateSubjectGroupInput(
        name: event.name,
        parentId: event.parentId,
      );
      await _createSubjectGroupUsecase.execute(input);

      // Reload subject groups to refresh the tree
      add(const LoadSubjectGroups());
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// Convert flat list of SubjectGroup to TreeNode<MockObject> hierarchy.
  ///
  /// Rules:
  /// - parentId == 0 → root node
  /// - parentId != 0 → child of the node with matching id
  TreeNode<MockObject> _buildTreeFromFlatList(List<SubjectGroup> groups) {
    final root = TreeNode<MockObject>.root(
      data: MockObject(name: "Root", id: "0"),
    );

    // Create a map of id -> TreeNode for quick lookup
    final Map<int, TreeNode<MockObject>> nodeMap = {};

    // First pass: create all TreeNode objects
    for (final group in groups) {
      final node = TreeNode<MockObject>(
        key: group.id.toString(),
        data: MockObject(name: group.name, id: group.id.toString()),
      );
      nodeMap[group.id] = node;
    }

    // Second pass: build parent-child relationships
    for (final group in groups) {
      final node = nodeMap[group.id]!;
      if (group.parentId == 0) {
        // Root-level node
        root.add(node);
      } else {
        // Child node - attach to parent
        final parentNode = nodeMap[group.parentId];
        if (parentNode != null) {
          parentNode.add(node);
        } else {
          // Parent not found, add to root as fallback
          root.add(node);
        }
      }
    }

    return root;
  }
}
