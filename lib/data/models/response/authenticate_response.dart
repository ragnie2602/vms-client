import 'package:flutter/foundation.dart';

import 'package:vms_flutter_client/core/constants/user_role.dart';

class AuthenticateResponse {
  final int id;
  final String accessToken;
  final String minClientVersion;
  final List<String> permissions;
  final List<UserRole> roles;
  final String sessionId;
  final String uid;
  final String websocketHost;
  final int websocketPort;
  final bool websocketTlsEnable;
  const AuthenticateResponse({
    required this.id,
    required this.accessToken,
    required this.minClientVersion,
    required this.permissions,
    required this.roles,
    required this.sessionId,
    required this.uid,
    required this.websocketHost,
    required this.websocketPort,
    required this.websocketTlsEnable,
  });

  AuthenticateResponse copyWith({
    int? id,
    String? accessToken,
    String? minClientVersion,
    List<String>? permissions,
    List<UserRole>? roles,
    String? sessionId,
    String? uid,
    String? websocketHost,
    int? websocketPort,
    bool? websocketTlsEnable,
  }) {
    return AuthenticateResponse(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      minClientVersion: minClientVersion ?? this.minClientVersion,
      permissions: permissions ?? this.permissions,
      roles: roles ?? this.roles,
      sessionId: sessionId ?? this.sessionId,
      uid: uid ?? this.uid,
      websocketHost: websocketHost ?? this.websocketHost,
      websocketPort: websocketPort ?? this.websocketPort,
      websocketTlsEnable: websocketTlsEnable ?? this.websocketTlsEnable,
    );
  }

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticateResponse(
      id: json['id'],
      accessToken: json['accessToken'],
      minClientVersion: json['minClientVersion'],
      permissions: List<String>.from(json['permissions']),
      roles: List<UserRole>.from(json['roles']?.map((x) => UserRole.values.firstWhere((role) => role.role == x))),
      sessionId: json['sessionId'],
      uid: json['uid'],
      websocketHost: json['websocketHost'],
      websocketPort: json['websocketPort'],
      websocketTlsEnable: json['websocketTlsEnable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accessToken': accessToken,
      'minClientVersion': minClientVersion,
      'permissions': permissions,
      'roles': roles.map((x) => x.role).toList(),
      'sessionId': sessionId,
      'uid': uid,
      'websocketHost': websocketHost,
      'websocketPort': websocketPort,
      'websocketTlsEnable': websocketTlsEnable,
    };
  }

  @override
  String toString() {
    return '''AuthenticateResponse(id: $id, accessToken: $accessToken, minClientVersion: $minClientVersion, permissions: $permissions, roles: $roles, sessionId: $sessionId, uid: $uid, websocketHost: $websocketHost, websocketPort: $websocketPort, websocketTlsEnable: $websocketTlsEnable)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthenticateResponse &&
      other.id == id &&
      other.accessToken == accessToken &&
      other.minClientVersion == minClientVersion &&
      listEquals(other.permissions, permissions) &&
      listEquals(other.roles, roles) &&
      other.sessionId == sessionId &&
      other.uid == uid &&
      other.websocketHost == websocketHost &&
      other.websocketPort == websocketPort &&
      other.websocketTlsEnable == websocketTlsEnable;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      accessToken.hashCode ^
      minClientVersion.hashCode ^
      permissions.hashCode ^
      roles.hashCode ^
      sessionId.hashCode ^
      uid.hashCode ^
      websocketHost.hashCode ^
      websocketPort.hashCode ^
      websocketTlsEnable.hashCode;
  }
}
