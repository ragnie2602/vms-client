import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class FilterCameraUseCase
    extends SyncUseCase<FilterCameraInput, FilterCameraOutput> {
  // hàm search, filter
  @override
  FilterCameraOutput buildUseCase(FilterCameraInput input) {
    List<CameraEntity> listCameraOrigin = input.listCameraOrigin ?? [];
    List<CameraEntity> listCameraAfterFilter = listCameraOrigin;
    // nếu ko có dữ liệu filter => return list cũ
    if (input.cameraStatus == null && (input.nameCamera ?? '').isEmpty) {
      return FilterCameraOutput(listCamera: listCameraOrigin);
    }
    // lọc theo tên camera
    if ((input.nameCamera ?? '').isNotEmpty) {
      listCameraAfterFilter = listCameraAfterFilter
          .where(
            (e) => e.name.toLowerCase().trim().contains(
              (input.nameCamera ?? '').toLowerCase().trim(),
            ),
          )
          .toList();
    }
    // lọc theo trạng thái
    if (input.cameraStatus != null) {
      listCameraAfterFilter = listCameraAfterFilter
          .where((e) => e.status == input.cameraStatus)
          .toList();
    }
    return FilterCameraOutput(listCamera: listCameraAfterFilter);
  }
}
