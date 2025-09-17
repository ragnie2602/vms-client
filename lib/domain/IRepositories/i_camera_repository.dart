import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';

import '../entities/camera/camera_entity.dart';
import 'i_base_repository.dart';

abstract class ICameraRepository extends IBaseRepository {
  Future<List<CameraEntity>?> getAllCamera(GetAllCamera_Request data);
}
