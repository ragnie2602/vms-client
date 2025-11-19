import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_schedule_repository.dart';

class ScheduleRepository extends BaseRepository implements IScheduleRepository {
  final CameraService cameraService;
  const ScheduleRepository({required this.cameraService});
}
