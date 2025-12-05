import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:path/path.dart' as p;

import 'utils/logger.dart';

class ErrorService {
  ErrorService._();

  static File? _logFile;
  static String? get logPath => _logFile?.path;
  static final List<String> _excludedErrors = [
    "PlatformException(media open error, invalid or unsupported media, null, null)",
    "A RenderFlex overflowed by",
  ];

  static Future<void> initGlobalErrorHandler(Future<void> Function() app) async {
    return runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await _initLogFile();

        // Flutter UI and Build Errors
        FlutterError.onError = (details) {
          if (!kReleaseMode) {
            FlutterError.presentError(details);
          }

          record('UI | Build', details.exception, details.stack ?? StackTrace.current);
        };

        // Uncaught and Platform-Specific Errors
        PlatformDispatcher.instance.onError = (error, stack) {
          FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stack));
          record('Uncaught | Platform-Specific', error, stack);

          return true; // Prevent app from crashing
        };

        // Isolate Errors
        Isolate.current.addErrorListener(
          RawReceivePort((pair) {
            final data = pair as List<dynamic>;
            final error = data.first;
            final stack = StackTrace.fromString(data.last.toString());

            FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stack));
            record('Isolate', error, stack);
          }).sendPort,
        );

        await app();
      },
      (error, stack) {
        FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stack));
        record('Asynchronous', error, stack);
      },
    );
  }

  static Future<void> record(
    String type,
    Object error,
    StackTrace? stack, {
    String level = 'ERROR',
  }) async {
    if (_excludedErrors.any((e) => error.toString().contains(e))) return;
    if (_logFile == null) await _initLogFile();

    final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    String message = "\n\n═══╡ [${level.toUpperCase()}] $timestamp ╞═══════════════";
    message += '\n[$type] ${Logger.stringifyObject(error)}\n';
    if (stack != null) {
      message += stack.toString().split('\n').take(AppConfig.LOG_FILE_MAX_TRACE_LINES).join('\n');
    }

    await _logFile!.writeAsString(message, mode: FileMode.append);
  }

  static Future<void> recordSentryEvent(SentryEvent event) async {
    if (_logFile == null) await _initLogFile();

    final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(event.timestamp ?? DateTime.now());
    final level = event.level?.name.toUpperCase() ?? 'ERROR';

    String message = "\n\n═══╡ [$level] $timestamp ╞═══════════════";
    for (var error in event.exceptions ?? <SentryException>[]) {
      int index = 0;
      message += '\n[${error.type}] ${error.value}\n';
      message +=
          error.stackTrace?.frames
              .map(
                (e) => "#${index++}\t${e.function} (${e.absPath}:${e.lineNo ?? 0}:${e.colNo ?? 0})",
              )
              .join('\n') ??
          "";
    }

    await _logFile!.writeAsString(message, mode: FileMode.append);
  }

  static Future<dynamic> openLogFile() async {
    try {
      return switch (Platform.operatingSystem) {
        'windows' => await Process.run('cmd', ['/c', 'start', '', _logFile!.path]),
        'macos' => await Process.run('open', [_logFile!.path]),
        _ => null,
      };
    } catch (e) {
      Logger.error(e);
    }
  }

  static Future<void> _initLogFile() async {
    final appDocDir = await getApplicationSupportDirectory(); // created automatically
    final logFile = File(p.join(appDocDir.path, 'vms.log'));

    bool createOrReplace = true;

    try {
      if (await logFile.exists()) {
        final data = await (await logFile.open()).read(128);
        final createdAtStr = utf8.decode(data, allowMalformed: true).split('\n').firstOrNull;
        final createdAt = DateTime.tryParse(createdAtStr ?? '-');

        createOrReplace =
            createdAt == null ||
            DateTime.now().difference(createdAt) >= AppConfig.LOG_FILE_RETENTION_PERIOD;
      }
    } catch (e) {
      Logger.error(e);
    }

    if (createOrReplace) {
      await logFile.writeAsString('${DateTime.now().toIso8601String()}\nPath: ${logFile.path}\n');
    }

    _logFile = logFile;
    Logger.log("Log file initialized at '${logFile.path}'");
  }

  static Future<String?> downloadLog(String path) async {
    return await compute<Map<String, String>, String?>(_downloadLog, {
      "sourcePath": _logFile!.path,
      "targetPath": path,
    });
  }

  static String? _downloadLog(Map<String, String> data) {
    final logPath = data["sourcePath"];
    final targetPath = data["targetPath"];
    if (logPath == null || targetPath == null) return null;

    final fileName = p.basename(logPath);
    final destPath = p.join(targetPath, fileName);

    return File(logPath).copySync(destPath).path;
  }
}
