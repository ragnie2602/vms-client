import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

import 'delete_camera_input.dart';
import 'delete_camera_output.dart';

class DeleteCameraUseCase extends FutureUseCase<DeleteCameraInput, DeleteCameraOutput> {
  final CameraService cameraService;

  const DeleteCameraUseCase({required this.cameraService});

  @override
  Future<DeleteCameraOutput> buildUseCase(DeleteCameraInput input) async {
    try {
      final deletedCameraIds = await cameraService.deleteCamera(cameraId: input.cameraId);
      return DeleteCameraOutput(deletedCameraIds: deletedCameraIds, isSuccess: true);
    } catch (e) {
      return DeleteCameraOutput(deletedCameraIds: [], isSuccess: false, errorMessage: e.toString());
    }
  }
}
