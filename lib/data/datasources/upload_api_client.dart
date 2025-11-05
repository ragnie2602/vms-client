import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/utils/pretty_dio_logger.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

import 'base_api_client.dart';

class UploadApiClient extends BaseApiClient {
  late final Dio _dio;
  Dio get dio => _dio;

  late String _serverUrl;

  UploadApiClient() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    // Add interceptors for logging
    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: false, // Don't log multipart body (too large)
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  @override
  Future<bool> connect(covariant UploadConnectionParams params) async {
    _serverUrl = params.serverUrl;
    return true;
  }

  @override
  Future<void> disconnect() async {
    _dio.close();
  }

  @override
  Future<Either<Failure, T>> send<T>(covariant UploadRequestPayload data) async {
    try {
      final profile = AppData.instance.profile;
      if (profile == null) {
        return Left(Failure.message('User not authenticated'));
      }

      final formData = FormData.fromMap({
        'uid': Uint8List.fromList(profile.uid),
        'sid': Uint8List.fromList(profile.sessionId),
        'request': MultipartFile.fromBytes(
          data.requestData,
          filename: 'request',
          contentType: DioMediaType('application', 'octet-stream'),
        ),
      });

      // Add files if present
      for (var file in data.files) {
        formData.files.add(MapEntry(
          file.fieldName,
          MultipartFile.fromBytes(
            file.bytes,
            filename: file.filename,
            contentType: DioMediaType.parse(file.contentType),
          ),
        ));
      }

      final url = '$_serverUrl${data.protocolId}';
      final response = await _dio.post<List<int>>(
        url,
        data: formData,
        options: Options(
          responseType: ResponseType.bytes,
          contentType: 'multipart/form-data',
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final reply = Reply.fromBuffer(Uint8List.fromList(response.data!));

        if (reply.isSuccess) {
          return Right(reply.reply.value as T);
        } else {
          return Left(Failure.code(reply.type));
        }
      } else {
        return Left(Failure.message('HTTP ${response.statusCode}: ${response.statusMessage}'));
      }
    } on DioException catch (e) {
      return Left(Failure.message('Network error: ${e.message}'));
    } catch (e) {
      return Left(kReleaseMode ? Failure.defaultError() : Failure.message('Unexpected error: $e'));
    }
  }

  @override
  Stream<Map<String, dynamic>> listen() {
    throw UnimplementedError('Upload client does not support listening');
  }

  @override
  bool get isConnected => true;
}

class UploadConnectionParams extends BaseConnectionParams {
  final String serverUrl;

  UploadConnectionParams(this.serverUrl);
}

class UploadRequestPayload extends BaseRequestPayload {
  final int protocolId;
  final Uint8List requestData;
  final List<UploadFile> files;

  UploadRequestPayload({
    required this.protocolId,
    required this.requestData,
    this.files = const [],
  });
}

class UploadFile {
  final String fieldName;
  final String filename;
  final Uint8List bytes;
  final String contentType;

  UploadFile({
    required this.fieldName,
    required this.filename,
    required this.bytes,
    this.contentType = 'application/octet-stream',
  });
}
