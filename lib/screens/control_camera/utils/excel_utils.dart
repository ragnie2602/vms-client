import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vms_flutter_client/domain/entities/camera/import_camera_cell.dart';

/// Custom exception cho lỗi định dạng file Excel
class ExcelFormatException implements Exception {
  final String message;

  ExcelFormatException(this.message);

  @override
  String toString() => message;
}

class ExcelUtils {
  // Danh sách các trường header bắt buộc theo đúng thứ tự
  static const List<String> _expectedHeaders = [
    'STT',
    'Loại camera',
    'Tên camera',
    'Username',
    'Password',
    'Địa chỉ ONVIF (chỉ điền nếu loại camera là ONVIF)',
    'Địa chỉ RTSP',
    'Địa chỉ luồng phụ (không bắt buộc)',
  ];

  /// Normalize chuỗi: loại bỏ tất cả ký tự đặc biệt (newline, carriage return, tab, v.v.)
  /// và chỉ giữ lại các ký tự thông thường
  static String _normalizeString(String input) {
    // Loại bỏ các ký tự điều khiển (control characters) như \n, \r, \t, v.v.
    // Chỉ giữ lại chữ cái, số, dấu cách và các ký tự có thể in được
    return input
        .replaceAll(RegExp(r'[\n\r\t\x00-\x1F\x7F]'), '') // Loại bỏ control characters
        .trim(); // Xóa khoảng trắng thừa ở đầu/cuối
  }

  /// Kiểm tra header row có đúng format không
  /// Throw ExcelFormatException nếu không hợp lệ
  static void _validateHeader(List<Data?> headerRow) {
    // Lọc ra chỉ những cột có giá trị thực sự (không null và không empty)
    List<Data?> actualHeaders = [];
    for (var cell in headerRow) {
      // Lấy giá trị và normalize
      String value = _normalizeString(cell?.value?.toString() ?? '');
      // Nếu có giá trị thực sự thì thêm vào list
      if (value.isNotEmpty) {
        actualHeaders.add(cell);
      } else {
        // Nếu gặp cột empty/null thì dừng lại (chỉ lấy các cột liên tiếp từ đầu)
        break;
      }
    }

    // Kiểm tra số lượng cột phải đúng bằng 8 (không được thiếu hoặc thừa)
    if (actualHeaders.length != _expectedHeaders.length) {
      String errorMessage;
      if (actualHeaders.length < _expectedHeaders.length) {
        errorMessage =
            'File Excel không đúng định dạng: Header thiếu cột!\n'
            'Yêu cầu đúng ${_expectedHeaders.length} cột, hiện tại chỉ có ${actualHeaders.length} cột.';
      } else {
        errorMessage =
            'File Excel không đúng định dạng: Header thừa cột!\n'
            'Yêu cầu đúng ${_expectedHeaders.length} cột, hiện tại có ${actualHeaders.length} cột.';
      }
      throw ExcelFormatException(errorMessage);
    }

    // Kiểm tra từng trường header theo thứ tự
    for (int i = 0; i < _expectedHeaders.length; i++) {
      String actualHeader = _normalizeString(actualHeaders[i]?.value?.toString() ?? '');
      String expectedHeader = _normalizeString(_expectedHeaders[i]);

      if (actualHeader != expectedHeader) {
        throw ExcelFormatException(
          'File Excel không đúng định dạng:\n'
          'Cột thứ ${i + 1} phải là "$expectedHeader" nhưng lại là "$actualHeader".\n\n'
          'Header đúng phải là:\n${_expectedHeaders.join(' | ')}',
        );
      }
    }
  }

  static Future<void> importExcelFile({
    required Future<void> Function(List<ImportCameraCell> cameras)? onImport,
    required FilePickerResult? excelFileResult,
    Function(double progress)? onProgress,
  }) async {
    // 1. Mở trình chọn file

    if (excelFileResult != null) {
      var file = excelFileResult.files.single.path;
      if (file == null) return;

      ExcelFormatException? formatError; // Lưu lỗi định dạng để báo sau khi progress 100%

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

        // Kiểm tra file có dữ liệu không
        if (rows.isEmpty) {
          formatError = ExcelFormatException('File Excel không có dữ liệu');
          break;
        }

        // Validate header row (dòng đầu tiên)
        try {
          _validateHeader(rows[0]);
        } on ExcelFormatException catch (e) {
          formatError = e;
        }

        // Nếu header không hợp lệ, vẫn tiếp tục để chạy progress đến 100%
        if (formatError == null) {
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

            cameras.add(ImportCameraCell(index, method, name, xaddr, username, password, rtspUrl, subStream, 0));

            // Cập nhật tiến trình từ 20% đến 80% khi đọc dữ liệu
            double progress = 0.2 + (0.6 * (i / totalRows));
            onProgress?.call(progress);
            // Delay nhỏ để thấy progress bar chạy (chỉ delay mỗi 5 rows để không quá chậm)
            if (i % 5 == 0) {
              await Future.delayed(Duration(milliseconds: 100));
            }
          }
        }
      }

      // Xử lý dữ liệu - 90% tiến trình
      onProgress?.call(0.9);
      await Future.delayed(Duration(milliseconds: 300));

      // Hoàn thành - 100% tiến trình
      onProgress?.call(1.0);
      await Future.delayed(Duration(milliseconds: 500));

      // Sau khi progress 100%, kiểm tra lỗi
      if (formatError != null) {
        throw formatError;
      }

      // 6. Kết quả: List danh sách camera đã lấy được (chỉ gọi khi không có lỗi)
      print('Đã nhập thành công ${cameras.length} camera:');
      await onImport?.call(cameras);
    } else {
      // Người dùng hủy chọn file
      print("Đã hủy chọn file");
    }
  }
}
