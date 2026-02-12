import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';

class ApiLogInterceptor extends Interceptor {
  final int maxWidth;
  final Map<int, DateTime> _requestTimestamps = {};

  ApiLogInterceptor({this.maxWidth = 90});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _requestTimestamps[options.hashCode] = DateTime.now();

    String _color(String msg) => '\x1B[36m$msg\x1B[0m'; // xanh dương

    final buffer = StringBuffer();
    buffer.writeln(_color('\x1B[3m[${options.method.toUpperCase()}] ${options.uri}'));
    buffer.writeln(_color('╔${'═' * maxWidth}'));
    // buffer.writeln('║ 🚀 REQUEST');
    // buffer.writeln('╠══════════════════════════════════════════════════════════════');
    // buffer.writeln('║ Method: ${options.method}');
    // buffer.writeln('║ URL: ${options.uri}');
    buffer.writeln(_color('║ Time: ${DateTime.now().toLocal()}'));
    // buffer.writeln(_color('║ Env: ${AppConfig.env.name.toUpperCase()}'));
    buffer.writeln(_color('╠${'─' * maxWidth}'));
    buffer.writeln(_color('║ Headers:'));
    options.headers.forEach((key, value) {
      // Mask sensitive headers
      // if (key.toLowerCase() == 'authorization') {
      //   final val = value.toString();
      //   if (val.length > 20) {
      //     buffer.writeln('║   $key: ${val.substring(0, 20)}...[HIDDEN]');
      //   } else {
      //     buffer.writeln('║   $key: [HIDDEN]');
      //   }
      // } else {
      buffer.writeln(_color('║   $key: $value'));
      // }
    });

    if (options.queryParameters.isNotEmpty) {
      buffer.writeln(_color('╠${'─' * maxWidth}'));
      buffer.writeln(_color('║ Query Parameters:'));
      options.queryParameters.forEach((key, value) {
        buffer.writeln(_color('║   $key: $value'));
      });
    }

    if (options.data != null) {
      buffer.writeln(_color('╠${'─' * maxWidth}'));
      buffer.writeln(_color('║ Body:'));
      // [MỚI] Xử lý riêng cho FormData
      if (options.data is FormData) {
        final formData = options.data as FormData;

        // 1. Log các trường text (Fields)
        if (formData.fields.isNotEmpty) {
          buffer.writeln(_color('║ 🔹 Fields'));
          for (final entry in formData.fields) {
            buffer.writeln(_color('║    ├─ ${entry.key} : ${entry.value}'));
          }
          buffer.writeln(_color('║'));
        }

        // 2. Log các file upload (Files)
        if (formData.files.isNotEmpty) {
          buffer.writeln(_color('║ 📎 Files'));
          for (final entry in formData.files) {
            final key = entry.key;
            final file = entry.value;
            final fileName = file.filename ?? 'unknown_file';
            final length = file.length;
            final contentType = file.contentType?.mimeType ?? 'unknown';

            buffer.writeln(_color('║    ├─ $key :'));
            buffer.writeln(_color('║    │   • name : $fileName'));
            buffer.writeln(_color('║    │   • size : ${length.readableBytes}'));
            buffer.writeln(_color('║    │   • type : $contentType'));
          }
        }
      }
      // [CŨ] Xử lý JSON như bình thường
      else {
        final prettyBody = formatJson(options.data);
        for (final line in prettyBody.split('\n')) {
          buffer.writeln(_color('║   $line'));
        }
      }
    }

    // --- PHẦN THÊM CURI ---
    buffer.writeln(_color('╠${'─' * maxWidth}'));
    buffer.writeln(_color('║ cURL:'));
    try {
      final curl = renderCurlRepresentation(options);
      buffer.writeln(_color('║   $curl'));
    } catch (e) {
      buffer.writeln(_color('║ (Unable to generate cURL: $e)'));
    }
    // -----------------------

    buffer.writeln(_color('╚${'═' * maxWidth}'));
    buffer.writeln('');
    buffer.writeln('\u200B');

