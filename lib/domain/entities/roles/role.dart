import 'dart:ui';

import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission.dart';

class Role {
  int? id;
  String? name;
  String? description;
  RoleStatus? status;
  int? tenantId;
  List<Permissions>? permissions;

  Role({this.id, this.name, this.description, this.status, this.tenantId, this.permissions});

  Role copyWith({
    int? id,
    String? name,
    String? description,
    RoleStatus? status,
    int? tenantId,
    List<Permissions>? permissions,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      tenantId: tenantId ?? this.tenantId,
      permissions: permissions ?? this.permissions,
    );
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: RoleStatus.values.firstWhere((x) => x.name == json['status']),
      tenantId: json['tenantId'],
      permissions: List<Permissions>.from(json['permissions']?.map((x) => Permissions.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tenantId': tenantId,
      'permissions': permissions?.map((x) => x.toJson()).toList(),
    };
  }
}

enum RoleStatus {
  active('Hoạt động', AppColors.greenECFFD7, AppColors.green03BF00),
  inactive('Ngừng hoạt động', AppColors.greyF8F9FE, AppColors.grey6F767E),
  suspended('Tạm dừng', AppColors.greyF8F9FE, AppColors.grey6F767E),
  locked('Khóa', AppColors.greyF8F9FE, AppColors.grey6F767E);

  final String label;
  final Color bgColor;
  final Color textColor;

  const RoleStatus(this.label, this.bgColor, this.textColor);
}
