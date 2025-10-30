class MyProfile {
  final String avatar;
  final String displayName;
  final bool addCamDenied;
  final bool changePassDenied;
  final List<int> uid;
  final List<int> sessionId;

  MyProfile({
    required this.avatar,
    required this.displayName,
    required this.addCamDenied,
    required this.changePassDenied,
    required this.uid,
    required this.sessionId,
  });
}
