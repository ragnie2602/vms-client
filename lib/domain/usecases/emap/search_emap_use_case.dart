import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_input.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class SearchEmapUseCase extends SyncUseCase<SearchEmapInput, SearchEmapOutput> {
  @override
  SearchEmapOutput buildUseCase(SearchEmapInput input) {
    List<EmapEntity> listEmapOrigin = input.listEmapOrigin ?? [];
    List<EmapEntity> listEmapResult = listEmapOrigin;
    // nếu ko có dữ liệu search => return list cũ
    if ((input.keyword ?? '').isEmpty) {
      return SearchEmapOutput(listEmapResult: listEmapOrigin);
    }
    listEmapResult = listEmapOrigin
        .where(
          (e) => removeDiacritics((e.emapName ?? '').trim().toLowerCase())
              .contains(
                removeDiacritics((input.keyword ?? '').trim().toLowerCase()),
              ),
        )
        .toList();
    return SearchEmapOutput(listEmapResult: listEmapResult);
  }
}
