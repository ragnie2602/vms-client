import 'dart:async';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/check_subject_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_object_types_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_objects_by_type_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/search_subject_group_usecase.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';

class ObjectGroupBloc extends BaseBloc<ObjectGroupEvent, ObjectGroupState> {
  final GetObjectTypesUsecase _getObjectTypesUseCase;
  final GetObjectsByTypeUsecase _getObjectsByTypeUsecase;
  final IObjectGroupRepository objectGroupRepository;
  final SearchSubjectGroupUsecase _searchSubjectGroupUsecase;
  final CheckSubjectGroupUsecase _checkSubjectGroupUsecase;

  ObjectGroupBloc(
    this._getObjectTypesUseCase,
    this._getObjectsByTypeUsecase,
    this.objectGroupRepository,
    this._searchSubjectGroupUsecase,
    this._checkSubjectGroupUsecase,
  ) : super(const ObjectGroupState()) {
    // lấy list danh sách các object type để hiển thị tab bên trái
    on<LoadObjectTypes>(_onLoadObjectTypes);
    // case object type tab phân trang
    on<ChangeObjectTypesPage>(_onChangeObjectTypesPage);
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
    on<CheckSubjectGroupForDelete>(_onCheckSubjectGroupForDelete);
    on<ResetObjectGroupState>((event, emit) => emit(const ObjectGroupState()));
  }

  Future<void> _onSelectSubjectGroup(
    SelectSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    // select group = null -> auto select node đầu
    emit(
      state.copyWith(
        selectedSubjectGroup:
            event.subjectGroup ??
            SubjectGroup(id: 0, name: 'Danh sách đối tượng', parentId: 0),
      ),
    );
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
      final totalPages = result.data['totalPages'] as int? ?? 1;
      final rawObjectTypes = result.data['data'] as List<dynamic>;
      final objectTypes = rawObjectTypes
          .cast<ObjectType>()
          .where((e) => e.status == ObjectTypeStatus.active)
          .toList();

      if (objectTypes.isNotEmpty) {
        emit(
          state.copyWith(
            status: ObjectGroupStatus.loaded,
            objectTypes: List.from(objectTypes),
            selectedObjectType: objectTypes.first,
            objectTypesPage: event.page,
            objectTypesTotalPages: totalPages,
          ),
        );
        add(SelectObjectType(objectTypes.first));
      } else {
        emit(
          state.copyWith(
            status: ObjectGroupStatus.loaded,
            objectTypes: [],
            selectedObjectType: null,
            objectTypesPage: event.page,
            objectTypesTotalPages: totalPages,
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

  Future<void> _onChangeObjectTypesPage(
    ChangeObjectTypesPage event,
    Emitter<ObjectGroupState> emit,
  ) async {
    add(LoadObjectTypes(page: event.page));
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
    emit(
      state.copyWith(status: ObjectGroupStatus.loading, isTreeLoading: true),
    );
    final result = await objectGroupRepository.getSubjectGroups();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: failure.toString(),
            status: ObjectGroupStatus.error,
            isTreeLoading: false,
          ),
        );
      },
      (groups) {
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
            status: ObjectGroupStatus.loaded,
            isTreeLoading: false,
          ),
        );
      },
    );
  }

  FutureOr<void> _onCreateSubjectGroup(
    CreateSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    final currentState = state;
    final result = await objectGroupRepository.createSubjectGroup(
      name: event.name,
      parentId: event.parentId,
    );
    result.fold(
      (failure) {
        event.completer?.complete();
        emit(
          currentState.copyWith(
            errorMessage: failure.toString(),
            status: ObjectGroupStatus.createGroupFailure,
          ),
        );
      },
      (success) {
        event.completer?.complete();
        emit(
          currentState.copyWith(status: ObjectGroupStatus.createGroupSuccess),
        );
        add(const LoadSubjectGroups());
      },
    );
  }

  FutureOr<void> _onUpdateSubjectGroup(
    UpdateSubjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    final currentState = state;
    final result = await objectGroupRepository.editObjectGroup(
      objectGroupId: event.id,
      request: event.subjectGroup!,
    );
    result.fold(
      (failure) {
        event.completer?.complete();
        emit(
          currentState.copyWith(
            errorMessage: failure.toString(),
            status: ObjectGroupStatus.updateGroupFailure,
          ),
        );
      },
      (success) {
        event.completer?.complete();
        emit(
          currentState.copyWith(status: ObjectGroupStatus.updateGroupSuccess),
        );
        add(const LoadSubjectGroups());
      },
    );
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
    final result = await objectGroupRepository.deleteSubjectGroup(
      objectGroupId: event.id,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: failure.toString(),
            status: ObjectGroupStatus.deleteGroupFailure,
          ),
        );
      },
      (success) {
        emit(state.copyWith(status: ObjectGroupStatus.deleteGroupSuccess));
        add(const SelectSubjectGroup(null));
        add(const LoadSubjectGroups());
      },
    );
  }

  Future<void> _onCheckSubjectGroupForDelete(
    CheckSubjectGroupForDelete event,
    Emitter<ObjectGroupState> emit,
  ) async {
    emit(state.copyWith(status: ObjectGroupStatus.loading));
    try {
      final input = CheckSubjectGroupInput(id: event.subjectGroup.id ?? 0);
      final result = await _checkSubjectGroupUsecase.execute(input);
      result.data.fold(
        (failure) {
          emit(
            state.copyWith(
              errorMessage: failure.parseMessage(),
              status: ObjectGroupStatus.error,
            ),
          );
        },
        (data) {
          emit(
            state.copyWith(
              status: ObjectGroupStatus.checkGroupForDeleteSuccess,
              checkSubjectGroupModel: data,
            ),
          );
        },
      );
    } catch (e) {
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
