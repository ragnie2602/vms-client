import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

import 'logger.dart';

class FFmpegProcess {
  FFmpegProcess._internal() {
    _initJob();
  }

  factory FFmpegProcess() => _instance;
  static final FFmpegProcess _instance = FFmpegProcess._internal();
  static FFmpegProcess get instance => _instance;

  late final jobChannel = MethodChannel("ffmpeg_job");

  Future<void> _initJob() async {
    await jobChannel.invokeMethod('initJob');
  }

  Future<void> _bindPid(int pid) async {
    await jobChannel.invokeMethod('bindPid', {"pid": pid});
  }

  /// PRELOAD (warm-up) camera để tránh mất các giây đầu.
  Future<void> preload(String source, {bool mute = true}) async {
    Process? process;

    try {
      final args = [
        '-y',
        '-rtsp_transport',
        'tcp',
        '-i',
        source,
        if (mute) '-an',
        mute ? '-c:v' : '-c',
        'copy',
        '-t',
        '1',
        'NUL',
      ];
      process = await Process.start('ffmpeg', args);
    } catch (e) {
      Logger.error(e);
    } finally {
      process?.kill(ProcessSignal.sigkill);
    }
  }

  Future<Process?> record(String source, String output, {bool mute = true}) async {
    final args = [
      '-y',
      '-rtsp_transport',
      'tcp',
      '-fflags',
      '+genpts',
      '-use_wallclock_as_timestamps',
      '1',
      '-avoid_negative_ts',
      'make_zero',
      '-i',
      source,
      if (mute) '-an',
      mute ? '-c:v' : '-c',
      'copy',
      output,
    ];
    Process? process;

    try {
      process = await Process.start('ffmpeg', args);
      Completer<void> completer = Completer<void>();

      void _onStartingRecording(String msg) {
        if (!completer.isCompleted && msg.contains('frame=')) {
          final sizeMatch = RegExp(r"size=\s*(\d+)KiB").firstMatch(msg);
          if (sizeMatch != null) {
            final size = int.parse(sizeMatch.group(1) ?? "1");

            // size > 1 KiB nghĩa là FFmpeg đã ghi keyframe đầu
            if (size > 1) completer.complete();
          } else {
            completer.complete();
          }
        }
      }

      process.stdout.transform(SystemEncoding().decoder).listen((msg) {
        _onStartingRecording(msg.trim());
      });

      process.stderr.transform(SystemEncoding().decoder).listen((msg) {
        final trimmed = msg.trim();

        _onStartingRecording(trimmed);
        if (trimmed.isNotEmpty && _shouldWriteLog(trimmed)) Logger.warn(trimmed, writeLog: true);
      });

      await completer.future.timeout(Duration(seconds: 15), onTimeout: () {});
    } catch (e) {
      process?.kill(ProcessSignal.sigkill);
      process = null;
    }

    if (process != null) {
      // Bind pid để khi đóng app/crash ... --> ffmpeg cũng tự động dừng ghi
      await _bindPid(process.pid);
    }

    return process;
  }

  bool _shouldWriteLog(String msg) {
    return ![
      'ffmpeg version',
      ' Copyright (c)',
      'frame=',
      'libavformat    ',
      'libavdevice    ',
      'libavfilter    ',
      'libswscale      ',
      'libswresample   ',
      'Metadata:',
      'Input #',
      'Stream mapping:',
      'Stream #',
      'Press [q] to stop, [?] for help',
      'Session streamed by',
      'Output #0, matroska, to',
    ].any((pattern) => msg.contains(pattern));
  }
}
