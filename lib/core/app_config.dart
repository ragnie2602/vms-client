// ignore_for_file: non_constant_identifier_names

import 'package:vms_flutter_client/core/app_router.dart';

class AppConfig {
  const AppConfig._();

  static const INITIAL_ROUTE = Routes.login;

  /* File log */
  static const LOG_FILE_RETENTION_PERIOD = Duration(days: 3);
  static const LOG_FILE_MAX_TRACE_LINES = 16;

  /// Log
  static const LOG_ERROR_MAX_LINES = 10;

  /// Hiển thị log từ MDK (FVP)
  static bool SHOW_MDK_LOG = false;

  /// [Player] Timeout khi khởi tạo player (VideoPlayerController)
  static const PLAYER_INITIALIZATION_TIMEOUT = Duration(seconds: 60);
  static const PLAYER_DISCONNECTION_THRESHOLD = Duration(seconds: 10);
  static const SOCKET_CONNECTION_TIMEOUT = 60;
}
