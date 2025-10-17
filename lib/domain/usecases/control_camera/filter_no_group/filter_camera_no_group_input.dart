import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_camera_no_group_input.freezed.dart';

@freezed
class FilterCameraNoGroupInput extends BaseInput with _$FilterCameraNoGroupInput {
  const factory FilterCameraNoGroupInput({
    List<CameraEntity>? listCameraOrigin,
  }) = _FilterCameraNoGroupInput;
}
