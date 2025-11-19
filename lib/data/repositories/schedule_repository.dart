import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_schedule_repository.dart';

class ScheduleRepository extends BaseRepository implements IScheduleRepository {
  final CameraService cameraService;
  const ScheduleRepository({required this.cameraService});

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  }) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await cameraService.getAllCamera(
        cameraId: cameraId,
        status: status,
        ivaType: ivaType,
      );

      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }
}
