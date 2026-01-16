import 'package:vms_flutter_client/domain/entities/user/user_status.dart';

class UserEntity {
  final int id;
  final String username;
  final UserStatus status;
  final String userType;
  final int tenantId;
  final String tenantName;
  final String fullname;
  final String? email;
  final String? phone;
  final String? description;
  final int? type;
  final List<String> permissions;

  const UserEntity({
    required this.id,
    required this.username,
    required this.status,
    required this.userType,
    required this.tenantId,
    required this.tenantName,
    required this.fullname,
    required this.email,
    required this.phone,
    this.description,
    this.type,
    required this.permissions,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      username: json['username'],
      status: UserStatus.fromValue(json['status']),
      userType: json['userType'],
      tenantId: json['tenantId'],
      tenantName: json['tenantName'],
      fullname: json['fullname'] ?? '',
      email: json['email'],
      phone: json['phone'],
      description: json['description'],
      type: json['type'],
      permissions: List<String>.from(json['permissions']),
    );
  }
}
