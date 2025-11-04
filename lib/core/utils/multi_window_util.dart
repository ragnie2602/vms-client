import 'dart:convert';
import 'dart:ui';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';

class MultiWindowUtil {
  static Rect? getWindowRect(int windowId) {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';
    final dynamic rawData = AppData.instance.read(_frameKey);
    final List<String> frameSettings =
        (rawData as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];

    if (windowId < frameSettings.length) {
      final setting = jsonDecode(frameSettings[windowId].toString());
      return Rect.fromLTWH(setting['left'], setting['top'], setting['width'], setting['height']);
    } else {
      return null;
    }
  }

  static bool isMainWindow(int windowId) {
    return windowId == 0;
  }

  static Rect saveWindowRect(int windowId, Rect rect) {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';
    final dynamic rawData = AppData.instance.read(_frameKey);
    final List<String> frameSettings =
        (rawData as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];

    final setting = {
      'left': rect.left,
      'top': rect.top,
      'width': rect.width,
      'height': rect.height,
    };

    if (windowId < frameSettings.length) {
      frameSettings[windowId] = jsonEncode(setting);
    } else {
      frameSettings.add(jsonEncode(setting));
    }

    AppData.instance.save(_frameKey, frameSettings);

    return rect;
  }
}
