import 'package:excel/excel.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/services.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class ExportFileUserCase {
  static Future<void> exportExcel(List<CameraEntity> cameras) async {
    // Đọc file template từ assets (assets không thể mở trực tiếp bằng File)
    final templateData = await rootBundle.load(AppAssets.cameraTemplateImport);
    final bytes = templateData.buffer.asUint8List(templateData.offsetInBytes, templateData.lengthInBytes);

    final tempExcel = Excel.decodeBytes(bytes);

    final sheetObjectTemp = tempExcel.sheets.values.first;

    final originalHeaders = List<Data?>.from(sheetObjectTemp.rows.first);
    final headers = originalHeaders.where((cell) => (cell?.value?.toString().toLowerCase() ?? '') != 'password').toList();
    headers.removeWhere((element) => element?.value == null);

    int dataStartRow = 1;
    List<String> headerString = headers.map((cell) => cell?.value?.toString() ?? '').toList();

    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    sheetObject.appendRow(headerString.map((cell) => TextCellValue(cell)).toList());
    for (var col = 0; col < headerString.length; col++) {
      final headerCell = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0));
      headerCell.cellStyle = CellStyle(bold: true);
    }

    for (var i = 0; i < cameras.length; i++) {
      final camera = cameras[i];
      final subStream = camera.stream.streamLinks.firstWhereOrNull((e) => e.nameOfStream == "SUB STREAM")?.urlOfStream ?? "";
      final cameraTypeName = camera.type.name.toUpperCase();

      List<CellValue> row = [
        IntCellValue(i + 1),
        TextCellValue(cameraTypeName),
        TextCellValue(camera.name),
        TextCellValue(camera.username),
        TextCellValue(camera.onvif.xaddr),
        TextCellValue(camera.stream.streamOriginUrl),
        TextCellValue(subStream),
      ];
      for (var col = 0; col < row.length; col++) {
        final cell = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: dataStartRow + i));
        cell.value = row[col];
        cell.cellStyle = CellStyle(bold: false);
      }
    }

    final FileSaveLocation? result = await getSaveLocation(
      suggestedName: 'Camera_list.xlsx',
      acceptedTypeGroups: [
        const XTypeGroup(label: 'Excel', extensions: ['xlsx']),
      ],
    );

    if (result == null) {
      return;
    }

    final List<int>? fileBytes = excel.save();
    if (fileBytes != null) {
      final XFile textFile = XFile.fromData(Uint8List.fromList(fileBytes), name: 'Camera_list.xlsx');
      await textFile.saveTo(result.path);
    }
  }
}
