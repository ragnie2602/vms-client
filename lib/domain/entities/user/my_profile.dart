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

  MyProfile({
    required this.avatar,
    required this.displayName,
    required this.account,
    required this.addCamDenied,
    required this.changePassDenied,
    required this.uid,
    required this.sessionId,
    required this.email,
    required this.tel
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
    );
  }
}
