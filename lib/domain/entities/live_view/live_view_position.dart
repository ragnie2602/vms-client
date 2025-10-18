import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class LiveViewPosition {
  final int index;
  final String cameraId;
  final CameraEntity? camera;

  const LiveViewPosition({required this.index, required this.cameraId, this.camera});
}
