import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/event_constants.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/event/fetch_config_table_usecase.dart';

part 'setup_info_field_event.dart';
part 'setup_info_field_state.dart';

class SetupInfoFieldBloc extends Bloc<SetupInfoFieldEvent, SetupInfoFieldState> {
  final IDetectRepository _detectRepository;
  final IEventRepository _eventRepository;

  final FetchConfigTableUsecase _fetchConfigTableUsecase;

  final Map<String, List<FieldConfigEntity>> configTable = {};

  SetupInfoFieldBloc(this._detectRepository, this._eventRepository, this._fetchConfigTableUsecase)
    : super(const SetupInfoFieldState()) {
    on<SetupInfoFieldInit>(_onInit);
    on<SetupInfoFieldSelectType>(_onSelectType);
    on<SetupInfoFieldAddField>(_onAddField);
    on<SetupInfoFieldRemoveField>(_onRemoveField);
    on<SetupInfoFieldReorder>(_onReorder);
    on<SetupInfoFieldSave>(_onSave);
  }

  Future<void> _onInit(SetupInfoFieldInit event, Emitter<SetupInfoFieldState> emit) async {
    emit(state.copyWith(status: SetupInfoFieldStatus.loading));

    final result = await _detectRepository.getListFieldAvailable();

    result.fold(
      (failure) => emit(
        state.copyWith(status: SetupInfoFieldStatus.failure, errorMessage: failure.toString()),
      ),
      (availableFields) {
        emit(
          state.copyWith(
            status: SetupInfoFieldStatus.success,
            availableFields: availableFields,
            typeEvents: event.typeEvents,
          ),
        );

        // mở dialog -> auto mở cấu hình của kiểu sự kiện đầu tiên
        if (event.typeEvents != null && event.typeEvents!.isNotEmpty) {
          add(SetupInfoFieldSelectType(event.typeConfig, event.typeEvents!.first));
        }
      },
    );

    if (event.typeEvents != null && event.typeEvents!.isNotEmpty) {
      emit(state.copyWith(configTableStatus: ConfigTableStatus.loading));

      try {
        final input = FetchConfigTableInput(
          event.typeEvents?.map((e) => e.typeName ?? '').toList() ?? [],
        );
        final output = await _fetchConfigTableUsecase.execute(input);
        configTable.addAll(output.configTable);

        // Emit state khi load configTable thành công
        emit(state.copyWith(configTableStatus: ConfigTableStatus.success));
      } catch (error) {
        // Emit state khi load configTable thất bại
        emit(
          state.copyWith(
            configTableStatus: ConfigTableStatus.failure,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }

  // change kiểu sự kiện -> load lại config mới
  Future<void> _onSelectType(
    SetupInfoFieldSelectType event,
    Emitter<SetupInfoFieldState> emit,
  ) async {
    //lưu lại config hiện tại vào modifiedConfigs trước khi chuyển sang eventType mới
    if (state.selectedType != null && state.selectedType!.typeName != null) {
      final updatedModifiedConfigs = Map<String, List<FieldConfigEntity>>.from(
        state.modifiedConfigs,
      );
      updatedModifiedConfigs[state.selectedType!.typeName!] = state.currentFields;

      emit(
        state.copyWith(
          selectedType: event.type,
          configStatus: SetupInfoFieldConfigStatus.loading,
          modifiedConfigs: updatedModifiedConfigs,
        ),
      );
    } else {
      emit(
        state.copyWith(selectedType: event.type, configStatus: SetupInfoFieldConfigStatus.loading),
      );
    }

    if (event.type.typeName == null) {
      return;
    }

    // check trong list cấu hình(sau khi update) đang lưu đã có kiểu này chưa
    if (state.modifiedConfigs.containsKey(event.type.typeName)) {
      emit(
        state.copyWith(
          configStatus: SetupInfoFieldConfigStatus.success,
          currentFields: state.modifiedConfigs[event.type.typeName]!,
        ),
      );
      return;
    }

    // check trong list cấu hình(nguyên bản lúc mới init) đang lưu đã có kiểu này chưa
    if (state.originalConfigs.containsKey(event.type.typeName)) {
      emit(
        state.copyWith(
          configStatus: SetupInfoFieldConfigStatus.success,
          currentFields: state.originalConfigs[event.type.typeName]!,
        ),
      );
      return;
    }
    Either<Failure, EventDisplayConfigEntity> result;
    if (event.typeConfig == EventTypeConfig.LIVEVIEW) {
      result = await _detectRepository.getEventDisplayConfig(eventTypeName: event.type.typeName!);
    } else {
      result = await _eventRepository.getEventDisplayConfig(event.type.typeName!);
    }

    result.fold(
      (failure) => emit(
        state.copyWith(
          configStatus: SetupInfoFieldConfigStatus.failure,
          errorMessage: failure.toString(),
        ),
      ),
      (config) {
        // Lấy danh sách field codes hiện tại từ config
        final currentFieldCodes = (config.fields ?? [])
            .map((f) => f.code)
            .where((code) => code != null)
            .cast<String>()
            .toList();
        // thay đổi thứ tự field đang có theo config mới trả về
        final orderedFields = <FieldConfigEntity>[];
        for (var code in currentFieldCodes) {
          final field = state.availableFields.cast<FieldConfigEntity?>().firstWhere(
            (f) => f?.code == code,
            orElse: () => null,
          );
          // nếu chưa có trong available thì không thêm vào
          if (field != null) orderedFields.add(field);
        }

        configTable[config.eventTypeName ?? ''] = orderedFields;

        // lưu lại vào originalConfigs
        final updatedOriginalConfigs = Map<String, List<FieldConfigEntity>>.from(
          state.originalConfigs,
        );
        updatedOriginalConfigs[event.type.typeName!] = orderedFields;

        emit(
          state.copyWith(
            configStatus: SetupInfoFieldConfigStatus.success,
            currentFields: orderedFields,
            originalConfigs: updatedOriginalConfigs,
          ),
        );
      },
    );
  }

  void _onAddField(SetupInfoFieldAddField event, Emitter<SetupInfoFieldState> emit) {
    final updatedFields = List<FieldConfigEntity>.from(state.currentFields)..add(event.field);
    emit(state.copyWith(currentFields: updatedFields));
  }

  void _onRemoveField(SetupInfoFieldRemoveField event, Emitter<SetupInfoFieldState> emit) {
    final updatedFields = List<FieldConfigEntity>.from(state.currentFields)..remove(event.field);
    emit(state.copyWith(currentFields: updatedFields));
  }

  void _onReorder(SetupInfoFieldReorder event, Emitter<SetupInfoFieldState> emit) {
    final updatedFields = List<FieldConfigEntity>.from(state.currentFields);
    final item = updatedFields.removeAt(event.oldIndex);
    updatedFields.insert(event.newIndex, item);
    emit(state.copyWith(currentFields: updatedFields));
  }

  Future<void> _onSave(SetupInfoFieldSave event, Emitter<SetupInfoFieldState> emit) async {
    emit(state.copyWith(saveStatus: SetupInfoFieldStatus.loading));

    // lưu thay đổi hiện tại vào modifiedConfigs
    final updatedModifiedConfigs = Map<String, List<FieldConfigEntity>>.from(state.modifiedConfigs);
    if (state.selectedType?.typeName != null) {
      updatedModifiedConfigs[state.selectedType!.typeName!] = state.currentFields;
    }

    // tìm các eventtype bị thay đổi (so sánh với original)
    final typesToUpdate = <String>[];
    for (final entry in updatedModifiedConfigs.entries) {
      final typeName = entry.key;
      final modifiedFields = entry.value;
      final originalFields = state.originalConfigs[typeName] ?? [];

      //check các trường có bị thay đổi không
      if (!_areFieldListsEqual(originalFields, modifiedFields)) {
        typesToUpdate.add(typeName);
      }
    }

    // ko thahy đổi gì -> không phải gọi API update
    if (typesToUpdate.isEmpty) {
      emit(
        state.copyWith(
          saveStatus: SetupInfoFieldStatus.success,
          modifiedConfigs: updatedModifiedConfigs,
        ),
      );
      return;
    }

    // gọi các API để lưu các thay đổi
    final futures = <Future<Either<Failure, EventDisplayConfigEntity>>>[];
    for (final typeName in typesToUpdate) {
      final listField = updatedModifiedConfigs[typeName]!
          .map((e) => e.code)
          .where((e) => e != null)
          .cast<String>()
          .toList();

      if (event.typeConfig == EventTypeConfig.LIVEVIEW) {
        futures.add(
          _detectRepository.updateEventDisplayConfig(listField: listField, eventTypeName: typeName),
        );
      } else {
        futures.add(
          _eventRepository.updateEventDisplayConfig(listField: listField, eventType: typeName),
        );
      }
    }

    // chờ tất cả hoàn thành
    final results = await Future.wait(futures);

    //dùng để get lỗi nếu có
    String? errorMessage;
    for (final result in results) {
      result.fold(
        (failure) {
          errorMessage ??= failure.toString();
        },
        (_) {}, // thành công thì bỏ qua
      );
    }

    if (errorMessage != null) {
      emit(
        state.copyWith(
          saveStatus: SetupInfoFieldStatus.failure,
          saveErrorMessage: errorMessage,
          modifiedConfigs: updatedModifiedConfigs,
        ),
      );
      return;
    }

    //update dữ liệu local sau khi lưu thành công
    final updatedOriginalConfigs = Map<String, List<FieldConfigEntity>>.from(state.originalConfigs);
    for (final typeName in typesToUpdate) {
      final fields = updatedModifiedConfigs[typeName]!;
      updatedOriginalConfigs[typeName] = fields;
      configTable[typeName] = fields;
    }

    emit(
      state.copyWith(
        saveStatus: SetupInfoFieldStatus.success,
        originalConfigs: updatedOriginalConfigs,
        modifiedConfigs: {}, // clear data sau khi lưu thành công
      ),
    );
  }

  // so sánh sự thay đổi của 2 danh sách field
  bool _areFieldListsEqual(List<FieldConfigEntity> list1, List<FieldConfigEntity> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i].code != list2[i].code) return false;
    }
    return true;
  }
}
