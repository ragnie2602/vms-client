import 'package:vms_flutter_client/core/constants/user_status.dart';

class UserEntity {
  int? id;
  String? username;
  String? password;
  UserStatus? status;
  String? userType;
  int? tenantId;
  String? tenantName;
  String? fullname;
  String? email;
  String? phone;
  String? description;
  int? type;
  int? roleId;
  String? roleName;
  int? dataType;

  UserEntity({
    this.id,
    this.username,
    this.password,
    this.status,
    this.userType,
    this.tenantId,
    this.tenantName,
    this.fullname,
    this.email,
    this.phone,
    this.description,
    this.type,
    this.roleId,
    this.roleName,
    this.dataType,
  });

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    status = UserStatus.fromValue(json['status']);
    userType = json['userType'];
    tenantId = json['tenantId'];
    tenantName = json['tenantName'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    description = json['description'];
    type = json['type'];
    roleId = json['roleId'];
    roleName = json['roleName'];
    dataType = json['dataType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['status'] = status;
    data['userType'] = userType;
    data['tenantId'] = tenantId;
    data['tenantName'] = tenantName;
    data['fullname'] = fullname;
    data['email'] = email;
    data['phone'] = phone;
    data['description'] = description;
    data['type'] = type;
    data['roleId'] = roleId;
    data['dataType'] = dataType;
    return data;
  }
}
