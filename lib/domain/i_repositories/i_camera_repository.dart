import 'package:vms_flutter_client/core/base_response.dart';
import '../entities/camera/camera_entity.dart';
import '../entities/live_view/custom_live_view.dart';

abstract class ICameraRepository {
  Future<List<CameraEntity>?> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  });
  Future<Either<Failure, List<CameraEntity>>> getAllCamerasInGroup({
    required List<int> groupId,
  });
  Future<Either<Failure, List<CustomLiveView>>> getListCustomLiveView();
}
