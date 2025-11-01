class MultiWindowUtil {
  static final Map<String, int> systemAndBusinessMapping = {'': 0};

  static int getSuitableBusinessID() {
    final ids = List.from(systemAndBusinessMapping.values)..sort();
    for (int i = 1; i < ids.length; i++) {
      if (ids[i] != i) return i;
    }
    return ids.length;
  }

  static bool isMainWindow(String businessWindowID) {
    return businessWindowID.startsWith('sub_window_') == false;
  }
}
