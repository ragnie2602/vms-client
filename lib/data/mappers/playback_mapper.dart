import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

extension PlaybackMapper on pb.GetTimeShiftVideoCloudCamera_PlaybackVideo {
  PlaybackVideo toDomain() {
    return PlaybackVideo(
      startTime: DateTime.fromMillisecondsSinceEpoch(startTime.toInt() * 1000),
      endTime: DateTime.fromMillisecondsSinceEpoch(endTime.toInt() * 1000),
      urlPlayback: urlPlayback,
      cameraId: cameraId,
      urlThumbnail: urlThumbnail,
      duration: duration,
      playbackId: playbackId,
    );
  }
}
