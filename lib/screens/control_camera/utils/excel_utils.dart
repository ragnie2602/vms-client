import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vms_flutter_client/domain/entities/camera/import_camera_cell.dart';

class ExcelUtils {
  static Future<void> importExcelFile({
    required Future<void> Function(List<ImportCameraCell> cameras)? onImport,
    required FilePickerResult? excelFileResult,
    Function(double progress)? onProgress,
  }) async {
    // 1. Mở trình chọn file

    if (excelFileResult != null) {
      var file = excelFileResult.files.single.path;
      if (file == null) return;

      // Đọc file - 10% tiến trình
      onProgress?.call(0.1);
      await Future.delayed(Duration(milliseconds: 300));
      var bytes = File(file).readAsBytesSync();

      // Decode file - 20% tiến trình
      onProgress?.call(0.2);
      await Future.delayed(Duration(milliseconds: 300));
      final workbook = Excel.decodeBytes(bytes);

      List<ImportCameraCell> cameras = [];

      for (var table in workbook.tables.keys) {
        var rows = workbook.tables[table]!.rows;
        int totalRows = rows.length - 1; // Bỏ header row

        for (int i = 1; i < rows.length; i++) {
          var row = rows[i];

          if (row.isEmpty) continue;

          String getCellValue(Data? cell) {
            return cell?.value?.toString() ?? '';
          }

          int index = int.tryParse(getCellValue(row[0])) ?? i;
          String method = getCellValue(row[1]);
          String name = getCellValue(row[2]);
          String username = getCellValue(row[3]);
          String password = getCellValue(row[4]);
          String xaddr = getCellValue(row[5]);
          String rtspUrl = getCellValue(row[6]);
          String subStream = getCellValue(row[7]);

          // Nếu không có tên hoặc link RTSP thì bỏ qua
          if (name.isEmpty || rtspUrl.isEmpty || method.isEmpty) continue;

          cameras.add(
            ImportCameraCell(
              index,
              method,
              name,
              xaddr,
              username,
              password,
              rtspUrl,
              subStream,
              0,
            ),
          );

          // Cập nhật tiến trình từ 20% đến 80% khi đọc dữ liệu
          double progress = 0.2 + (0.6 * (i / totalRows));
          onProgress?.call(progress);
          // Delay nhỏ để thấy progress bar chạy (chỉ delay mỗi 5 rows để không quá chậm)
          if (i % 5 == 0) {
            await Future.delayed(Duration(milliseconds: 100));
          }
        }
      }

      // Xử lý dữ liệu - 90% tiến trình
      onProgress?.call(0.9);
      await Future.delayed(Duration(milliseconds: 300));

      // 6. Kết quả: List danh sách camera đã lấy được
      print('Đã nhập thành công ${cameras.length} camera:');
      await onImport?.call(cameras);

      // Hoàn thành - 100% tiến trình
      onProgress?.call(1.0);
      await Future.delayed(Duration(milliseconds: 500));
    } else {
      // Người dùng hủy chọn file
      print("Đã hủy chọn file");
    }
  }
}
