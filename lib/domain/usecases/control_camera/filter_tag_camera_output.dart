import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_tag_camera_output.freezed.dart';

@freezed
class FilterTagCameraOutput extends BaseOutput with _$FilterTagCameraOutput {
  const factory FilterTagCameraOutput({List<CameraEntity>? listCamera}) =
      _FilterTagCameraOutput;
}
