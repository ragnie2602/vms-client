import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vms_flutter_client/core/base_response.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();

abstract class BaseRepository {
  const BaseRepository();

  Future<Either<Failure, T>> catchError<T>(FutureEitherOr<T> body) async {
    try {
      return await body();
    } on Failure catch (e) {
      return Left(e);
    } catch (error) {
      if (!kReleaseMode && error is DioException) {
        final htmlMessage = _parseHTMLMessage(error.response?.data);
        if (htmlMessage != null) return Left(Failure.message(htmlMessage));
      }

      return Left(kReleaseMode ? Failure.defaultError() : Failure.message(error.toString()));
    }
  }

  String? _parseHTMLMessage(dynamic data) {
    if (data is String &&
        (data.toLowerCase().contains('<html') || data.toLowerCase().contains('<!doctype html'))) {
      try {
        // Cố gắng lấy Title hoặc H1 để làm thông báo lỗi cho gọn
        final titleRegex = RegExp(r'<title>(.*?)</title>', caseSensitive: false, dotAll: true);
        final match = titleRegex.firstMatch(data);
        final title = match?.group(1)?.trim();

        if (title != null) {
          return "Hệ thống đang gặp sự cố ($title)";
        }
      } catch (_) {}
    }

    return null;
  }
}
