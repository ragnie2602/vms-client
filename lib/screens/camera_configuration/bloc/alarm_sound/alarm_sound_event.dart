part of 'alarm_sound_bloc.dart';

sealed class AlarmSoundEvent extends Equatable {
  const AlarmSoundEvent();

  @override
  List<Object> get props => [];
}

class GetAlarmSounds extends AlarmSoundEvent {
  final bool force;

  const GetAlarmSounds({this.force = true});
}

class SyncAlarmSounds extends AlarmSoundEvent {
  final bool force;
  const SyncAlarmSounds({this.force = false});
}

class SyncAlarmSound extends AlarmSoundEvent {
  final int soundId;
  const SyncAlarmSound(this.soundId);
}
