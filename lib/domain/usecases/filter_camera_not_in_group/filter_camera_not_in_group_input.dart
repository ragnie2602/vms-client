import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

part 'filter_camera_not_in_group_input.freezed.dart';

@freezed
class FilterCameraNotInGroupInput extends BaseInput with _$FilterCameraNotInGroupInput {
  const factory FilterCameraNotInGroupInput({
   List<int>? groupId
  }) = _FilterCameraNotInGroupInput;
}