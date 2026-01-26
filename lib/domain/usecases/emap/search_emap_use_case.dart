import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_input.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class SearchEmapUseCase extends SyncUseCase<SearchEmapInput, SearchEmapOutput> {
  @override
  SearchEmapOutput buildUseCase(SearchEmapInput input) {
    final result = input.listEmapOrigin
        .where(
          (e) => removeDiacritics(
            (e.name).trim().toLowerCase(),
          ).contains(removeDiacritics((input.keyword ?? '').trim().toLowerCase())),
        )
        .toList();
    return SearchEmapOutput(listEmapResult: result);
  }
}
