import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class FilterTagCameraUseCase
    extends SyncUseCase<FilterTagCameraInput, FilterTagCameraOutput> {
  // hàm search, filter
  @override
  FilterTagCameraOutput buildUseCase(FilterTagCameraInput input) {
    List<CameraEntity> listCameraOrigin = input.listCameraOrigin ?? [];
    List<CameraEntity> listCameraAfterFilter = listCameraOrigin;
    // nếu ko có dữ liệu filter => return list cũ
    if (input.keyWord == null && (input.tagName ?? '').isEmpty) {
      return FilterTagCameraOutput(listCamera: listCameraOrigin);
    }
    // lọc theo tên camera
    if ((input.tagName ?? '').isNotEmpty) {
      String _key = removeDiacritics(
        (input.tagName ?? '').trim().toLowerCase(),
      );
      listCameraAfterFilter = listCameraAfterFilter
          .where(
            (e) => removeDiacritics(e.name.toLowerCase().trim()).contains(_key),
          )
          .toList();
    }
    // lọc theo trạng thái
    if (input.tagName != null) {
      listCameraAfterFilter = listCameraAfterFilter
          .where((e) => e.name == input.tagName)
          .toList();
    }
    return FilterTagCameraOutput(listCamera: listCameraAfterFilter);
  }
}
