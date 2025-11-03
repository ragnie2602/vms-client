import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_camera_not_in_group_output.freezed.dart';

@freezed
class FilterCameraNotInGroupOutput extends BaseOutput with _$FilterCameraNotInGroupOutput {
  const factory FilterCameraNotInGroupOutput({List<CameraEntity>? listCamera}) =
      _FilterCameraNotInGroupOutput;
}
