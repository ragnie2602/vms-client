import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/mappers/playback_mapper.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_playback_repository.dart';

import '../datasources/playback_service.dart';
import 'base_repository.dart';

class PlaybackRepository extends BaseRepository implements IPlaybackRepository {
  final PlaybackService service;

  const PlaybackRepository(this.service);

  @override
  Future<Either<Failure, List<PlaybackVideo>>> getTimeShiftVideoCloudCamera({
    List<int>? cameraId,
    required int currentTime,
    int timeZone = 0,
    List<List<int>>? cameraIdList,
    int? indexPlayback
  }) async {
    return await catchError<List<PlaybackVideo>>(() async {
      final data = await service.getTimeShiftVideoCloudCamera(
        cameraId: cameraId,
        currentTime: currentTime,
        timeZone: timeZone,
        cameraIdList: cameraIdList,
        indexPlayback: indexPlayback
      );

      return Right(data.map((e) => e.toDomain()).toList());
    });
  }
}
