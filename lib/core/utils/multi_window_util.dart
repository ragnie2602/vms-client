import 'dart:convert';
import 'dart:ui';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';

class MultiWindowUtil {
  static final List<Rect?> _windowBounds = [];

  static Future<void> clearWindowSetting(int windowId) async {
    _windowBounds[windowId] = null;
  }

  static int getSubWindowCount() => _windowBounds.length - 1;

  static (int, Rect) getSuitableWindowSetting({int? suggestWindowID}) {
    if (suggestWindowID != null) {
      return (
        suggestWindowID,
        _windowBounds[suggestWindowID] =
            _windowBounds[suggestWindowID] ?? Rect.fromLTWH(10, 10, 1200, 675),
      );
    }

    for (var i = 0; i < _windowBounds.length; i++) {
      if (_windowBounds[i] == null) return (i, _windowBounds[i] = Rect.fromLTWH(10, 10, 1200, 675));
    }
    _windowBounds.add(Rect.fromLTWH(10, 10, 1200, 675));
    return (_windowBounds.length - 1, Rect.fromLTWH(10, 10, 1200, 675));
  }

  static void init() {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';

    final List<Rect> data =
        (AppData.instance.read(_frameKey) as List<dynamic>?)?.map((e) {
          final setting = jsonDecode(e.toString());

          return Rect.fromLTWH(
            setting['left'] ?? 10,
            setting['top'] ?? 10,
            setting['width'] ?? 1200,
            setting['height'] ?? 675,
          );
        }).toList() ??
        [];
    _windowBounds.clear();
    _windowBounds.addAll(data);
  }

  static bool isMainWindow(int windowId) => windowId == 0;

  static Future<void> save() async {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';

    await AppData.instance.save(
      _frameKey,
      _windowBounds
          .where((e) => e != null)
          .map(
            (e) =>
                jsonEncode({'left': e!.left, 'top': e.top, 'width': e.width, 'height': e.height}),
          )
          .toList(),
    );
  }

  static Future<Rect> saveWindowRect(int windowId, Rect rect) async {
    return _windowBounds[windowId] = rect;
  }
}
