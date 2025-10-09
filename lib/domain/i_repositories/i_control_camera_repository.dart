import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

abstract class IControlCameraRepository {
  Future<Either<Failure, CheckCameraOnvif?>> validateCamera({String? message});
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  });
}
