import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../proto/models/comm.command2.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'base_repository.dart';

class CameraRepository extends BaseRepository implements ICameraRepository {
  final CameraService service;

  const CameraRepository(this.service);

  @override
  Future<List<CameraEntity>?> getAllCamera(GetAllCamera_Request data) async {
    try {
      return service.getAllCamera(data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure, List<Camera>>> getAllCamerasInGroup(GetCameraInGroup_Request data) async {
    return await catchError<List<Camera>>(() async {
      return Right(await service.getAllCamerasInGroup(data));
    });
  }

  @override
  Future<Either<Failure, List<CustomLiveView>>> getListCustomLiveView() async {
    return await catchError<List<CustomLiveView>>(() async {
      return Right(await service.getListCustomLiveView());
    });
  }
}
