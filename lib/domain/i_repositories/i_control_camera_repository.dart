import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';

abstract class IControlCameraRepository {
  Future<Either<Failure, CameraOnvif?>> validateCamera({String? message});
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({List<int>? cameraId, int? status, int? ivaType});
  Future<Either<Failure, CameraOnvif>> checkCameraOnvif({
    required String xaddrs,
    required String userName,
    required String password,
    List<int>? boxId,
  });
}
