import 'package:vms_flutter_client/domain/entities/user/user_type.dart';

class MyProfile {
  final int id;
  final String avatar;
  final String displayName;
  final String account;
  final String uid;
  final String sessionId;
  final String email;
  final String tel;
  final String host;
  final int port;
  final List<String> permissions;
  final UserType userType;

  MyProfile({
    required this.id,
    required this.avatar,
    required this.displayName,
    required this.account,
    required this.uid,
    required this.sessionId,
    required this.email,
    required this.tel,
    required this.host,
    required this.port,
    required this.permissions,
    required this.userType,
  });

  MyProfile copyWith({
    int? id,
    String? avatar,
    String? displayName,
    String? account,
    bool? addCamDenied,
    bool? changePassDenied,
    String? uid,
    String? sessionId,
    String? email,
    String? tel,
    String? host,
    int? port,
    String? ssid,
    List<String>? permissions,
    UserType? userType,
  }) {
    return MyProfile(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      displayName: displayName ?? this.displayName,
      account: account ?? this.account,
      uid: uid ?? this.uid,
      sessionId: sessionId ?? this.sessionId,
      email: email ?? this.email,
      tel: tel ?? this.tel,
      host: host ?? this.host,
      port: port ?? this.port,
      permissions: permissions ?? this.permissions,
      userType: userType ?? this.userType,
    );
  }

  static MyProfile fromJson(Map<dynamic, dynamic> json) {
    return MyProfile(
      id: json['id'],
      avatar: json['avatar'],
      displayName: json['displayName'],
      account: json['account'],
      uid: json['uid'],
      sessionId: json['sessionId'],
      email: json['email'],
      tel: json['tel'],
      host: json['host'],
      port: json['port'],
      permissions: json['permissions'] == null
          ? []
          : List.from(json['permissions']).map((e) => e.toString()).toList(),
      userType: UserType.fromValue(json['userType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar,
      'displayName': displayName,
      'account': account,
      'uid': uid,
      'sessionId': sessionId,
      'email': email,
      'tel': tel,
      'host': host,
      'port': port,
      'userType': userType.value,
    };
  }

  String displayNameLimited({int maxChars = 50, String ellipsis = '...'}) {
    if (maxChars <= 0) return '';
    if (displayName.length <= maxChars) return displayName;
    final contentMax = maxChars - ellipsis.length;
    if (contentMax <= 0) return displayName.substring(0, maxChars);
    return displayName.substring(0, contentMax) + ellipsis;
  }

  bool get canAddCamera => permissions.contains('camera.create');
  bool get canChangePassword => permissions.contains('auth.change-password');

  String get displayNamePreview => displayNameLimited(maxChars: 50);
}
