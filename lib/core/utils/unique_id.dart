class UniqueId {
  static int getUniqueId(int packageType) {
    return DateTime.now().microsecondsSinceEpoch + packageType;
  }
}