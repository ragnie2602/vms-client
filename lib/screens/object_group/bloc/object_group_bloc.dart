import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/create_subject_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/delete_subject_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_object_types_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_objects_by_type_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_subject_groups_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/search_subject_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/update_subject_group_usecase.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';

class ObjectGroupBloc extends BaseBloc<ObjectGroupEvent, ObjectGroupState> {
  final GetObjectTypesUsecase _getObjectTypesUseCase;
  final GetObjectsByTypeUsecase _getObjectsByTypeUsecase;
  final GetSubjectGroupsUsecase _getSubjectGroupsUsecase;
  final CreateSubjectGroupUsecase _createSubjectGroupUsecase;
  final UpdateSubjectGroupUsecase _updateSubjectGroupUsecase;
  final DeleteSubjectGroupUsecase _deleteSubjectGroupUsecase;
  final SearchSubjectGroupUsecase _searchSubjectGroupUsecase;

  ObjectGroupBloc(
    this._getObjectTypesUseCase,
    this._getObjectsByTypeUsecase,
    this._getSubjectGroupsUsecase,
    this._createSubjectGroupUsecase,
    this._updateSubjectGroupUsecase,
    this._deleteSubjectGroupUsecase,
    this._searchSubjectGroupUsecase,
  ) : super(const ObjectGroupState()) {
    // lấy list danh sách các object type để hiển thị tab bên trái
    on<LoadObjectTypes>(_onLoadObjectTypes);
    // thay đổi tab kiểu đối tượng => load lại dữ liệu đối tượng
    on<SelectObjectType>(_onSelectObjectType);
    on<LoadObjects>(_onLoadObjects);
    // load cây nhóm đối tượng
    on<LoadSubjectGroups>(_onLoadSubjectGroups);
    on<CreateSubjectGroup>(_onCreateSubjectGroup);
    on<UpdateSubjectGroup>(_onUpdateSubjectGroup);
    on<DeleteSubjectGroup>(_onDeleteSubjectGroup);
    on<SelectSubjectGroup>(_onSelectSubjectGroup);
    on<SearchSubjectGroup>(_onSearchSubjectGroup);
    on<ResetObjectGroupState>((event, emit) => emit(const ObjectGroupState()));
  }

  Future<void> _onSelectSubjectGroup(
    SelectSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    emit(state.copyWith(selectedSubjectGroup: event.subjectGroup));
    final selectedType = state.selectedObjectType;
    if (selectedType == null) return;
    add(
      LoadObjects(
        objectTypeId: selectedType.id,
        subjectGroupId: event.subjectGroup?.id ?? 0,
      ),
    );
  }

  Future<void> _onLoadObjectTypes(
    LoadObjectTypes event,
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
        subjectGroupId: state.selectedSubjectGroup?.id ?? 0,
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
        subjectGroupId: event.subjectGroupId,
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

      emit(
        state.copyWith(
          subjectGroups: groups,
          subjectGroupTree: tree,
          filteredSubjectGroups: groups,
          filteredSubjectGroupTree: tree,
          treeKey: DateTime.now().millisecondsSinceEpoch.toString(),
          searchQuery: '',
          selectedSubjectGroup:
              state.selectedSubjectGroup ??
              SubjectGroup(id: 0, name: 'Danh sách đối tượng', parentId: 0),
        ),
      );
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
      event.onSuccess?.call();
    } catch (e) {
      event.onError?.call(e.toString());
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ObjectGroupStatus.error,
        ),
      );
    }
  }

  Future<void> _onUpdateSubjectGroup(
    UpdateSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    try {
      final input = UpdateSubjectGroupInput(
        id: event.id,
        request: event.subjectGroup!,
      );
      await _updateSubjectGroupUsecase.execute(input);
      add(const LoadSubjectGroups());
      event.onSuccess?.call();
    } catch (e) {
      event.onError?.call(e.toString());
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ObjectGroupStatus.error,
        ),
      );
    }
  }

  /// Convert flat list of SubjectGroup to TreeNode<SubjectGroup> hierarchy.
  ///
  /// Rules:
  /// - parentId == 0 → root node
  /// - parentId != 0 → child of the node with matching id
  TreeNode<SubjectGroup> _buildTreeFromFlatList(List<SubjectGroup> groups) {
    final root = TreeNode<SubjectGroup>.root();

    // Thêm node "Danh sách đối tượng" luôn ở đầu cây
    root.add(
      TreeNode<SubjectGroup>(
        key: 'all_node',
        data: SubjectGroup(id: 0, name: 'Danh sách đối tượng', parentId: 0),
      ),
    );

    // Create a map of id -> TreeNode for quick lookup
    final Map<int?, TreeNode<SubjectGroup>> nodeMap = {};

    // First pass: create all TreeNode objects
    for (final group in groups) {
      final node = TreeNode<SubjectGroup>(
        key: group.id.toString(),
        data: group,
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

  Future<void> _onDeleteSubjectGroup(
    DeleteSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    emit(state.copyWith(status: ObjectGroupStatus.loading));
    try {
      final input = DeleteSubjectGroupInput(id: event.id);
      await _deleteSubjectGroupUsecase.execute(input);
      add(const SelectSubjectGroup(null));
      add(const LoadSubjectGroups());
      event.onSuccess?.call();
    } catch (e) {
      event.onError?.call(e.toString());
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ObjectGroupStatus.error,
        ),
      );
    }
  }

  // void _onSelectSubjectGroup(
  //   SelectSubjectGroup event,
  //   Emitter<ObjectGroupState> emit,
  // ) {
  //   emit(
  //     state.copyWith(
  //       selectedSubjectGroup: event.subjectGroup,
  //       clearSelectedSubjectGroup: event.subjectGroup == null,
  //       currentObjectsPage: 1,
  //       objects: [],
  //     ),
  //   );
  //   if (state.selectedObjectType != null) {
  //     add(
  //       LoadObjects(
  //         objectTypeId: state.selectedObjectType!.id,
  //         page: 1,
  //         subjectGroupId: event.subjectGroup?.id ?? 0,
  //         size: 20,
  //       ),
  //     );
  //   }
  // }

  void _onSearchSubjectGroup(
    SearchSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) {
    final output = _searchSubjectGroupUsecase.buildUseCase(
      SearchSubjectGroupInput(
        allGroups: state.subjectGroups,
        query: event.query,
      ),
    );

    final filteredTree = _buildTreeFromFlatList(output.filteredGroups);

    emit(
      state.copyWith(
        filteredSubjectGroups: output.filteredGroups,
        filteredSubjectGroupTree: filteredTree,
        searchQuery: event.query,
        treeKey: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
    );
  }
}
