import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_object_types_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/object_group/get_objects_by_type_usecase.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';

class ObjectGroupBloc extends Bloc<ObjectGroupEvent, ObjectGroupState> {
  final GetObjectTypesUsecase _getObjectTypesUseCase;
  final GetObjectsByTypeUsecase _getObjectsByTypeUsecase;

  ObjectGroupBloc(this._getObjectTypesUseCase, this._getObjectsByTypeUsecase)
    : super(const ObjectGroupState()) {
    on<LoadObjectGroups>(_onLoadObjectGroups);
    on<SelectObjectType>(_onSelectObjectType);
    on<LoadObjects>(_onLoadObjects);
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
