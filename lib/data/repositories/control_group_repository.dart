import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/domain/entities/camera/add_camera.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';

import 'base_repository.dart';

class ControlCameraRepository extends BaseRepository implements IControlCameraRepository {
  final CameraService service;

  const ControlCameraRepository(this.service);

  @override
  Future<Either<Failure, CameraOnvif?>> validateCamera({String? message}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({List<int>? cameraId, int? status, int? ivaType}) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await service.getAllCamera(cameraId: cameraId, status: status, ivaType: ivaType);

      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, CameraOnvif>> checkCameraOnvif({
    required String xaddrs,
    required String userName,
    required String password,
    List<int>? boxId,
  }) async {
    return await catchError<CameraOnvif>(() async {
      final checkCameraOnvif = await service.checkCameraOnvif(xaddrs: xaddrs, userName: userName, password: password, boxId: boxId);
      return Right(checkCameraOnvif.toDomain());
    });
  }

  @override
  Future<Either<Failure, AddCameraEntity>> addCameraOnvif({
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
      final checkCameraOnvif = await service.addCameraOnVif(
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
      return Right(checkCameraOnvif);
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
      final addCameraRTSP = await service.addCameraRTSP(
        name: name,
        username: username,
        password: password,
        rtspUrl: rtspUrl,
        location: location?.toMapper(),
        boxId: boxId,
        groupId: groupId,
        subStreamUrls: subStreamUrls,
      );
      return Right(addCameraRTSP);
    });
  }

  @override
  Future<Either<Failure, CameraEntity>> updateCamera({
    required List<int> cameraId,
    String? name,
    String? rtspUrl,
    String? userName,
    String? password,
    String? xaddr,
    CameraMap? location,
    List<String>? subStreamUrls,
  }) async {
    return await catchError<CameraEntity>(() async {
      final camera = await service.updateCamera(
        cameraId: cameraId,
        name: name,
        rtspUrl: rtspUrl,
        userName: userName,
        password: password,
        xaddr: xaddr,
        location: location?.toMapper(),
        subStreamUrls: subStreamUrls,
      );
      return Right(camera.toDomain());
    });
  }
}
