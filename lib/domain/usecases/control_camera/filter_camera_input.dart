import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_camera_input.freezed.dart';

@freezed
class FilterCameraInput extends BaseInput with _$FilterCameraInput {
  const factory FilterCameraInput({
    String? nameCamera,
    CameraStatus? cameraStatus,
    List<CameraEntity>? listCameraOrigin,
  }) = _FilterCameraInput;
}
