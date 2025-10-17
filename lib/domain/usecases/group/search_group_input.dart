import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_group_input.freezed.dart';

@freezed
class SearchGroupInput extends BaseInput with _$SearchGroupInput {
  const factory SearchGroupInput({
    String? nameGroup,
     List<DeviceGroup>? listGroupOrigin,
  }) = _SearchGroupInput;
}
