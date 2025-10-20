import 'dart:convert';

class Utils {
  static String decodeCameraId(List<int> cameraId) {
    String decodedCameraId = '';
    try {
      if (cameraId.isNotEmpty) {
        decodedCameraId = utf8.decode(cameraId, allowMalformed: true);
      }
    } catch (e) {
      decodedCameraId = '';
    }
    return decodedCameraId;
  }
}
