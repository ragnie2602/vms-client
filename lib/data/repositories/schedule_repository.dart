import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/schedule_record_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_schedule_repository.dart';

class ScheduleRepository extends BaseRepository implements IScheduleRepository {
  final ScheduleRecordService service;
  const ScheduleRepository(this.service);

  @override
  Future<Either<Failure, CameraEntity>> configScheduleRecording({
    List<int>? cameraId,
    RecordingEntity? record,
  }) async {
    return await catchError<CameraEntity>(() async {
      final res = await service.scheduleRecording(
        cameraId: cameraId,
        record: record,
      );
      return Right(res.camera.toDomain());
    });
  }
}
