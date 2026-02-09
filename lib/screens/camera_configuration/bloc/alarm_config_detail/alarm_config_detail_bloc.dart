import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/ai_alarm_config.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_config_repository.dart';

part 'alarm_config_detail_event.dart';
part 'alarm_config_detail_state.dart';

class AlarmConfigDetailBloc extends Bloc<AlarmConfigDetailEvent, AlarmConfigDetailState> {
  final IAiConfigRepository aiConfigRepository;
  final String cameraId;
  final String type;
  final int baseStatus;
  AlarmConfigDetailBloc(
    this.aiConfigRepository, {
    required this.cameraId,
    required this.type,
    required this.baseStatus,
  }) : super(AlarmConfigDetailInitial()) {
    on<GetAlarmConfigDetail>(_onGetAlarmConfigDetail);
    on<ValidateAlarmConfig>(_onValidateAlarmConfig);
    on<SaveAlarmConfig>(_onSaveAlarmConfig, transformer: droppable());
  }

  FutureOr<void> _onGetAlarmConfigDetail(
    GetAlarmConfigDetail event,
    Emitter<AlarmConfigDetailState> emit,
  ) async {
    emit(AlarmConfigDetailLoading());

    final result = await aiConfigRepository.getAiAlarmConfigDetail(
      cameraId: cameraId,
      alarmType: type,
      status: baseStatus,
    );

    result.fold((failure) => emit(AlarmConfigDetailError(failure.toString())), (alarmConfig) {
      emit(AlarmConfigDetailLoaded(alarmConfig: alarmConfig, canSave: alarmConfig.validate()));
    });
  }

  FutureOr<void> _onValidateAlarmConfig(
    ValidateAlarmConfig event,
    Emitter<AlarmConfigDetailState> emit,
  ) async {
    if (state is! AlarmConfigDetailLoaded) return;
    final currentState = state as AlarmConfigDetailLoaded;

    final canSave = event.force ?? currentState.alarmConfig.validate();
    if (canSave != currentState.canSave) emit(currentState.copyWith(canSave: canSave));
  }

  FutureOr<void> _onSaveAlarmConfig(
    SaveAlarmConfig event,
    Emitter<AlarmConfigDetailState> emit,
  ) async {
    if (state is! AlarmConfigDetailLoaded) return;
    final currentState = state as AlarmConfigDetailLoaded;

    final result = await aiConfigRepository.updateAiAlarmConfigDetail(
      cameraId: cameraId,
      alarmType: type,
      config: currentState.alarmConfig,
    );

    result.fold(
      (failure) => event.onFailure?.call(failure.toString()),
      (alarmConfig) => event.onSuccess?.call(alarmConfig.status),
    );
  }
}
