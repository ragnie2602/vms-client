// ignore_for_file: library_private_types_in_public_api

import 'package:vms_flutter_client/core/constants/role_status.dart';

class Role {
  int? id;
  String? name;
  RoleStatus? status;
  String? description;
  bool? isAdmin;
  SystemPermissions? systemPermissions;
  CameraPermissions? cameraPermissions;
  SubjectPermissions? subjectPermissions;

  Role({
    this.id,
    this.name,
    this.status,
    this.description,
    this.isAdmin,
    this.systemPermissions,
    this.cameraPermissions,
    this.subjectPermissions,
  });

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = RoleStatus.fromString(json['status']);
    description = json['description'];
    isAdmin = json['isAdmin'];
    systemPermissions = json['systemPermissions'] != null
        ? SystemPermissions.fromJson(json['systemPermissions'])
        : null;
    cameraPermissions = json['cameraPermissions'] != null
        ? CameraPermissions.fromJson(json['cameraPermissions'])
        : null;
    subjectPermissions = json['subjectPermissions'] != null
        ? SubjectPermissions.fromJson(json['subjectPermissions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = (status ?? RoleStatus.active).name.toUpperCase();
    return data;
  }
}

class SystemPermissions {
  List<String>? actions;

  SystemPermissions({this.actions});

  SystemPermissions.fromJson(Map<String, dynamic> json) {
    actions = json['actions'] != null
        ? (json['actions'] as List).map((e) => e.toString()).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['actions'] = actions;
    return data;
  }
}

class CameraPermissions extends SystemPermissions {
  List<String>? allowedCameraGroupUuids;

  CameraPermissions({super.actions, this.allowedCameraGroupUuids});

  CameraPermissions.fromJson(Map<String, dynamic> json) {
    actions = json['actions'] != null
        ? (json['actions'] as List).map((e) => e.toString()).toList()
        : null;

    allowedCameraGroupUuids = json['allowedCameraGroupUuids'] != null
        ? (json['allowedCameraGroupUuids'] as List).map((e) => e.toString()).toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['actions'] = actions;
    data['allowedCameraGroupUuids'] = allowedCameraGroupUuids;
    return data;
  }
}

class SubjectPermissions extends SystemPermissions {
  List<int>? allowedSubjectGroupIds;

  SubjectPermissions({super.actions, this.allowedSubjectGroupIds});

  SubjectPermissions.fromJson(Map<String, dynamic> json) {
    actions = json['actions'] != null
        ? (json['actions'] as List).map((e) => e.toString()).toList()
        : null;
    allowedSubjectGroupIds = json['allowedSubjectGroupIds'] != null
        ? (json['allowedSubjectGroupIds'] as List).map((e) => e as int).toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['allowedSubjectGroupIds'] = allowedSubjectGroupIds;
    return data;
  }
}
