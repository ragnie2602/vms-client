import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/usecases/ai_box/filter_ai_box_input.dart';
import 'package:vms_flutter_client/domain/usecases/ai_box/filter_ai_box_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class FilterAiBoxUseCase
    extends SyncUseCase<FilterAiBoxInput, FilterAiBoxOutput> {
  @override
  FilterAiBoxOutput buildUseCase(FilterAiBoxInput input) {
    List<AiBoxEntity> listAiBoxOrigin = input.listAiBoxOrigin ?? [];
    List<AiBoxEntity> listAiBoxAfterFilter = listAiBoxOrigin;

    // Nếu không có dữ liệu filter => return list gốc
    if (input.statusFilter == null && (input.keyword ?? '').isEmpty) {
      return FilterAiBoxOutput(listAiBox: listAiBoxOrigin);
    }

    // Lọc theo trạng thái (nếu không phải "all")
    if (input.statusFilter != null && input.statusFilter != AiBoxStatus.all) {
      listAiBoxAfterFilter = listAiBoxAfterFilter
          .where((e) => e.status == input.statusFilter!.value)
          .toList();
    }

    // Lọc theo keyword (tên thiết bị, model, IP/Port)
    if ((input.keyword ?? '').isNotEmpty) {
      String keyword = removeDiacritics(
        (input.keyword ?? '').trim().toLowerCase(),
      );
      listAiBoxAfterFilter = listAiBoxAfterFilter.where((item) {
        final nameMatch = removeDiacritics(
          item.name?.toLowerCase() ?? '',
        ).contains(keyword);
        final modelMatch = removeDiacritics(
          item.model?.toLowerCase() ?? '',
        ).contains(keyword);
        final ipMatch = (item.ip?.toLowerCase().contains(keyword) ?? false);
        final portMatch = (item.port?.toString().contains(keyword) ?? false);

        return nameMatch || modelMatch || ipMatch || portMatch;
      }).toList();
    }

    return FilterAiBoxOutput(listAiBox: listAiBoxAfterFilter);
  }
}
