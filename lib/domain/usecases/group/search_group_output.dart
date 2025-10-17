import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
part 'search_group_output.freezed.dart';

@freezed
class SearchGroupOutput extends BaseOutput with _$SearchGroupOutput {
  const factory SearchGroupOutput({List<DeviceGroup>? listGroupResult}) =
      _SearchGroupOutput;
}
