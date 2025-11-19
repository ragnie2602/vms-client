import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

abstract class IScheduleRepository {
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  });
}
