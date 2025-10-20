import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class LiveViewPosition {
  final int index;
  final List<int> cameraId;
  final CameraEntity? camera;

  const LiveViewPosition({required this.index, required this.cameraId, this.camera});

  LiveViewPosition copyWith({CameraEntity? camera, int? index, List<int>? cameraId}) {
    return LiveViewPosition(
      index: index ?? this.index,
      cameraId: cameraId ?? this.cameraId,
      camera: camera ?? this.camera,
    );
  }
}
