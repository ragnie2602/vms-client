import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/ai_alarm_config.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_config_repository.dart';

part 'alarm_config_detail_event.dart';
part 'alarm_config_detail_state.dart';

class AlarmConfigDetailBloc extends Bloc<AlarmConfigDetailEvent, AlarmConfigDetailState> {
  final IAiConfigRepository aiConfigRepository;
  AlarmConfigDetailBloc(this.aiConfigRepository) : super(AlarmConfigDetailInitial()) {
    on<GetAlarmConfigDetail>(_onGetAlarmConfigDetail);
  }

  FutureOr<void> _onGetAlarmConfigDetail(
    GetAlarmConfigDetail event,
    Emitter<AlarmConfigDetailState> emit,
  ) async {
    emit(AlarmConfigDetailLoading());

    final result = await aiConfigRepository.getAiAlarmConfigDetail(
      cameraId: event.cameraId,
      alarmType: event.type,
      status: event.status,
    );

    result.fold(
      (failure) => emit(AlarmConfigDetailError(failure.toString())),
      (alarmConfig) => emit(AlarmConfigDetailLoaded(alarmConfig: alarmConfig)),
    );
  }
}
