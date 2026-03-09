import 'package:vms_flutter_client/core/utils/common_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'get_camera_input.dart';
part 'get_camera_output.dart';

class GetCameraUseCase extends FutureUseCase<GetCameraInput, GetCameraOutput> {
  final ICameraRepository cameraRepository;

  const GetCameraUseCase(this.cameraRepository);

  @override
  Future<GetCameraOutput> buildUseCase(GetCameraInput input) async {
    List<CameraEntity>? cameras;
    List<CameraEntity>? allCameras;
    String? errMsg;

    if (input.groupId.equals([-1])) {
      (await cameraRepository.getAllCamera()).fold((error) => errMsg = error.toString(), (data) {
        cameras = data;
        allCameras = data;
      });
    } else if (input.groupId.equals([0])) {
      (await cameraRepository.getAllCamera()).fold((error) => errMsg = error.toString(), (data) {
        allCameras = data;
        cameras = data.where((c) => (c.groupOwnerId ?? []).isEmpty).toList();
      });
    } else {
      if (input.includeAllCameras) {
        final res = await Future.wait([
          cameraRepository.getAllCamerasInGroup(groupId: input.groupId),
          cameraRepository.getAllCamera(),
        ]);

        res[0].fold((error) => errMsg = error.toString(), (data) => cameras = data);
        res[1].fold((error) {}, (data) => allCameras = data);
      } else {
        (await cameraRepository.getAllCamerasInGroup(
          groupId: input.groupId,
        )).fold((error) => errMsg = error.toString(), (data) => cameras = data);
      }
    }

    if (input.tags?.isNotEmpty == true) {
      cameras = cameras?.where((c) => c.tags.any((t) => input.tags!.contains(t))).toList();
    }

    return GetCameraOutput(
      cameras: cameras,
      errMsg: errMsg,
      isSuccess: cameras != null,
      allCameras: allCameras,
    );
  }
}
