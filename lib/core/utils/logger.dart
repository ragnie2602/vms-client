import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fvp/mdk.dart';

import '../app_config.dart';
import '../error_service.dart';

class Logger {
  Logger._();

  static void log(String message, {String tag = 'VMS'}) {
    if (kReleaseMode) return;

    final colorTag = _wrapWithColor('info', '[$tag]', needBackground: true);
    stdout.writeln("$colorTag ${_wrapWithColor('info', message)}");
  }

  static void warn(String message, {String tag = 'VMS'}) {
    if (kReleaseMode) return;

    final colorTag = _wrapWithColor('warn', '[$tag]', needBackground: true);
    stdout.writeln("$colorTag ${_wrapWithColor('warn', message)}");
  }

  static void onMdkLog(LogLevel level, String message) {
    if (!AppConfig.SHOW_MDK_LOG) return;

    final colorTag = _wrapWithColor(
      'trace',
      '[MDK:::${level.name.toUpperCase()}]',
      needBackground: true,
    );
    stdout.writeln("$colorTag ${_wrapWithColor('trace', message)}");
  }

  static void error(Object? error, {String tag = 'VMS', bool writeLog = false}) {
    if (kReleaseMode) return;

    String message = _wrapWithColor('error', stringifyObject(error));

    var traces = StackTrace.current
        .toString()
        .trim()
        .split('\n')
        .skip(1)
        .take(AppConfig.LOG_ERROR_MAX_LINES)
        .toList();

    final callerName = traces[0]
        .replaceFirst(RegExp(r'#\d+\s+'), '')
        .replaceFirst(RegExp(r'\s*\(.*\)'), '')
        .replaceAll(".<anonymous closure>", "");
    message = "${_wrapWithColor('error', '[ERROR:$callerName]', needBackground: true)} $message";

    traces = <String>[
      '═╡ Traceback ╞═════════════════════════════════════════════════════════════════════════════════════',
      ...traces,
      '════════════════════════════════════════════════════════════════════════════════════════════════════',
    ];
    final traceStr = traces.map((line) => "\x1B[2m$line$_reset").join('\n');

    stdout.writeln("$message\n$traceStr\n");

    if (writeLog && error != null) {
      ErrorService.record('APP LOG', error, StackTrace.current, level: 'ERROR');
    }
  }

  static final Map<String, Map<String, String>> _colors = {
    'warn': {'bg': '\x1B[43m', 'fg': '\x1B[30m', 'color': '\x1B[33m'},
    'error': {'bg': '\x1B[41m', 'fg': '\x1B[37m', 'color': '\x1B[91m'},
    'info': {'bg': '\x1B[42m', 'fg': '\x1B[37m', 'color': '\x1B[32m'},
    'debug': {'bg': '\x1B[44m', 'fg': '\x1B[37m', 'color': '\x1B[34m'},
    'trace': {'bg': '\x1B[46m', 'fg': '\x1B[37m', 'color': '\x1B[36m'},
    'critical': {'bg': '\x1B[45m', 'fg': '\x1B[37m', 'color': '\x1B[38;5;199m'},
    'fatal': {'bg': '\x1B[101m', 'fg': '\x1B[37m', 'color': '\x1B[35m'},
    'style': {
      'bold': '\x1B[1m',
      'italic': '\x1B[3m',
      'underline': '\x1B[4m',
      'strikethrough': '\x1B[9m',
    },
  };
  static final String _reset = '\x1B[0m';

  static String _wrapWithColor(String type, String message, {bool needBackground = false}) {
    final colors = _colors[type]!;

    // style fg bg text reset
    return needBackground
        ? '${colors['fg']}${colors['bg']}$message$_reset'
        : '${colors['color']}$message$_reset';
  }

  static String stringifyObject(dynamic message) {
    final finalMessage = message is Function ? message() : message;
    if (finalMessage is Map || finalMessage is Iterable) {
      var encoder = JsonEncoder.withIndent('  ', (obj) => obj.toString());
      return encoder.convert(finalMessage);
    } else {
      return finalMessage.toString();
    }
  }
}
