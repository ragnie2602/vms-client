// ignore: depend_on_referenced_packages
import 'package:image/image.dart' as img;
import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data' show Uint8List, ByteBuffer;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BackgroundTask {
  BackgroundTask._();

  /// (package:image) fromBytes + encodeJpg --> xử lý CPU-bound trên isolate hiện tại
  /// --> Block UI nếu chạy trên main isolate
  static Future<bool> encodeRgbaToJpegFile({
    required String path,
    required Uint8List bytes,
    required int width,
    required int height,
  }) => compute(_isolateEncodeRgbaToJpegFile, <String, dynamic>{
    'path': path,
    'byteBuffer': bytes.buffer,
    'width': width,
    'height': height,
  });
  static Future<bool> _isolateEncodeRgbaToJpegFile(Map<String, dynamic> message) async {
    final image = img.Image.fromBytes(
      width: message['width'] as int,
      height: message['height'] as int,
      bytes: message['byteBuffer'] as ByteBuffer,
      order: img.ChannelOrder.rgba,
    );

    return img.encodeJpgFile(message['path'] as String, image);
  }

  ///
  static Future<void> _isolateDownload(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort); // Gửi lại sendPort cho main isolate

    await for (final msg in port) {
      if (msg is Map && msg['cmd'] == 'start') {
        final url = msg['url'] as String;
        final savePath = msg['path'] as String;

        final dio = Dio();
        try {
          await dio.download(
            url,
            savePath,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                final progress = received / total;
                sendPort.send({'progress': progress});
              }
            },
          );

          sendPort.send({'done': true});
        } catch (e) {
          sendPort.send({'error': e.toString()});
        }
      } else if (msg == 'exit') {
        port.close();
        break;
      }
    }
  }

  static Future<void> download({
    required String url,
    required String savePath,
    void Function(double progress)? onProgress,
    void Function()? onComplete,
    void Function(Object error)? onError,
  }) async {
    final receivePort = ReceivePort();
    final isolate = await Isolate.spawn(_isolateDownload, receivePort.sendPort);

    SendPort? sendPort;
    final completer = Completer<void>();

    Future<void> _cleanup(
      Isolate isolate,
      ReceivePort port,
      StreamSubscription sub,
      SendPort? sendPort,
    ) async {
      sendPort?.send('exit');
      await sub.cancel();
      port.close();
      isolate.kill(priority: Isolate.immediate);
    }

    late final StreamSubscription sub;
    sub = receivePort.listen((message) async {
      if (message is SendPort) {
        // Nhận được SendPort từ isolate → bắt đầu tải
        sendPort = message;
        sendPort!.send({'cmd': 'start', 'url': url, 'path': savePath});
      } else if (message is Map) {
        if (message['progress'] != null) {
          onProgress?.call(message['progress'] as double);
        } else if (message['done'] == true) {
          onComplete?.call();
          await _cleanup(isolate, receivePort, sub, sendPort);
          completer.complete();
        } else if (message['error'] != null) {
          onError?.call(message['error']);
          await _cleanup(isolate, receivePort, sub, sendPort);
          completer.completeError(message['error']);
        }
      }
    });

    return completer.future;
  }
}
