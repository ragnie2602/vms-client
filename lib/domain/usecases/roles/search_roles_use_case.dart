import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/usecases/roles/search_roles_input.dart';
import 'package:vms_flutter_client/domain/usecases/roles/search_roles_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class SearchRolesUseCase extends SyncUseCase<SearchRolesInput, SearchRolesOutput> {
  @override
  SearchRolesOutput buildUseCase(SearchRolesInput input) {
    bool check(String? value, String? keyword) {
      if (keyword == null || keyword.isEmpty) return true;
      if (value == null) return false;

      return removeDiacritics(
        value.toLowerCase(),
      ).contains(removeDiacritics(keyword.toLowerCase()));
    }

    final roles = input.roles
        .where((role) => check(role.name, input.keyword) || check(role.description, input.keyword))
        .toList();

    return SearchRolesOutput(roles: roles);
  }
}
