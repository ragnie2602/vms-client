import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/usecases/event/get_all_subject_type_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/get_event_display_config_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/save_event_display_config_usecase.dart';

part 'setup_info_field_event.dart';
part 'setup_info_field_state.dart';

class SetupEventDisplayBloc extends Bloc<SetupEventDisplayEvent, SetupEventDisplayState> {
  final GetAllSubjectTypesUsecase _getAllSubjectTypesUsecase;
  final GetEventDisplayConfigUsecase _getEventDisplayConfigUsecase;
  final SaveEventDisplayConfigUsecase _saveEventDisplayConfigUsecase;

  final Map<(String, int?), EventDisplayConfig> _changes = {};
  final Map<(String, int?), EventDisplayConfig> configs = {};

  SetupEventDisplayBloc(
    this._getAllSubjectTypesUsecase,
    this._getEventDisplayConfigUsecase,
    this._saveEventDisplayConfigUsecase,
  ) : super(const SetupEventDisplayState()) {
    on<CancelChangeConfigs>(_onCancelChangeConfigs);
    on<ChangeConfig>(_onChangeConfig);
    on<GetEventDisplayConfig>(_onGetEventDisplayConfig);
    on<SaveConfigs>(_onSaveConfigs);

    on<GetAllSubjectTypes>(_onGetAllSubjectTypes);
  }

  void _onChangeConfig(ChangeConfig event, Emitter<SetupEventDisplayState> emit) {
    _changes[(event.config.eventType, event.config.subjectTypeId)] = event.config;
    print(_changes.values.map((e) => e.toJson()));
    print(configs.values.map((e) => e.toJson()));
  }

  Future<void> _onGetEventDisplayConfig(
    GetEventDisplayConfig event,
    Emitter<SetupEventDisplayState> emit,
  ) async {
    emit(const SEDGettingEventDisplayConfig());

    final _c = _changes[(event.eventType, event.subjectTypeId)];
    if (_c != null) {
      emit(SEDGetEventDisplayConfigSuccess(_c));
      return;
    }

    final config = configs[(event.eventType, event.subjectTypeId)];
    if (config != null) {
      final c = _changes[(event.eventType, event.subjectTypeId)] = config.copyWith();
      emit(SEDGetEventDisplayConfigSuccess(c));
      return;
    }

    final result = await _getEventDisplayConfigUsecase.execute(
      GetEventDisplayConfigInput(event.eventType, event.typeConfig, event.subjectTypeId),
    );
    configs[(result.config.eventType, result.config.subjectTypeId)] = result.config;
    // _changes[(result.config.eventType, result.config.subjectTypeId)] = result.config;

    emit(SEDGetEventDisplayConfigSuccess(result.config));
  }

  void _onCancelChangeConfigs(CancelChangeConfigs event, Emitter<SetupEventDisplayState> emit) {
    _changes.clear();
  }

  _onSaveConfigs(SaveConfigs event, Emitter<SetupEventDisplayState> emit) async {
    emit(SEDSavingConfigs());

    await _saveEventDisplayConfigUsecase.execute(
      SaveEventDisplayConfigInput(_changes.values.toList()),
    );

    configs.addAll(_changes);
    _changes.clear();

    emit(SEDSavingConfigsSuccess());
  }

  FutureOr<void> _onGetAllSubjectTypes(
    GetAllSubjectTypes event,
    Emitter<SetupEventDisplayState> emit,
  ) async {
    emit(SEDGettingAllSubjectTypes());

    final result = await _getAllSubjectTypesUsecase.execute(GetAllSubjectTypesInput());

    emit(SEDGetAllSubjectTypesSuccess(result.subjectTypes));
  }
}
