import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';

import '../../domain/entities/camera/add_camera.dart';
import 'base_repository.dart';

class CameraRepository extends BaseRepository implements ICameraRepository {
  final CameraService service;

  const CameraRepository(this.service);

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({List<int>? cameraId, int? status, int? ivaType}) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await service.getAllCamera(cameraId: cameraId, status: status, ivaType: ivaType);

      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamerasInGroup({required List<int> groupId}) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await service.getAllCamerasInGroup(groupId: groupId);
      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, AddCameraEntity>> addCameraRTSP({
    required String name,
    required String username,
    required String password,
    required String rtspUrl,
    CameraMap? location,
    List<int>? boxId,
    List<int>? groupId,
    List<String>? subStreamUrls,
  }) async {
    return await catchError<AddCameraEntity>(() async {
      final reply = await service.addCameraRTSP(
        name: name,
        username: username,
        password: password,
        rtspUrl: rtspUrl,
        location: location?.toMapper(),
        boxId: boxId,
        groupId: groupId,
        subStreamUrls: subStreamUrls,
      );
      return Right(AddCameraEntity(cameraId: reply.cameraId, camera: reply.camera));
    });
  }

  @override
  Future<Either<Failure, AddCameraEntity>> addCameraOnVif({
    required String name,
    required String username,
    required String password,
    required String onvifDeviceIp,
    String? rtspUrl,
    String? serialNumber,
    CameraMap? location,
    List<int>? boxId,
    List<int>? groupId,
    String? urn,
    List<String>? subStreamUrls,
  }) async {
    return await catchError<AddCameraEntity>(() async {
      final reply = await service.addCameraOnVif(
        name: name,
        username: username,
        password: password,
        onvifDeviceIp: onvifDeviceIp,
        rtspUrl: rtspUrl,
        serialNumber: serialNumber,
        location: location?.toMapper(),
        boxId: boxId,
        groupId: groupId,
        urn: urn,
        subStreamUrls: subStreamUrls,
      );
      return Right(AddCameraEntity(cameraId: reply.cameraId, camera: reply.camera));
    });
  }
}
