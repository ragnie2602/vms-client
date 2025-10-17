import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../base_input.dart';

class DeleteCameraInput extends BaseInput {
  final List<int> cameraId;
  final List<CameraEntity> currentList;

  const DeleteCameraInput({required this.cameraId, required this.currentList});
}
