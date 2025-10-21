// ignore: unused_import
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
part 'search_user_output.freezed.dart';

@freezed
@freezed
class SearchUserOutput extends BaseOutput with _$SearchUserOutput {
  const factory SearchUserOutput({List<UserEntity>? listUserResult}) =
      _SearchUserOutput;
}
