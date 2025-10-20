import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class FilterCameraNotInGroupUsecase
    extends
        FutureUseCase<
          FilterCameraNotInGroupInput,
          FilterCameraNotInGroupOutput
        > {
  final ICameraRepository cameraRepository;
  const FilterCameraNotInGroupUsecase({required this.cameraRepository});
  @override
  Future<FilterCameraNotInGroupOutput> buildUseCase(
    FilterCameraNotInGroupInput input,
  ) async {
    try {
      // lấy danh sách tất cả camera
      final allResult = await cameraRepository.getAllCamera();
      List<CameraEntity> allCameras = [];
      allResult.fold((l) => allCameras = [], (r) => allCameras = r);
      // lấy danh sách camera đã có trong nhóm
      final inGroupResult = await cameraRepository.getAllCamerasInGroup(
        groupId: input.groupId ?? [],
      );
      List<CameraEntity> camerasInGroup = [];
      inGroupResult.fold((l) => camerasInGroup = [], (r) => camerasInGroup = r);
      final inGroupKeys = camerasInGroup.map((e) => e.id.join(',')).toSet();
      // lọc những camera không có trong nhóm
      final available = allCameras
          .where((e) => !inGroupKeys.contains(e.id.join(',')))
          .toList();
      return FilterCameraNotInGroupOutput(listCamera: available);
    } catch (e) {
      return FilterCameraNotInGroupOutput(listCamera: []);
    }
  }
}
