import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_input.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_output.dart';

class SearchUserUseCase extends SyncUseCase<SearchUserInput, SearchUserOutput> {
  @override
  SearchUserOutput buildUseCase(SearchUserInput input) {
    List<UserEntity> listUserOrigin = input.listUserOrigin ?? [];
    List<UserEntity> listUserResult = listUserOrigin;
    // nếu ko có dữ liệu search => return list cũ
    if ((input.nameUser ?? '').isEmpty) {
      return SearchUserOutput(listUserResult: listUserOrigin);
    }
    listUserResult = listUserOrigin
        .where(
          (e) => e.account.toLowerCase().trim().contains(
            input.nameUser?.toLowerCase().trim() ?? "",
          ),
        )
        .toList();
    return SearchUserOutput(listUserResult: listUserResult);
  }
}
