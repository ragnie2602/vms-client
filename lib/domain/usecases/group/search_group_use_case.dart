import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class SearchGroupUseCase
    extends SyncUseCase<SearchGroupInput, SearchGroupOutput> {
  @override
  SearchGroupOutput buildUseCase(SearchGroupInput input) {
    List<DeviceGroup> listGroupOrigin = input.listGroupOrigin ?? [];
    List<DeviceGroup> listGroupResult = listGroupOrigin;
    // nếu ko có dữ liệu search => return list cũ
    if ((input.nameGroup ?? '').isEmpty) {
      return SearchGroupOutput(listGroupResult: listGroupOrigin);
    }
    listGroupResult = listGroupOrigin
        .where(
          (e) => e.isContainGroupName(keywordGroupName: input.nameGroup ?? ''),
        )
        .toList();
    return SearchGroupOutput(listGroupResult: listGroupResult);
  }
}
