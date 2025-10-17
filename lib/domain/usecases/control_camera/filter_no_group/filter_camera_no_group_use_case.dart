import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class FilterCameraNoGroupUseCase
    extends SyncUseCase<FilterCameraNoGroupInput, FilterCameraNoGroupOutput> {
  // hàm search, filter
  @override
  FilterCameraNoGroupOutput buildUseCase(FilterCameraNoGroupInput input) {
    List<CameraEntity> listCameraOrigin = input.listCameraOrigin ?? [];
    List<CameraEntity> listCameraAfterFilter = listCameraOrigin;
    // nếu ko có groupOwnerId  thì là camera chưa được gán nhóm
    listCameraAfterFilter = listCameraOrigin
        .where((e) => (e.groupOwnerId ?? []).isEmpty)
        .toList();
   
    return FilterCameraNoGroupOutput(listCamera: listCameraAfterFilter);
  }
}
