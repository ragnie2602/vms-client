import 'dart:convert';
import 'dart:developer' as dev;

class Logger {
  Logger._();

  static void log(String message, {String tag = 'VMS'}) {
    dev.log(message, name: tag, time: DateTime.now(), level: 0);
  }

  /// Dạng: \[file_name:line_number\](function_name): message
  static void error(Object? error, {String tag = 'VMS'}) {
    final message = _stringifyMessage(error);
    var stackTrace = StackTrace.current;

    final traceLines = stackTrace.toString().split('\n').skip(1).toList();
    if (traceLines.isEmpty) {
      dev.log(message, name: 'ERROR', stackTrace: stackTrace, level: 1000);
      return;
    }

    // stackTrace = StackTrace.fromString(traceLines.join('\n'));
    final callerLine = traceLines[0];
    final match = RegExp(r'#1\s+([^\s]+)\s+\((.+?):(\d+):\d+\)').firstMatch(callerLine);

    if (match != null) {
      final functionName = match.group(1) ?? 'unknown';
      final filePath = match.group(2) ?? 'unknown.dart';
      final fileName = filePath.split('/').last;
      final lineNumber = match.group(3) ?? '?';

      final fullMessage = '[$fileName:$lineNumber]($functionName): $message';

      dev.log(fullMessage, name: tag, stackTrace: stackTrace, level: 1000);
    } else {
      dev.log(message, name: tag, stackTrace: stackTrace, level: 1000);
    }
  }

  static String _stringifyMessage(dynamic message) {
    final finalMessage = message is Function ? message() : message;
    if (finalMessage is Map || finalMessage is Iterable) {
      var encoder = JsonEncoder.withIndent('  ', (obj) => obj.toString());
      return encoder.convert(finalMessage);
    } else {
      return finalMessage.toString();
    }
  }
}
