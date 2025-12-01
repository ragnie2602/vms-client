part of 'playback_bloc.dart';

sealed class PlaybackEvent extends BaseEvent {
  const PlaybackEvent();
}

final class GetVideoPlaybacks extends PlaybackEvent {
  final List<int> id;
  final DateTime date;

  const GetVideoPlaybacks(this.id, this.date);
}

class ChangePlayback extends PlaybackEvent {
  final int index;

  const ChangePlayback(this.index);
}

class DownloadPlayback extends PlaybackEvent {
  final String url;
  final Future<String?> Function() getSavedPath;
  final Function(double?)? onProgress;
  final Function(String?)? onError;

  const DownloadPlayback({
    required this.url,
    required this.getSavedPath,
    this.onProgress,
    this.onError,
  });
}
