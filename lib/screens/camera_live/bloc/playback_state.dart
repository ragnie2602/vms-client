part of 'playback_bloc.dart';

sealed class PlaybackState extends BaseState {
  const PlaybackState();
}

final class PlaybackInitial extends PlaybackState {
  @override
  StateType get type => StateType.initial;
}

final class PlaybackLoading extends PlaybackState {
  @override
  StateType get type => StateType.loading;
}

final class PlaybackFailure extends PlaybackState {
  final String message;

  const PlaybackFailure(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

final class PlaybackSuccess extends PlaybackState {
  final List<PlaybackVideo> playbacks;

  const PlaybackSuccess(this.playbacks);

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [playbacks];
}
