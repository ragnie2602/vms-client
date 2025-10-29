import 'package:diacritic/diacritic.dart';
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
    if (input.isOnline == null && (input.nameCamera ?? '').isEmpty) {
      return FilterCameraOutput(listCamera: listCameraOrigin);
    }
    // lọc theo tên camera
    if ((input.nameCamera ?? '').isNotEmpty) {
      String _key = removeDiacritics(
        (input.nameCamera ?? '').trim().toLowerCase(),
      );
      listCameraAfterFilter = listCameraAfterFilter
          .where(
            (e) => removeDiacritics(e.name.toLowerCase().trim()).contains(_key),
          )
          .toList();
    }
    // lọc theo trạng thái
    if (input.isOnline != null) {
      listCameraAfterFilter = listCameraAfterFilter
          .where((e) => e.isOnline == input.isOnline)
          .toList();
    }
    return FilterCameraOutput(listCamera: listCameraAfterFilter);
  }
}
