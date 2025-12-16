import 'package:vms_flutter_client/core/base_response.dart';

import '../entities/playback/playback_video.dart';

abstract class IPlaybackRepository {
  Future<Either<Failure, List<PlaybackVideo>>> getTimeShiftVideoCloudCamera({
    List<int>? cameraId,
    required int currentTime,
    int timeZone = 0,
    List<List<int>>? cameraIdList,
    int? indexPlayback
  });
}
