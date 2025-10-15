import 'dart:developer';

import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/entities/user/user_status.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';

extension UserMapper on pb.User {
  UserEntity toDomain() {
    return UserEntity(
      account: account,
      emailAddress: emailAddress,
      telNumber: telNumber,
      password: password,
      fullName: fullName,
      desc: desc,
      addCamDenied: addCamDenied,
      changePassDenied: changePassDenied,
      msgUnreadCount: msgUnreadCount,
      type: type.toDomain(),
      status: status.toDomain(),
      id: id,
    );
  }
}

extension UserTypeMapper on pb.User_Type {
  UserType toDomain() {
    return UserType.fromValue(value);
  }
}

extension UserStatusMapper on pb.User_Status {
  UserStatus toDomain() {
    return UserStatus.fromValue(value);
  }
}
