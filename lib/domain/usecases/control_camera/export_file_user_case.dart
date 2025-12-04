import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_selector/file_selector.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class ExportFileUserCase {
  static Future<void> exportExcel(List<CameraEntity> cameras) async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // Add headers
    List<CellValue> headers = [
      TextCellValue('STT'),
      TextCellValue('Tên camera'),
      TextCellValue('Username'),
      TextCellValue('Địa chỉ RTSP'),
      TextCellValue('Địa chỉ luồng phụ'),
    ];
    sheetObject.appendRow(headers);

    for (var i = 0; i < cameras.length; i++) {
      final camera = cameras[i];
      final subStream =
          camera.stream.streamLinks
              .firstWhereOrNull((e) => e.nameOfStream == "SUB STREAM")
              ?.urlOfStream ??
          "";

      List<CellValue> row = [
        IntCellValue(i + 1),
        TextCellValue(camera.name),
        TextCellValue(camera.username),
        TextCellValue(camera.stream.streamOriginUrl),
        TextCellValue(subStream),
      ];
      sheetObject.appendRow(row);
    }

    final FileSaveLocation? result = await getSaveLocation(
      suggestedName: 'Camera_list.xlsx',
      acceptedTypeGroups: [
        const XTypeGroup(label: 'Excel', extensions: ['xlsx']),
      ],
    );

    if (result == null) {
      // User canceled the picker
      return;
    }

    final List<int>? fileBytes = excel.save();
    if (fileBytes != null) {
      final XFile textFile = XFile.fromData(
        Uint8List.fromList(fileBytes),
        name: 'Camera_list.xlsx',
      );
      await textFile.saveTo(result.path);
    }
  }
}
