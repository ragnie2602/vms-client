import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import '../entities/camera/camera_entity.dart';

abstract class ICameraRepository {
  Future<List<CameraEntity>?> getAllCamera(GetAllCamera_Request data);
}
