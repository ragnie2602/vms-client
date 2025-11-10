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
}
