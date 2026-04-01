import 'package:vms_flutter_client/domain/entities/roles/permission.dart';

class PermissionGroup {
  String? groupName;
  List<Permission>? permissions;

  PermissionGroup({this.groupName, this.permissions});

  PermissionGroup.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    if (json['permissions'] != null) {
      permissions = <Permission>[];
      json['permissions'].forEach((v) {
        permissions!.add(Permission.fromJson(v));
      });
    }
  }

  PermissionGroup copyWith({String? groupName, List<Permission>? permissions}) {
    return PermissionGroup(
      groupName: groupName ?? this.groupName,
      permissions: permissions ?? this.permissions,
    );
  }

  @override
  String toString() => '''PermissionGroup(groupName: $groupName, permissions: $permissions)''';
}
