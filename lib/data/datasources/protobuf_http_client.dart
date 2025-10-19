import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vms_flutter_client/core/utils/pretty_dio_logger.dart';

class ProtobufHttpClient {
  late final Dio _dio;
  Dio get dio => _dio;

  ProtobufHttpClient() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/octet-stream'},
      ),
    );

    // Add interceptors for logging
    if (!kReleaseMode) {
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

  Future<Uint8List> post({required String url, required Uint8List data}) async {
    try {
      final response = await _dio.post<List<int>>(
        url,
        data: data,
        options: Options(responseType: ResponseType.bytes, contentType: 'application/octet-stream'),
      );

      if (response.statusCode == 200 && response.data != null) {
        return Uint8List.fromList(response.data!);
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
