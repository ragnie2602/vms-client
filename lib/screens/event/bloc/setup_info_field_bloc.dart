import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/event_constants.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';

part 'setup_info_field_event.dart';
part 'setup_info_field_state.dart';

class SetupInfoFieldBloc
    extends Bloc<SetupInfoFieldEvent, SetupInfoFieldState> {
  final IDetectRepository _detectRepository;
  final IEventRepository _eventRepository;

  final Map<String, List<FieldConfigEntity>> configTable = {};

  SetupInfoFieldBloc(this._detectRepository, this._eventRepository)
    : super(const SetupInfoFieldState()) {
    on<SetupInfoFieldInit>(_onInit);
    on<SetupInfoFieldSelectType>(_onSelectType);
    on<SetupInfoFieldAddField>(_onAddField);
    on<SetupInfoFieldRemoveField>(_onRemoveField);
    on<SetupInfoFieldReorder>(_onReorder);
    on<SetupInfoFieldSave>(_onSave);
  }

  Future<void> _onInit(
    SetupInfoFieldInit event,
    Emitter<SetupInfoFieldState> emit,
  ) async {
    emit(state.copyWith(status: SetupInfoFieldStatus.loading));

    final result = await _detectRepository.getListFieldAvailable();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SetupInfoFieldStatus.failure,
          errorMessage: failure.toString(),
        ),
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
          add(
            SetupInfoFieldSelectType(event.typeConfig, event.typeEvents!.first),
          );
        }
      },
    );
  }

  // change kiểu sự kiện -> load lại config mới
  Future<void> _onSelectType(
    SetupInfoFieldSelectType event,
    Emitter<SetupInfoFieldState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedType: event.type,
        configStatus: SetupInfoFieldConfigStatus.loading,
      ),
    );
    if (event.type.type == null) {
      return;
    }
    Either<Failure, EventDisplayConfigEntity> result;
    if (event.typeConfig == EventTypeConfig.LIVEVIEW) {
      result = await _detectRepository.getEventDisplayConfig(
        eventTypeName: event.type.typeName!,
      );
    } else {
      result = await _eventRepository.getEventDisplayConfig(
        event.type.typeName!,
      );
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
          final field = state.availableFields
              .cast<FieldConfigEntity?>()
              .firstWhere((f) => f?.code == code, orElse: () => null);
          // nếu chưa có trong available thì không thêm vào
          if (field != null) orderedFields.add(field);
        }

        configTable[config.eventTypeName ?? ''] = orderedFields;

        emit(
          state.copyWith(
            configStatus: SetupInfoFieldConfigStatus.success,
            currentConfig: config,
            currentFields: orderedFields,
          ),
        );
      },
    );
  }

  void _onAddField(
    SetupInfoFieldAddField event,
    Emitter<SetupInfoFieldState> emit,
  ) {
    final updatedFields = List<FieldConfigEntity>.from(state.currentFields)
      ..add(event.field);
    emit(state.copyWith(currentFields: updatedFields));
  }

  void _onRemoveField(
    SetupInfoFieldRemoveField event,
    Emitter<SetupInfoFieldState> emit,
  ) {
    final updatedFields = List<FieldConfigEntity>.from(state.currentFields)
      ..remove(event.field);
    emit(state.copyWith(currentFields: updatedFields));
  }

  void _onReorder(
    SetupInfoFieldReorder event,
    Emitter<SetupInfoFieldState> emit,
  ) {
    final updatedFields = List<FieldConfigEntity>.from(state.currentFields);
    final item = updatedFields.removeAt(event.oldIndex);
    updatedFields.insert(event.newIndex, item);
    emit(state.copyWith(currentFields: updatedFields));
  }

  Future<void> _onSave(
    SetupInfoFieldSave event,
    Emitter<SetupInfoFieldState> emit,
  ) async {
    // lấy kiểu sự kiện đang chọn
    if (state.selectedType?.type == null) return;
    emit(state.copyWith(saveStatus: SetupInfoFieldStatus.loading));
    final listField = state.currentFields
        .map((e) => e.code)
        .where((e) => e != null)
        .cast<String>()
        .toList();

    Either<Failure, EventDisplayConfigEntity> result;
    if (event.typeConfig == EventTypeConfig.LIVEVIEW) {
      result = await _detectRepository.updateEventDisplayConfig(
        listField: listField,
        eventTypeName: state.selectedType!.typeName!,
      );
    } else {
      result = await _eventRepository.updateEventDisplayConfig(
        listField: listField,
        eventType: state.selectedType!.typeName!,
      );
    }

    result.fold(
      (failure) => emit(
        state.copyWith(
          saveStatus: SetupInfoFieldStatus.failure,
          saveErrorMessage: failure.toString(),
        ),
      ),
      (success) {
        configTable[state.selectedType!.typeName ?? ''] = state.currentFields;
        emit(state.copyWith(saveStatus: SetupInfoFieldStatus.success));
      },
    );
  }
}
