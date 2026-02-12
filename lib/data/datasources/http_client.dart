import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/utils/api_logger.dart';

class HttpClient {
  late final Dio _dio;
  Dio get dio => _dio;

  HttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Add interceptors for logging
    if (kDebugMode) {
      _dio.interceptors.add(ApiLogInterceptor(maxWidth: 90));
    }
  }

  void updateBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
    EndPoints.baseUrl = newBaseUrl;
  }

  delete({required String url, dynamic data}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final response = await _dio.delete(
      url,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
  }

  get(String url, {Map<String, dynamic>? queryParameters}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final response = await _dio.get(
      url,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParameters: queryParameters,
    );

    if (response.statusCode == 200 && response.data != null) {
      return response.data;
    }
  }

  patch({required String url, required dynamic data}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final response = await _dio.patch(
      url,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if ([200].contains(response.statusCode) && response.data != null) {
      return response.data;
    }
  }

  post({required String url, required dynamic data}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final response = await _dio.post(
      url,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if ([200, 201].contains(response.statusCode) && response.data != null) {
      return response.data;
    }
  }

  put({required String url, required dynamic data}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);
    final response = await _dio.put(
      url,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if ([200].contains(response.statusCode) && response.data != null) {
      return response.data;
    }
  }

  postMultipart({required String url, required Map<String, dynamic> data}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);

    final response = await _dio.post(
      url,
      data: FormData.fromMap(data),
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'multipart/form-data',
      ),
    );

    if ([200, 201].contains(response.statusCode) && response.data != null) {
      return response.data;
    }
  }

  putMultipart({required String url, required Map<String, dynamic> data}) async {
    final token = AppData.instance.read(AppKeys.SP_ACCESS_TOKEN);

    final response = await _dio.put(
      url,
      data: FormData.fromMap(data),
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'multipart/form-data',
      ),
    );

    if ([200, 201].contains(response.statusCode) && response.data != null) {
      return response.data;
    }
  }
}
