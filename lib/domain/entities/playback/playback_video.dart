class PlaybackVideo {
  final DateTime startTime;
  final DateTime endTime;
  final String urlPlayback;
  final List<int> cameraId;
  final String urlThumbnail;
  final int duration;
  final List<int> playbackId;

  PlaybackVideo({
    required this.startTime,
    required this.endTime,
    required this.urlPlayback,
    required this.cameraId,
    required this.urlThumbnail,
    required this.duration,
    required this.playbackId,
  });

  @override
  String toString() {
    return 'PlaybackVideo(startTime: $startTime -> endTime: $endTime)';
  }

  PlaybackVideo copyWith({
    DateTime? startTime,
    DateTime? endTime,
    String? urlPlayback,
    List<int>? cameraId,
    String? urlThumbnail,
    int? duration,
    List<int>? playbackId,
  }) {
    return PlaybackVideo(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      urlPlayback: urlPlayback ?? this.urlPlayback,
      cameraId: cameraId ?? this.cameraId,
      urlThumbnail: urlThumbnail ?? this.urlThumbnail,
      duration: duration ?? this.duration,
      playbackId: playbackId ?? this.playbackId,
    );
  }
}

extension ListPlaybackVideoExt on List<PlaybackVideo> {
  int? atTime(DateTime target) {
    if (isEmpty) return null;
    if (target.isBefore(first.startTime)) return null;
    if (target.isAfter(last.endTime)) return null;

    int low = 0;
    int high = length - 1;

    while (low <= high) {
      final mid = (low + high) >> 1;

      if (target.isAfter(this[mid].endTime)) {
        low = mid + 1;
      } else if (target.isBefore(this[mid].startTime)) {
        high = mid - 1;
      } else {
        return mid;
      }
    }

    return null;
  }
}
