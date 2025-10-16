import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

part 'filter_camera_no_group_output.freezed.dart';

@freezed
class FilterCameraNoGroupOutput extends BaseOutput
    with _$FilterCameraNoGroupOutput {
  const factory FilterCameraNoGroupOutput({
    List<CameraEntity>? listCamera,
  }) = _FilterCameraNoGroupOutput;
}
