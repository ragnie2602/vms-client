import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/entities/user/user_status.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required UserStatus status,
    required String userType,
    required String createAt,
    required String lastUpdate,
    required String desc,
    required String fullname,
    required String phone,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
