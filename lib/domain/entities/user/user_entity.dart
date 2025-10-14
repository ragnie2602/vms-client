import 'dart:ffi';

import 'package:vms_flutter_client/domain/entities/user/user_status.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';

class UserEntity {
  final String account;
  final String emailAddress;
  final String telNumber;
  final String password;
  final UserStatus status;

  final UserType type;

  final String desc;
  final String fullName;
  final List<int> id;
  final bool changePassDenied;
  final bool addCamDenied;
  final int msgUnreadCount;
  UserEntity({
    required this.account,
    required this.emailAddress,
    required this.telNumber,
    required this.password,
    required this.status,
    required this.type,
    required this.desc,
    required this.fullName,
    required this.id,
    required this.changePassDenied,
    required this.addCamDenied,
    required this.msgUnreadCount,
  });
}
