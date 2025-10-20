part of 'playback_bloc.dart';

sealed class PlaybackEvent extends BaseEvent {
  const PlaybackEvent();
}

final class GetVideoPlaybacks extends PlaybackEvent {
  final List<int> id;
  final DateTime date;

  const GetVideoPlaybacks(this.id, this.date);
}

class SetPlaybackAtTime extends PlaybackEvent {
  final DateTime time;

  const SetPlaybackAtTime(this.time);
}

class ChangePlayback extends PlaybackEvent {
  final PlaybackVideo playback;

  const ChangePlayback(this.playback);
}

class DownloadPlayback extends PlaybackEvent {
  final PlaybackVideo playback;
  final Function(double?)? onProgress;

  const DownloadPlayback(this.playback, {this.onProgress});
}
