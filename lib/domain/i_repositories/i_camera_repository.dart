import 'package:vms_flutter_client/core/base_response.dart';
import '../entities/camera/camera_entity.dart';

abstract class ICameraRepository {
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  });
  Future<Either<Failure, List<CameraEntity>>> getAllCamerasInGroup({
    required List<int> groupId,
  });
}
