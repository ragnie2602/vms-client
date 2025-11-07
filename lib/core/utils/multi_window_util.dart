import 'dart:convert';
import 'dart:ui';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';

class MultiWindowUtil {
  static (String, List<String>) _getFrameSettings() {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';
    final dynamic rawData = AppData.instance.read(_frameKey);
    final List<String> frameSettings =
        (rawData as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];

    return (_frameKey, frameSettings);
  }

  static Future<void> clearWindowSetting(int windowId) async {
    final frameSettings = _getFrameSettings();

    frameSettings.$2[windowId] = jsonEncode({});
    await AppData.instance.save(frameSettings.$1, frameSettings.$2);
  }

  static Rect? getWindowRect(int windowId) {
    final frameSettings = _getFrameSettings();

    if (windowId < frameSettings.$2.length) {
      final setting = jsonDecode(frameSettings.$2[windowId].toString());
      return Rect.fromLTWH(setting['left'], setting['top'], setting['width'], setting['height']);
    } else {
      return null;
    }
  }

  static int getSubWindowCount() {
    final frameSettings = _getFrameSettings();
    return frameSettings.$2.length - 1;
  }

  static bool isMainWindow(int windowId) => windowId == 0;

  static Future<Rect> saveWindowRect(int windowId, Rect rect) async {
    final frameSettings = _getFrameSettings();

    final setting = {
      'left': rect.left,
      'top': rect.top,
      'width': rect.width,
      'height': rect.height,
    };

    if (windowId < frameSettings.$2.length) {
      frameSettings.$2[windowId] = jsonEncode(setting);
    } else {
      frameSettings.$2.add(jsonEncode(setting));
    }

    await AppData.instance.save(frameSettings.$1, frameSettings.$2);

    return rect;
  }

  static Future<void> windowSettingSweeper() async {
    final frameSettings = _getFrameSettings();

    final emptySetting = jsonEncode({});
    frameSettings.$2.removeWhere((element) => element == emptySetting);

    await AppData.instance.save(frameSettings.$1, frameSettings.$2);
  }
}
