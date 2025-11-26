import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_tag_camera_input.freezed.dart';

@freezed
class FilterTagCameraInput extends BaseInput with _$FilterTagCameraInput {
  const factory FilterTagCameraInput({
    String? tagName,
    String? keyWord,
    List<CameraEntity>? listCameraOrigin,
  }) = _FilterTagCameraInput;
}
