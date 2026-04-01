import 'package:vms_flutter_client/domain/entities/roles/permission_group.dart';

class PermissionTree {
  List<PermissionGroup>? systemPermissions;
  List<PermissionGroup>? cameraPermissions;
  List<PermissionGroup>? subjectPermissions;

  PermissionTree({this.systemPermissions, this.cameraPermissions, this.subjectPermissions});

  PermissionTree.fromJson(Map<String, dynamic> json) {
    if (json['systemPermissions'] != null) {
      systemPermissions = <PermissionGroup>[];
      json['systemPermissions'].forEach((v) {
        systemPermissions!.add(PermissionGroup.fromJson(v));
      });
    }
    if (json['cameraPermissions'] != null) {
      cameraPermissions = <PermissionGroup>[];
      json['cameraPermissions'].forEach((v) {
        cameraPermissions!.add(PermissionGroup.fromJson(v));
      });
    }
    if (json['subjectPermissions'] != null) {
      subjectPermissions = <PermissionGroup>[];
      json['subjectPermissions'].forEach((v) {
        subjectPermissions!.add(PermissionGroup.fromJson(v));
      });
    }
  }

  PermissionTree copyWith({
    List<PermissionGroup>? systemPermissions,
    List<PermissionGroup>? cameraPermissions,
    List<PermissionGroup>? subjectPermissions,
  }) {
    return PermissionTree(
      systemPermissions: systemPermissions ?? this.systemPermissions,
      cameraPermissions: cameraPermissions ?? this.cameraPermissions,
      subjectPermissions: subjectPermissions ?? this.subjectPermissions,
    );
  }

  @override
  String toString() =>
      '''PermissionTree(systemPermissions: $systemPermissions, cameraPermissions: $cameraPermissions, subjectPermissions: $subjectPermissions)''';
}
