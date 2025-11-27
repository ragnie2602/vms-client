import 'package:vms_flutter_client/domain/entities/user/user_type.dart';

class MyProfile {
  final String avatar;
  final String displayName;
  final String account;
  final bool addCamDenied;
  final bool changePassDenied;
  final List<int> uid;
  final List<int> sessionId;
  final String email;
  final String tel;
  final String host;
  final int port;
  final String ssid;
  final UserType userType;

  MyProfile({
    required this.avatar,
    required this.displayName,
    required this.account,
    required this.addCamDenied,
    required this.changePassDenied,
    required this.uid,
    required this.sessionId,
    required this.email,
    required this.tel,
    required this.host,
    required this.port,
    required this.ssid,
    required this.userType,
  });

  MyProfile copyWith({
    String? avatar,
    String? displayName,
    String? account,
    bool? addCamDenied,
    bool? changePassDenied,
    List<int>? uid,
    List<int>? sessionId,
    String? email,
    String? tel,
    String? host,
    int? port,
    String? ssid,
    UserType? userType,
  }) {
    return MyProfile(
      avatar: avatar ?? this.avatar,
      displayName: displayName ?? this.displayName,
      account: account ?? this.account,
      addCamDenied: addCamDenied ?? this.addCamDenied,
      changePassDenied: changePassDenied ?? this.changePassDenied,
      uid: uid ?? this.uid,
      sessionId: sessionId ?? this.sessionId,
      email: email ?? this.email,
      tel: tel ?? this.tel,
      host: host ?? this.host,
      port: port ?? this.port,
      ssid: ssid ?? this.ssid,
      userType: userType ?? this.userType,
    );
  }

  static MyProfile fromJson(Map<dynamic, dynamic> json) {
    return MyProfile(
      avatar: json['avatar'],
      displayName: json['displayName'],
      account: json['account'],
      addCamDenied: json['addCamDenied'],
      changePassDenied: json['changePassDenied'],
      uid: List<int>.from(json['uid']),
      sessionId: List<int>.from(json['sessionId']),
      email: json['email'],
      tel: json['tel'],
      host: json['host'],
      port: json['port'],
      ssid: json['ssid'],
      userType: UserType.fromValue(json['userType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'displayName': displayName,
      'account': account,
      'addCamDenied': addCamDenied,
      'changePassDenied': changePassDenied,
      'uid': uid,
      'sessionId': sessionId,
      'email': email,
      'tel': tel,
      'host': host,
      'port': port,
      'ssid': ssid,
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

  String get displayNamePreview => displayNameLimited(maxChars: 50);
}
