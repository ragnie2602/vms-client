import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';

import '../entities/camera/add_camera.dart';

abstract class IControlCameraRepository {
  Future<Either<Failure, CameraOnvif?>> validateCamera({String? message});
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({List<int>? cameraId, int? status, int? ivaType});
  Future<Either<Failure, CameraOnvif>> checkCameraOnvif({
    required String xaddrs,
    required String userName,
    required String password,
    List<int>? boxId,
  });
  Future<Either<Failure, AddCameraEntity>> addCameraRTSP({
    required String name,
    required String username,
    required String password,
    required String rtspUrl,
    CameraMap? location,
    List<int>? boxId,
    List<int>? groupId,
    List<String>? subStreamUrls,
  });
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
  });

  Future<Either<Failure, CameraEntity>> updateCamera({
    required List<int> cameraId,
    String? name,
    String? rtspUrl,
    String? userName,
    String? password,
    String? xaddr,
    CameraMap? location,
    List<String>? subStreamUrls,
  });

  Future<Either<Failure, List<int>>> deleteCamera({required List<int> cameraId});
}
