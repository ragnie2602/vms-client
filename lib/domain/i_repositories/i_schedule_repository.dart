import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';

abstract class IScheduleRepository {
  Future<Either<Failure, CameraEntity>> configScheduleRecording({
    List<int>? cameraId,
    RecordingEntity? record,
  });
}
