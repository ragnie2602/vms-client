import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'base_repository.dart';

class CameraRepository extends BaseRepository implements ICameraRepository {
  final CameraService service;

  const CameraRepository(this.service);

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  }) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await service.getAllCamera(
        cameraId: cameraId,
        status: status,
        ivaType: ivaType,
      );

      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamerasInGroup({
    required List<int> groupId,
  }) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await service.getAllCamerasInGroup(groupId: groupId);
      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }
}
