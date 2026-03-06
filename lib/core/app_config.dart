// ignore_for_file: non_constant_identifier_names, unnecessary_nullable_for_final_variable_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fvp/mdk.dart';
import 'package:ini/ini.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';

class AppConfig {
  AppConfig._();
  static late Config config;

  static String? _getConfig(String? section, String key) {
    try {
      return section != null ? config.get(section, key) : config.defaults()[key];
    } catch (e) {
      return null;
    }
  }

  static Future<void> loadConfigs() async {
    final file = File("config.ini");
    if (!file.existsSync()) {
      config = Config();
      return;
    }

    final lines = await file.readAsLines();
    config = Config.fromStrings(lines);
  }

  /* ======================== ini configs ======================== */
  static final LiveviewDetailAudioSource LIVEVIEW_DETAIL_AUDIO_SOURCE =
      LiveviewDetailAudioSource.fromConfig(
        _getConfig("Camera Detail", "livewiew_detail_audio_source"),
      );

  static final int MAXIMUM_SUB_WINDOWS = _getConfig("Window", "maximum_sub_windows") != null
      ? int.parse(_getConfig("Window", "maximum_sub_windows")!)
      : 3;

  /* ======================== default configs ======================== */
  static const INITIAL_ROUTE = Routes.splash;
  static const DEFAULT_THEME_MODE = ThemeMode.light;

  static const AUTO_LOGIN = false;

  /* File log */
  static const LOG_FILE_RETENTION_PERIOD = Duration(days: 3);
  static const LOG_FILE_MAX_TRACE_LINES = 31;
  static final INITIAL_HOME_TAB = HomeTab.tabs.first;

  /*  */
  static const SHOW_HOME_SIDEBAR = true;
  static const double APP_BAR_HEIGHT = 67;

  /* Log */
  static const LOG_ERROR_MAX_LINES = 10;

  /* MDK (FVP) */
  static const MDK_LOG_LEVEL = LogLevel.off; // off < error < warning < info < debug < all
  static const SHOW_MDK_LOG = false;
  static const MDK_DECODERS = ['auto'];

  /* [Player] Timeout khi khởi tạo player (VideoPlayerController) */
  static const PLAYER_INITIALIZATION_TIMEOUT = Duration(seconds: 45);
  static const PLAYER_DISCONNECTION_THRESHOLD = Duration(seconds: 45);
  static const SOCKET_CONNECTION_TIMEOUT = 60;

  static const double PLAYER_MAX_VOLUME_PERCENT = 300;

  static const RECORDING_MAX_DURATION = Duration(minutes: 5);

  /* Monitoring view */
  static const double MONITOR_GRID_SPACING = 4.0;
  static const int? OVERRIDE_MONITOR_GRID_ROWS = null; // = null;
  static const int? OVERRIDE_MONITOR_GRID_COLUMNS = null; // = null;

  // object group
  static const int OBJECT_GROUP_MAX_LEVEL = 5;
  static const String BASE_ICON_PATH = 'icons';
}

enum LiveviewDetailAudioSource {
  on,
  off;

  bool get isOn => this == on;
  bool get isOff => this == off;
  factory LiveviewDetailAudioSource.fromConfig(String? value) => value == null
      ? (Platform.isAndroid || Platform.isIOS
            ? LiveviewDetailAudioSource.on
            : LiveviewDetailAudioSource.off)
      : LiveviewDetailAudioSource.values.firstWhere(
          (e) => e.name == value,
          orElse: () => LiveviewDetailAudioSource.on,
        );
}
