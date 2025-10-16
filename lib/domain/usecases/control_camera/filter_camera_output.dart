import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_camera_output.freezed.dart';

@freezed
class FilterCameraOutput extends BaseOutput with _$FilterCameraOutput {
  const factory FilterCameraOutput({List<CameraEntity>? listCamera}) =
      _FilterCameraOutput;
}
