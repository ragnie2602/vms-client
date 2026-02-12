import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'save_image_input.dart';
part 'save_image_output.dart';

class SaveImageUseCase extends FutureUseCase<SaveImageInput, SaveImageOutput> {
  @override
  Future<SaveImageOutput> buildUseCase(SaveImageInput input) async {
    final imageUrl = input.event.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      return SaveImageOutput(errorMsg: 'Không tìm thấy ảnh để tải xuống');
    }

    try {
      final dio = Dio();
      final response = await dio.get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final data = response.data;
      if (data == null || data.isEmpty) {
        return SaveImageOutput(errorMsg: 'Không tải được dữ liệu ảnh');
      }

      final bytes = Uint8List.fromList(data);
      final file = File(input.savePath);
      await file.writeAsBytes(bytes);

      return SaveImageOutput();
    } on DioException catch (e) {
      return SaveImageOutput(errorMsg: 'Lỗi khi tải ảnh: ${e.message}');
    } catch (e) {
      return SaveImageOutput(errorMsg: 'Đã xảy ra lỗi khi tải ảnh: $e');
    }
  }
}
