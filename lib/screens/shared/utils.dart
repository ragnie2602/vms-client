import 'dart:convert';

class Utils {
  // List
  static String decodeCameraId(List<int> cameraId) {
    String decodedCameraId = '';
    try {
      if (cameraId.isNotEmpty) {
        decodedCameraId = utf8.decode(cameraId);
      }
    } catch (e) {
      decodedCameraId = '';
    }
    return decodedCameraId;
  }

  static bool isEqual<T>(List<T> list1, List<T> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }
}
