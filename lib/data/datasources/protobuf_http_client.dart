import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/core/utils/pretty_dio_logger.dart';

class ProtobufHttpClient {
  late final Dio _dio;
  Dio get dio => _dio;

  ProtobufHttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvService.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Add interceptors for logging
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  post({required String url, required dynamic data, String? token}) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data;
      } else {
        throw Exception('HTTP ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
