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

  /* ======================== default configs ======================== */
  static const INITIAL_ROUTE = Routes.login;
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
  static const MDK_DECODERS = ['D3D11', 'DXVA', 'MFT:d3d=11', 'CUDA', 'FFmpeg'];

  /* [Player] Timeout khi khởi tạo player (VideoPlayerController) */
  static const PLAYER_INITIALIZATION_TIMEOUT = Duration(seconds: 30);
  static const PLAYER_DISCONNECTION_THRESHOLD = Duration(seconds: 30);
  static const SOCKET_CONNECTION_TIMEOUT = 60;

  /* Monitoring view */
  static const double MONITOR_GRID_SPACING = 4.0;
  static const int? OVERRIDE_MONITOR_GRID_ROWS = null; // = null;
  static const int? OVERRIDE_MONITOR_GRID_COLUMNS = null; // = null;
}

enum LiveviewDetailAudioSource {
  on,
  off,
  split;

  bool get isOn => this == on;
  bool get isOff => this == off;
  bool get isSplit => this == split;
  factory LiveviewDetailAudioSource.fromConfig(String? value) => value == null
      ? LiveviewDetailAudioSource.off
      : LiveviewDetailAudioSource.values.firstWhere(
          (e) => e.name == value,
          orElse: () => LiveviewDetailAudioSource.on,
        );
}
