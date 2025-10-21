import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_user_input.freezed.dart';

@freezed
class SearchUserInput extends BaseInput with _$SearchUserInput {
  const factory SearchUserInput({
    String? nameUser,
    List<UserEntity>? listUserOrigin,
  }) = _SearchUserInput;
}
