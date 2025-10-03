import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import '../entities/camera/camera_entity.dart';

abstract class ICameraRepository {
  Future<List<CameraEntity>?> getAllCamera(GetAllCamera_Request data);
  Future<Either<Failure, List<Camera>>> getAllCamerasInGroup(GetCameraInGroup_Request data);
  Future<Either<Failure, List<CustomLiveView>>> getListCustomLiveView();
}
