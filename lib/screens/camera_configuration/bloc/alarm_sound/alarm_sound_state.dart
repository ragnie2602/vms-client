part of 'alarm_sound_bloc.dart';

sealed class AlarmSoundState extends BaseState {
  const AlarmSoundState();

  @override
  List<Object> get props => [];
}

final class AlarmSoundInitial extends AlarmSoundState {
  @override
  StateType get type => StateType.initial;
}

final class AlarmSoundLoading extends AlarmSoundState {
  @override
  StateType get type => StateType.loading;
}

final class AlarmSoundLoaded extends AlarmSoundState {
  final List<AlarmSound> alarmSounds;

  const AlarmSoundLoaded({required this.alarmSounds});

  @override
  List<Object> get props => [alarmSounds];
  @override
  StateType get type => alarmSounds.isNotEmpty ? StateType.success : StateType.empty;
}

final class AlarmSoundError extends AlarmSoundState {
  final String message;
  const AlarmSoundError(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}
