part of 'alarm_sound_bloc.dart';

sealed class AlarmSoundEvent extends Equatable {
  const AlarmSoundEvent();

  @override
  List<Object> get props => [];
}

class GetAlarmSounds extends AlarmSoundEvent {
  final Function()? onSuccess;
  const GetAlarmSounds({this.onSuccess});
}
