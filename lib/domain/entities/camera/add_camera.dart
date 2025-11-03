import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class AddCameraEntity {
  final List<int> cameraId;
  final CameraEntity camera;

  AddCameraEntity({required this.cameraId, required this.camera});
}
