import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';

import '../datasources/group_service.dart';
import 'base_repository.dart';

class ControlCameraRepository extends BaseRepository implements IControlCameraRepository {
  final GroupService service;

  const ControlCameraRepository(this.service);

  @override
  Future<Either<Failure, CheckCameraOnvif?>> validateCamera({String? message}) {
  
    throw UnimplementedError();
  }



}
