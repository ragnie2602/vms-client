import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/add_camera.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_info_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/import_camera_cell.dart';
import 'package:vms_flutter_client/domain/entities/camera/import_camera_entity.dart';

import '../entities/camera/camera_alarm_config.dart';
import '../entities/camera/camera_entity.dart';

abstract class ICameraRepository {
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({List<int>? cameraId, int? status, int? ivaType});
  Future<Either<Failure, List<CameraEntity>>> getAllCamerasInGroup({required List<int> groupId});

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
  });
  // camera info
  Future<Either<Failure, CameraInfoEntity>> getCameraInfo({required List<int> cameraId});
  Future<Either<Failure, ImportCameraEntity>> importCamera({required List<ImportCameraCell> cameras});

  /* AI Config */
  Future<Either<Failure, List<CameraAlarmConfig>>> getAiAlarmConfigs(String cameraId);
}
