import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/usecases/event/get_event_display_config_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/save_event_display_config_usecase.dart';

part 'setup_info_field_event.dart';
part 'setup_info_field_state.dart';

class SetupEventDisplayBloc extends Bloc<SetupEventDisplayEvent, SetupEventDisplayState> {
  final GetEventDisplayConfigUsecase _getEventDisplayConfigUsecase;
  final SaveEventDisplayConfigUsecase _saveEventDisplayConfigUsecase;

  final Map<int, EventDisplayConfig> _changes = {};

  SetupEventDisplayBloc(this._getEventDisplayConfigUsecase, this._saveEventDisplayConfigUsecase)
    : super(const SetupEventDisplayState()) {
    on<CancelChangeConfigs>(_onCancelChangeConfigs);
    on<ChangeConfig>(_onChangeConfig);
    on<GetEventDisplayConfig>(_onGetEventDisplayConfig);
    on<SaveConfigs>(_onSaveConfigs);
  }

  void _onChangeConfig(ChangeConfig event, Emitter<SetupEventDisplayState> emit) {
    _changes[event.config.id!] = event.config;
  }

  Future<void> _onGetEventDisplayConfig(
    GetEventDisplayConfig event,
    Emitter<SetupEventDisplayState> emit,
  ) async {
    emit(const SEDGettingEventDisplayConfig());

    final _c = _changes.values.firstWhereOrNull(
      (c) => c.eventType == event.eventType && c.typeConfig == event.typeConfig,
    );

    if (_c != null) {
      emit(SEDGetEventDisplayConfigSuccess(_c));
      return;
    }

    final result = await _getEventDisplayConfigUsecase.execute(
      GetEventDisplayConfigInput(event.eventType, event.typeConfig),
    );

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

    emit(SEDSavingConfigsSuccess());
  }
}
