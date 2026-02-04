import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_selector/file_selector.dart';
import 'package:intl/intl.dart';
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

      String ext = '.jpg';
      final lowerUrl = imageUrl.toLowerCase();
      if (lowerUrl.endsWith('.png')) {
        ext = '.png';
      } else if (lowerUrl.endsWith('.jpeg')) {
        ext = '.jpg';
      }

      final now = DateTime.now();
      final safeEventName = (input.event.eventName ?? 'Snapshot')
          .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
          .trim();
      final fileName =
          '${safeEventName.isEmpty ? 'Snapshot' : safeEventName}_${DateFormat('yyyyMMdd_HHmmss').format(now)}$ext';

      final FileSaveLocation? result = await getSaveLocation(
        suggestedName: fileName,
        acceptedTypeGroups: [
          const XTypeGroup(label: 'Image', extensions: ['jpg', 'jpeg', 'png']),
        ],
      );

      if (result == null) return SaveImageOutput(errorMsg: 'Không tìm thấy đường dẫn lưu ảnh');

      final xFile = XFile.fromData(
        bytes,
        name: fileName,
        mimeType: ext == '.png' ? 'image/png' : 'image/jpeg',
      );
      await xFile.saveTo(result.path);

      return SaveImageOutput();
    } on DioException catch (e) {
      return SaveImageOutput(errorMsg: 'Lỗi khi tải ảnh: ${e.message}');
    } catch (e) {
      return SaveImageOutput(errorMsg: 'Đã xảy ra lỗi khi tải ảnh');
    }
  }
}
