import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/alarm_sound.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_config_repository.dart';

part 'alarm_sound_event.dart';
part 'alarm_sound_state.dart';

class AlarmSoundBloc extends Bloc<AlarmSoundEvent, AlarmSoundState> {
  final IAiConfigRepository aiConfigRepository;
  AlarmSoundBloc(this.aiConfigRepository) : super(AlarmSoundInitial()) {
    on<GetAlarmSounds>(_onGetAlarmSounds);
  }

  FutureOr<void> _onGetAlarmSounds(GetAlarmSounds event, Emitter<AlarmSoundState> emit) async {
    emit(AlarmSoundLoading());

    final result = await aiConfigRepository.getAlarmSounds();

    result.fold(
      (failure) => emit(AlarmSoundError(failure.toString())),
      (alarmSounds) {
        emit(AlarmSoundLoaded(alarmSounds: alarmSounds));
        event.onSuccess?.call();
      },
    );
  }
}
