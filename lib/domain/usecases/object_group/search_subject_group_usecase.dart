import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/base_use_case.dart';

class SearchSubjectGroupInput extends BaseInput {
  final List<SubjectGroup> allGroups;
  final String query;

  SearchSubjectGroupInput({required this.allGroups, required this.query});
}

class SearchSubjectGroupOutput extends BaseOutput {
  final List<SubjectGroup> filteredGroups;

  SearchSubjectGroupOutput(this.filteredGroups);
}

class SearchSubjectGroupUsecase
    extends BaseUseCase<SearchSubjectGroupInput, SearchSubjectGroupOutput> {
  const SearchSubjectGroupUsecase();

  @override
  SearchSubjectGroupOutput buildUseCase(SearchSubjectGroupInput input) {
    final query = removeDiacritics(input.query.trim().toLowerCase());

    if (query.isEmpty) {
      return SearchSubjectGroupOutput(input.allGroups);
    }
    final matched = input.allGroups.where((g) {
      return removeDiacritics(
        (g.name ?? '').trim().toLowerCase(),
      ).contains(query);
    }).toList();

    final matchedIds = matched.map((g) => g.id).toSet();
    final Set<int?> ancestorIds = {};
    for (final g in matched) {
      int? pid = g.parentId;
      while (pid != null && pid != 0) {
        ancestorIds.add(pid);
        final parent = input.allGroups.firstWhere(
          (sg) => sg.id == pid,
          orElse: () => const SubjectGroup(id: 0, parentId: 0),
        );
        pid = parent.parentId == 0 ? null : parent.parentId;
      }
    }

    final filtered = input.allGroups
        .where((g) => matchedIds.contains(g.id) || ancestorIds.contains(g.id))
        .toList();

    return SearchSubjectGroupOutput(filtered);
  }
}
