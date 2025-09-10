import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../../core/env_service.dart';

class ProtobufHttpClient {
  late final Dio _dio;
  
  ProtobufHttpClient() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/octet-stream',
      },
    ));
    
    // Add interceptors for logging
    _dio.interceptors.add(LogInterceptor(
      requestBody: false, // Don't log binary data
      responseBody: false, // Don't log binary data
    ));
  }
  
  Future<Uint8List> post({
    required String url,
    required Uint8List data,
  }) async {
    try {
      final response = await _dio.post<List<int>>(
        url,
        data: data,
        options: Options(
          responseType: ResponseType.bytes,
          contentType: 'application/octet-stream',
        ),
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
  
  Future<Uint8List> authenticate(Uint8List requestData) async {
    return await post(
      url: EnvService.authenticateUrl,
      data: requestData,
    );
  }
}