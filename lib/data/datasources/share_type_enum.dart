enum ShareType {
  camera(0),
  groupCamera(1);

  final int value;

  const ShareType(this.value);
}

extension ShareTypeExtension on ShareType {
  static int getShareTypeValue(ShareType shareType) {
    return shareType.value;
  }
}
