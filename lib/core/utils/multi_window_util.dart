import 'dart:convert';
import 'dart:ui';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';

class MultiWindowUtil {
  static final List<_WindowSetting?> _windowBounds = [];

  static void clearWindowSetting(int windowId) {
    if (windowId < _windowBounds.length) _windowBounds[windowId] = null;
  }

  static int getSubWindowCount() => _windowBounds.length - 1;

  static (int, _WindowSetting) getSuitableWindowSetting({int? suggestWindowID}) {
    // Specify business window ID
    if (suggestWindowID != null) {
      return (
        suggestWindowID,
        _windowBounds[suggestWindowID] =
            _windowBounds[suggestWindowID] ??
            _WindowSetting(
              rect: Rect.fromLTWH(10, 10, 1200, 675),
              isDefaultMode: true,
              viewMode: ViewMode.v1x1,
              id: [],
            ),
      );
    }

    // Found empty business window slot
    for (var i = 0; i < _windowBounds.length; i++) {
      if (_windowBounds[i] == null) {
        return (
          i,
          _windowBounds[i] = _WindowSetting(
            rect: Rect.fromLTWH(10, 10, 1200, 675),
            isDefaultMode: true,
            viewMode: ViewMode.v2x2,
            id: [],
          ),
        );
      }
    }

    // Add new slot
    final _settings = _WindowSetting(
      rect: Rect.fromLTWH(10, 10, 1200, 675),
      isDefaultMode: true,
      viewMode: ViewMode.v2x2,
      id: [],
    );
    _windowBounds.add(_settings);
    return (_windowBounds.length - 1, _settings);
  }

  static bool hasClosedAll() => _windowBounds.every((e) => e == null);

  static void init() {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';

    final List<_WindowSetting> data =
        (AppData.instance.read(_frameKey) as List<dynamic>?)?.map((e) {
          return _WindowSetting.fromJson(jsonDecode(e.toString()));
        }).toList() ??
        [];

    _windowBounds.clear();
    _windowBounds.addAll(data);

    if (_windowBounds.isEmpty) {
      _windowBounds.add(
        _WindowSetting(
          rect: Rect.fromLTWH(10, 10, 1200, 675),
          isDefaultMode: true,
          viewMode: ViewMode.v2x2,
          id: [],
        ),
      );
    }
  }

  static bool isMainWindow(int windowId) => windowId == 0;

  static Future<void> saveWindowSetting(
    int windowId, {
    Rect? rect,
    int? vmValue,
    bool? isDefaultMode,
    List<int>? id,
  }) async {
    _windowBounds[windowId] = _windowBounds[windowId]?.copyWith(
      id: id,
      isDefaultMode: isDefaultMode,
      rect: rect,
      viewMode: vmValue != null ? ViewMode.fromValue(vmValue) : null,
    );

    await save();
  }

  static Future save() async {
    final _frameKey =
        '${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}';
    await AppData.instance.save(
      _frameKey,
      _windowBounds.where((e) => e != null).map((e) => jsonEncode(e!.toJson())).toList(),
    );
  }
}

class _WindowSetting {
  final Rect rect;
  final bool isDefaultMode;
  final ViewMode viewMode;
  final List<int> id;

  _WindowSetting({
    required this.rect,
    required this.isDefaultMode,
    required this.viewMode,
    required this.id,
  });

  _WindowSetting copyWith({Rect? rect, bool? isDefaultMode, ViewMode? viewMode, List<int>? id}) {
    return _WindowSetting(
      rect: rect ?? this.rect,
      isDefaultMode: isDefaultMode ?? this.isDefaultMode,
      viewMode: viewMode ?? this.viewMode,
      id: id ?? this.id,
    );
  }

  factory _WindowSetting.fromJson(Map<String, dynamic> json) {
    final rect = Rect.fromLTWH(
      json['left'] ?? 10,
      json['top'] ?? 10,
      json['width'] ?? 1200,
      json['height'] ?? 675,
    );
    final viewMode = ViewMode.fromValue(json['view'] ?? 1);

    final isCustomMode = json['custom'] != null;

    final String idStr = isCustomMode ? json['custom'] ?? '' : json['default'] ?? '';
    final id = idStr.isNotEmpty ? idStr.codeUnits : <int>[];

    return _WindowSetting(rect: rect, isDefaultMode: !isCustomMode, viewMode: viewMode, id: id);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'left': rect.left,
      'top': rect.top,
      'width': rect.width,
      'height': rect.height,
      'view': viewMode.value,
    };

    if (isDefaultMode) {
      data['default'] = String.fromCharCodes(id);
    } else {
      data['custom'] = String.fromCharCodes(id);
    }

    return data;
  }
}