    _log(buffer.toString(), name: '🚀');
    handler.next(options);
  }

  // Hàm phụ trợ để tạo cURL string
  static String renderCurlRepresentation(RequestOptions options) {
    List<String> components = [];

    // 1. Basic Command
    components.add('curl');
    components.add('-X ${options.method.toUpperCase()}');
    // components.add('--compressed');

    // 2. URL
    final url = options.uri.toString();
    final escapedUrl = url.replaceAll("'", r"'\''");
    components.add("'$escapedUrl'");

    // 3. Headers
    options.headers.forEach((k, v) {
      if (k.toLowerCase() == 'content-length') return;

      // Bỏ qua Content-Type multipart để curl tự sinh boundary
      if (k.toLowerCase() == 'content-type' &&
          v.toString().toLowerCase().contains('multipart/form-data')) {
        return;
      }

      final val = v.toString();
      final escapedVal = val.replaceAll("'", r"'\''");
      components.add("-H '$k: $escapedVal'");
    });

    // 4. Body data
    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;

        // A. Fields (Text) - ĐỔI VỀ NHÁY ĐƠN ĐỂ AN TOÀN VỚI $
        for (var element in formData.fields) {
          final key = element.key;
          final value = element.value;
          // Escape nháy đơn thay vì nháy kép
          final escapedValue = value.replaceAll("'", r"'\''");
          // Postman vẫn hiểu tốt: --form 'key=value'
          components.add("--form '$key=$escapedValue'");
        }

        // B. Files (File Upload) - GIỮ NHÁY KÉP HOẶC ĐƠN ĐỀU ĐƯỢC
        // (Với file path thì ít khi có ký tự đặc biệt, nhưng dùng nháy kép cho Postman dễ nhìn cũng ok)
        for (var element in formData.files) {
          final key = element.key;
          final file = element.value;
          final fileName = file.filename ?? 'unknown_file';

          // --form "key=@filename"
          components.add('--form "$key=@$fileName"');
        }
      }
      // Xử lý JSON/Raw
      else {
        String dataStr;
        try {
          if (options.data is Map || options.data is List) {
            dataStr = jsonEncode(options.data);
          } else {
            dataStr = options.data.toString();
          }
        } catch (_) {
          dataStr = options.data.toString();
        }
        final escapedData = dataStr.replaceAll("'", r"'\''");
        components.add("--data-raw '$escapedData'");
      }
    }

    return components.join(' ');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestTime = _requestTimestamps.remove(response.requestOptions.hashCode);
    final duration = requestTime != null
        ? DateTime.now().difference(requestTime).inMilliseconds
        : 0;

    String _color(String msg) => response.statusCode == 200 ? '\x1B[32m$msg\x1B[0m' : msg; // xanh

    final buffer = StringBuffer();
    buffer.writeln(_color('\x1B[3m[${response.statusCode}] ${response.requestOptions.uri}'));
    buffer.writeln(_color('╔${'═' * maxWidth}'));
    // buffer.writeln('║ ✅ RESPONSE');
    // buffer.writeln('╠══════════════════════════════════════════════════════════════');
    // buffer.writeln('║ URL: ${response.requestOptions.uri}');
    // buffer.writeln('║ Status Code: ${response.statusCode} ${response.statusMessage ?? ''}');
    buffer.writeln(_color('║ Duration: ${duration}ms'));
    buffer.writeln(_color('║ Time: ${DateTime.now().toLocal()}'));
    // buffer.writeln('╠══════════════════════════════════════════════════════════════');
    // buffer.writeln('║ Response Headers:');
    // response.headers.forEach((name, values) {
    //   buffer.writeln('║   $name: ${values.join(', ')}');
    // });
    buffer.writeln(_color('╠${'─' * maxWidth}'));
    buffer.writeln(_color('║ Response Data:'));

    final prettyData = formatJson(response.data);
    for (final line in prettyData.split('\n')) {
      buffer.writeln(_color('║   $line'));
    }

    buffer.writeln(_color('╚${'═' * maxWidth}'));
    buffer.writeln('');
    buffer.writeln('\u200B');

    _log(buffer.toString(), name: '📥');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final requestTime = _requestTimestamps.remove(err.requestOptions.hashCode);
    final duration = requestTime != null
        ? DateTime.now().difference(requestTime).inMilliseconds
        : 0;

    String _color(String msg) => '\x1B[31m$msg\x1B[0m'; // đỏ cho error

    final buffer = StringBuffer();
    buffer.writeln(_color('\x1B[3m[${err.type}] ${err.requestOptions.uri}'));
    buffer.writeln(_color('╔${'═' * maxWidth}'));
    // buffer.writeln('║ ❌ ERROR');
    // buffer.writeln('╠══════════════════════════════════════════════════════════════');
    // buffer.writeln('║ URL: ${err.requestOptions.uri}');
    buffer.writeln(_color('║ Method: ${err.requestOptions.method}'));
    buffer.writeln(_color('║ Duration: ${duration}ms'));
    buffer.writeln(_color('║ Time: ${DateTime.now().toLocal()}'));
    buffer.writeln(_color('╠${'─' * maxWidth}'));
    buffer.writeln(_color('║ Error Type: ${err.type}'));
    buffer.writeln(_color('║ Error Message: ${err.message?.replaceAll('\n', ' ') ?? ''}'));

    if (err.response != null) {
      buffer.writeln(_color('╠${'─' * maxWidth}'));
      buffer.writeln(_color('║ Response Status: ${err.response?.statusCode}'));
      buffer.writeln(_color('║ Response Data:'));
      final prettyData = formatJson(err.response?.data);
      for (final line in prettyData.split('\n')) {
        buffer.writeln(_color('║   $line'));
      }
    }

    buffer.writeln(_color('╠${'─' * maxWidth}'));
    buffer.writeln(_color('║ Stack Trace:'));
    final stackTrace = err.stackTrace.toString();
    final stackLines = stackTrace.split('\n').take(10); // Limit stack trace lines
    for (final line in stackLines) {
      buffer.writeln(_color('║   $line'));
    }
    if (stackTrace.split('\n').length > 10) {
      buffer.writeln(_color('║   ... (truncated)'));
    }

    buffer.writeln(_color('╚${'═' * maxWidth}'));
    buffer.writeln('');
    buffer.writeln('\u200B');

    _log(buffer.toString(), name: '💥');
    handler.next(err);
  }

  /// Format JSON data for pretty printing (no truncation)
  static String formatJson(dynamic data) {
    if (data == null) {
      return 'null';
    }

    try {
      if (data is String) {
        // Try to parse as JSON first
        try {
          final parsed = jsonDecode(data);
          return const JsonEncoder.withIndent('  ').convert(parsed);
        } catch (_) {
          return data;
        }
      } else if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      } else {
        return data.toString();
      }
    } catch (e) {
      return 'Error formatting data: $e\nRaw: ${data.toString()}';
    }
  }

  /// Log message using debugPrint (auto-splits long messages)
  void _log(String message, {String? name}) {
    // debugPrint automatically handles long strings by splitting them
    log(message, name: name ?? '🔥');
  }
}


