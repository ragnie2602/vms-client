import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/alarm_sound.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_config_repository.dart';
import 'package:vms_flutter_client/domain/usecases/alarm_sound/sources.dart';

part 'alarm_sound_event.dart';
part 'alarm_sound_state.dart';

class AlarmSoundBloc extends Bloc<AlarmSoundEvent, AlarmSoundState> {
  final IAiConfigRepository aiConfigRepository;
  final SyncAlarmSoundsUseCase syncAlarmSoundsUseCase;
  final SyncAlarmSoundUseCase syncAlarmSoundUseCase;

  AlarmSoundBloc(this.aiConfigRepository, this.syncAlarmSoundsUseCase, this.syncAlarmSoundUseCase)
    : super(AlarmSoundInitial()) {
    on<GetAlarmSounds>(_onGetAlarmSounds);
    on<SyncAlarmSounds>(_onSyncAlarmSounds);
    on<SyncAlarmSound>(_onSyncAlarmSound);
  }

  FutureOr<void> _onGetAlarmSounds(GetAlarmSounds event, Emitter<AlarmSoundState> emit) async {
    if (!event.force && state is AlarmSoundLoaded) return;

    emit(AlarmSoundLoading());

    final result = await aiConfigRepository.getAlarmSounds();

    if (result.isLeft) {
      emit(AlarmSoundError(result.left!.toString()));
    } else {
      final sounds = await syncAlarmSoundsUseCase.execute(
        SyncAlarmSoundsInput(baseSounds: result.right ?? []),
      );

      emit(AlarmSoundLoaded(alarmSounds: sounds.alarmSounds));
    }
  }

  FutureOr<void> _onSyncAlarmSounds(SyncAlarmSounds event, Emitter<AlarmSoundState> emit) async {
    if (state is! AlarmSoundLoaded) return;

    final loadedState = state as AlarmSoundLoaded;
    final sounds = await syncAlarmSoundsUseCase.execute(
      SyncAlarmSoundsInput(baseSounds: loadedState.alarmSounds, force: event.force),
    );
    emit(loadedState.copyWith(alarmSounds: sounds.alarmSounds));
  }

  FutureOr<void> _onSyncAlarmSound(SyncAlarmSound event, Emitter<AlarmSoundState> emit) async {
    if (state is! AlarmSoundLoaded) return;

    final loadedState = state as AlarmSoundLoaded;
    final index = loadedState.alarmSounds.indexWhere((e) => e.id == event.soundId);
    if (index == -1) return;

    await syncAlarmSoundUseCase.execute(SyncAlarmSoundInput(loadedState.alarmSounds[index]));
    emit(loadedState.copyWith(alarmSounds: loadedState.alarmSounds));
  }
}
