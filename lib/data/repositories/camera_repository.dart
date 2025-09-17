import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import 'base_repository.dart';

class CameraRepository extends BaseRepository implements ICameraRepository {
  final CameraService service;

  const CameraRepository(this.service);

  @override
  Future<List<CameraEntity>?> getAllCamera(GetAllCamera_Request data) {
    return service.getAllCamera(data);
  }
}
