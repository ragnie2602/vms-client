import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../base_output.dart';

class DeleteCameraOutput extends BaseOutput {
  final List<int> deletedCameraIds;
  final bool isSuccess;
  final String? errorMessage;
  final List<CameraEntity> listCamera;

  const DeleteCameraOutput({required this.deletedCameraIds, required this.isSuccess, this.errorMessage, required this.listCamera});
}
