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
}
