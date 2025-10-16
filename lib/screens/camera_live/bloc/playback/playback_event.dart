part of 'playback_bloc.dart';

sealed class PlaybackEvent extends BaseEvent {
  const PlaybackEvent();
}

final class GetVideoPlaybacks extends PlaybackEvent {
  final List<int> id;

  const GetVideoPlaybacks(this.id);
}

class SetPlaybackAtTime extends PlaybackEvent {
  final DateTime time;

  const SetPlaybackAtTime(this.time);
}

class ChangePlayback extends PlaybackEvent {
  final PlaybackVideo playback;

  const ChangePlayback(this.playback);
}
