import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';

import 'base_repository.dart';

class ControlCameraRepository extends BaseRepository
    implements IControlCameraRepository {
  final CameraService service;

  const ControlCameraRepository(this.service);

  @override
  Future<Either<Failure, CheckCameraOnvif?>> validateCamera({String? message}) {
    throw UnimplementedError();
  }

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
}
