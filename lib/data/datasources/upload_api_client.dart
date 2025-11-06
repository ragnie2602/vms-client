import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class UploadApiClient {
  UploadApiClient();

  Future<Either<Failure, Uint8List>> upload({
    required String url,
    required List<int> requestData,
    required List<UploadFile> files,
  }) async {
    try {
      final profile = AppData.instance.profile;
      if (profile == null) {
        return Left(Failure.message('User not authenticated'));
      }

      final uri = Uri.parse(url);
      final boundary = '----dart-http-boundary-${DateTime.now().millisecondsSinceEpoch}';
      final crlf = '\r\n';
      final builder = BytesBuilder();

      void write(String s) => builder.add(utf8.encode(s));

      // uid
      write('--$boundary$crlf');
      write('Content-Disposition: form-data; name="uid"$crlf$crlf');
      write('${base64Encode(profile.uid)}$crlf');

      // sid
      write('--$boundary$crlf');
      write('Content-Disposition: form-data; name="sid"$crlf$crlf');
      write('${base64Encode(profile.sessionId)}$crlf');

      // request (⚠️ no Content-Type, no extra \r\n after binary)
      write('--$boundary$crlf');
      write('Content-Disposition: form-data; name="request"$crlf$crlf');
      builder.add(requestData);
      // DO NOT add extra CRLF here!

      // files
      for (final file in files) {
        final filename = file.filename;
        final fieldName = filename.split('.').first;
        write('$crlf--$boundary$crlf');
        write('Content-Disposition: form-data; name="$fieldName"; filename="$filename"$crlf');
        write('Content-Type: ${file.contentType}$crlf$crlf');
        builder.add(file.bytes);
      }

      // closing boundary
      write('$crlf--$boundary--$crlf');

      final resp = await http.post(
        uri,
        headers: {'Content-Type': 'multipart/form-data; boundary=$boundary'},
        body: builder.toBytes(),
      );

      if (resp.statusCode != 200) {
        return Left(Failure.message('HTTP ${resp.statusCode}'));
      }

      try {
        final reply = Reply.fromBuffer(resp.bodyBytes);

        if (reply.isSuccess) {
          return Right(Uint8List.fromList(reply.reply.value));
        } else {
          return Left(Failure.code(reply.type));
        }
      } catch (e) {
        return Left(Failure.message('Invalid response format'));
      }
    } catch (e) {
      return Left(Failure.message(e.toString()));
    }
  }
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
