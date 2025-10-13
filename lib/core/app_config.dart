// ignore_for_file: non_constant_identifier_names, unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/app_router.dart';

class AppConfig {
  const AppConfig._();

  static const INITIAL_ROUTE = Routes.login;
  static const DEFAULT_THEME_MODE = ThemeMode.light;

  /* File log */
  static const LOG_FILE_RETENTION_PERIOD = Duration(days: 3);
  static const LOG_FILE_MAX_TRACE_LINES = 31;

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
  static const PLAYER_INITIALIZATION_TIMEOUT = Duration(seconds: 60);
  static const PLAYER_DISCONNECTION_THRESHOLD = Duration(seconds: 20);
  static const SOCKET_CONNECTION_TIMEOUT = 60;

  /* Monitoring view */
  static const double MONITOR_GRID_SPACING = 10.0;
  static const int? OVERRIDE_MONITOR_GRID_ROWS = null; // = null;
  static const int? OVERRIDE_MONITOR_GRID_COLUMNS = null; // = null;
}
