class AuthenticateResponse {
  final int id;
  final String accessToken;
  final String minClientVersion;
  final List<String> permissions;
  final String sessionId;
  final String uid;
  final String websocketHost;
  final int websocketPort;
  final bool websocketTlsEnable;
  final String phone;
  final String email;
  final String fullname;

  const AuthenticateResponse({
    required this.id,
    required this.accessToken,
    required this.minClientVersion,
    required this.permissions,
    required this.sessionId,
    required this.uid,
    required this.websocketHost,
    required this.websocketPort,
    required this.websocketTlsEnable,
    required this.phone,
    required this.email,
    required this.fullname,
  });

  AuthenticateResponse copyWith({
    int? id,
    String? accessToken,
    String? minClientVersion,
    List<String>? permissions,
    String? sessionId,
    String? uid,
    String? websocketHost,
    int? websocketPort,
    bool? websocketTlsEnable,
    String? phone,
    String? email,
    String? fullname,
  }) {
    return AuthenticateResponse(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      minClientVersion: minClientVersion ?? this.minClientVersion,
      permissions: permissions ?? this.permissions,
      sessionId: sessionId ?? this.sessionId,
      uid: uid ?? this.uid,
      websocketHost: websocketHost ?? this.websocketHost,
      websocketPort: websocketPort ?? this.websocketPort,
      websocketTlsEnable: websocketTlsEnable ?? this.websocketTlsEnable,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
    );
  }

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticateResponse(
      id: json['id'],
      accessToken: json['accessToken'],
      minClientVersion: json['minClientVersion'],
      permissions: List<String>.from(json['permissions']),
      sessionId: json['sessionId'],
      uid: json['uid'],
      websocketHost: json['websocketHost'],
      websocketPort: json['websocketPort'],
      websocketTlsEnable: json['websocketTlsEnable'],
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      fullname: json['fullname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accessToken': accessToken,
      'minClientVersion': minClientVersion,
      'permissions': permissions,
      'sessionId': sessionId,
      'uid': uid,
      'websocketHost': websocketHost,
      'websocketPort': websocketPort,
      'websocketTlsEnable': websocketTlsEnable,
      'phone': phone,
      'email': email,
      'fullname': fullname,
    };
  }
}
