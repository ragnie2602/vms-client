import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class FilterCameraInput extends BaseInput {
  // name
  final String? nameCamera;
  // status
  final CameraStatus? cameraStatus;
  // list cam input
  final List<CameraEntity>? listCameraOrigin;

  FilterCameraInput({this.nameCamera, this.cameraStatus, this.listCameraOrigin});
}
