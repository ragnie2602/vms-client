part of 'playback_bloc.dart';

sealed class PlaybackEvent extends BaseEvent {
  const PlaybackEvent();
}

final class GetVideoPlaybacks extends PlaybackEvent {
  final List<int> id;

  const GetVideoPlaybacks(this.id);
}
