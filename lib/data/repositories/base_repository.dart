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
    } on DioException catch (e) {
      return Left(_parseDioException(e));
    } catch (error) {
      return Left(kReleaseMode ? Failure.defaultError() : Failure.message(error.toString()));
    }
  }

  DioFailure _parseDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DioFailure(
          message: 'Kết nối đến server quá lâu. Vui lòng thử lại.',
          statusCode: e.response?.statusCode ?? 0,
        );

      case DioExceptionType.badCertificate:
        return DioFailure(
          message: 'Lỗi chứng chỉ bảo mật. Vui lòng liên hệ hỗ trợ.',
          statusCode: e.response?.statusCode ?? 0,
        );

      case DioExceptionType.badResponse:
        return _parseErrorResponse(e);

      case DioExceptionType.cancel:
        return DioFailure(message: 'Yêu cầu đã bị hủy.', statusCode: e.response?.statusCode ?? 0);

      case DioExceptionType.connectionError:
        return DioFailure(
          message: 'Không thể kết nối đến server. Vui lòng kiểm tra kết nối mạng.',
          statusCode: e.response?.statusCode ?? 0,
        );

      case DioExceptionType.unknown:
        if (e.error != null && e.error.toString().contains('SocketException')) {
          return DioFailure(
            message: 'Không có kết nối mạng. Vui lòng kiểm tra kết nối.',
            statusCode: e.response?.statusCode ?? 0,
          );
        }

        return DioFailure(
          message: 'Đã xảy ra lỗi không xác định: ${e.message}',
          statusCode: e.response?.statusCode ?? 0,
        );
    }
  }

  static DioFailure _parseErrorResponse(DioException e) {
    final response = e.response;
    if (response == null) {
      return const DioFailure(message: 'Không nhận được phản hồi từ server.', statusCode: -1);
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    // Handle specific HTTP status codes
    switch (statusCode) {
      case 400:
        return DioFailure(
          message: _extractMessage(data) ?? 'Yêu cầu không hợp lệ.',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );

      case 401:
        return DioFailure(
          message: _extractMessage(data) ?? 'Phiên đăng nhập đã hết hạn.',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );

      case 403:
        return DioFailure(
          message: _extractMessage(data) ?? 'Bạn không có quyền truy cập.',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );

      case 404:
        return DioFailure(
          message: _extractMessage(data) ?? 'Không tìm thấy dữ liệu.',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );

      case 422:
        return DioFailure(
          message: _extractMessage(data) ?? 'Dữ liệu không hợp lệ.',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return DioFailure(
          message: _extractMessage(data) ?? 'Lỗi server. Vui lòng thử lại sau.',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );

      default:
        return DioFailure(
          message: _extractMessage(data) ?? 'Đã xảy ra lỗi: $statusCode',
          code: _extractCode(data),
          statusCode: statusCode,
          data: data,
        );
    }
  }

  /// Extract error message from response data
  static String? _extractMessage(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? data['error'] as String? ?? data['msg'] as String?;
    }

    // Trường hợp response là HTML
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

        return "Hệ thống đang gặp sự cố, vui lòng thử lại sau.";
      } catch (e) {
        return "Hệ thống đang gặp sự cố, vui lòng thử lại sau.";
      }
    }

    if (data is String) return data;
    return null;
  }

  static int _extractCode(dynamic data) {
    if (data == null) return -1;
    if (data is Map<String, dynamic>) {
      final code = data['code'] ?? data['errorCode'] ?? data['error_code'];
      if (code is int) return code;
      if (code is String) return int.tryParse(code) ?? -1;
    }
    return -1;
  }
}
