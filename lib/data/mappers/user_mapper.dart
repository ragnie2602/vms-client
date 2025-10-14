import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/user/user.dart';

extension UserMapper on pb.User {
  User toDomain() {
    return User(id: telNumber, email: emailAddress, name: fullName, token:password);
  }
}
