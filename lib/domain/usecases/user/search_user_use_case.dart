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

    final searchQuery = input.nameUser?.toLowerCase().trim() ?? "";

    listUserResult = listUserOrigin
        .where(
          (e) =>
              // Tìm kiếm theo tài khoản
              e.username.toLowerCase().trim().contains(searchQuery) ||
              // Tìm kiếm theo họ tên
              e.fullname.toLowerCase().trim().contains(searchQuery) ||
              // Tìm kiếm theo số điện thoại
              (e.phone != null && e.phone!.toLowerCase().trim().contains(searchQuery)) ||
              // Tìm kiếm theo email
              (e.email != null && e.email!.toLowerCase().trim().contains(searchQuery)),
        )
        .toList();
    return SearchUserOutput(listUserResult: listUserResult);
  }
}
