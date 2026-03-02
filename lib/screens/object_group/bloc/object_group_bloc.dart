import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_object_types_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_objects_by_type_usecase.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/group_object_tree_widget.dart';

class ObjectGroupBloc extends Bloc<ObjectGroupEvent, ObjectGroupState> {
  final GetObjectTypesUsecase _getObjectTypesUseCase;
  final GetObjectsByTypeUsecase _getObjectsByTypeUsecase;

  ObjectGroupBloc(this._getObjectTypesUseCase, this._getObjectsByTypeUsecase)
    : super(const ObjectGroupState()) {
    // init data: load tab kiểu đối tượng (object type) + load list grroup đối tượng
    on<InitializeObjectGroup>(_onInitData);
    // load tab kiểu đối tượng (object type)
    on<LoadObjectGroups>(_onLoadObjectGroups);
    // thay đổi tab kiểu đối tượng => load lại dữ liệu đối tượng
    on<SelectObjectType>(_onSelectObjectType);
    on<LoadObjects>(_onLoadObjects);
  }
  Future<void> _onInitData(
    InitializeObjectGroup event,
    Emitter<ObjectGroupState> emit,
  ) async {
    // Clear listGroup để tree widget reset trước khi load dữ liệu mới
    emit(state.copyWith(status: ObjectGroupStatus.loading, listGroup: []));
    try {
      // 1. Load object types
      final input = GetObjectTypesInput(page: event.page, size: event.size);
      final result = await _getObjectTypesUseCase.execute(input);
      final objectTypes = result.data['data'] as List<dynamic>;

      // 2. Load mock object groups
      final mockGroups = _getMockObjectGroups();

      if (objectTypes.isNotEmpty) {
        emit(
          state.copyWith(
            status: ObjectGroupStatus.loaded,
            objectTypes: List.from(objectTypes),
            selectedObjectType: objectTypes.first,
            listGroup: mockGroups,
          ),
        );
        add(SelectObjectType(objectTypes.first));
      } else {
        emit(
          state.copyWith(
            status: ObjectGroupStatus.loaded,
            objectTypes: [],
            selectedObjectType: null,
            listGroup: mockGroups,
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

  /// Mock data cho nhóm đối tượng (sẽ thay bằng API sau)
  List<MockObject> _getMockObjectGroups() {
    return [
      MockObject(name: "Danh sách đối tượng", id: "1"),
      MockObject(name: "Khối THCS", id: "2"),
      MockObject(
        name: "Khối THPT",
        id: "3",
        children: [
          MockObject(
            name: "Khối 1",
            id: "3_1",
            children: [
              MockObject(
                name: "Các lớp 1A",
                id: "3_1_1",
                children: [
                  MockObject(name: "Lớp 1A1", id: "3_1_1_1"),
                  MockObject(name: "Lớp 1A2", id: "3_1_1_2"),
                  MockObject(name: "Lớp 1A3", id: "3_1_1_3"),
                  MockObject(name: "Lớp 1A4", id: "3_1_1_4"),
                  MockObject(name: "Lớp 1A5", id: "3_1_1_5"),
                ],
              ),
              MockObject(name: "Các lớp 1B", id: "3_1_2"),
              MockObject(name: "Các lớp 1C", id: "3_1_3"),
              MockObject(name: "Các lớp 1D", id: "3_1_4"),
              MockObject(name: "Các lớp 1E", id: "3_1_5"),
            ],
          ),
          MockObject(name: "Khối 2", id: "3_2"),
          MockObject(name: "Khối 3", id: "3_3"),
        ],
      ),
    ];
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
}
