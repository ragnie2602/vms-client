import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_selector/file_selector.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';

part 'export_event_input.dart';
part 'export_event_output.dart';

class ExportEventUseCase extends FutureUseCase<ExportEventInput, ExportEventOutput> {
  final IEventRepository eventRepository;

  const ExportEventUseCase(this.eventRepository);

  @override
  Future<ExportEventOutput> buildUseCase(ExportEventInput input) async {
    final List<EventEntity> events = [];
    (await eventRepository.exportEvent(
      input.startTime != null ? input.startTime!.millisecondsSinceEpoch ~/ 1000 : null,
      input.endTime != null ? input.endTime!.millisecondsSinceEpoch ~/ 1000 : null,
      input.eventTypes,
      input.cameraIds,
    )).fold(
      (onFailure) => ExportEventOutput('', errorMsg: onFailure.parseMessage()),
      (onSuccess) => events.addAll(onSuccess),
    );

    try {
      var excel = Excel.createExcel();
      excel.rename('Sheet1', 'DanhSachSuKien');
      Sheet sheetObject = excel['DanhSachSuKien'];

      List<String> headers = [
        'STT',
        'Thời gian',
        'Loại sự kiện',
        'Nhóm Camera',
        'Tên Cam',
        'Ghi chú',
      ];

      sheetObject.appendRow(headers.map((cell) => TextCellValue(cell)).toList());

      for (var col = 0; col < headers.length; col++) {
        final headerCell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0),
        );
        headerCell.cellStyle = CellStyle(
          backgroundColorHex: ExcelColor.fromHexString("FF5384ED"),
          bold: true,
          bottomBorder: Border(borderColorHex: ExcelColor.black),
          fontColorHex: ExcelColor.white,
          leftBorder: Border(borderColorHex: ExcelColor.black),
          rightBorder: Border(borderColorHex: ExcelColor.black),
          topBorder: Border(borderColorHex: ExcelColor.black),
        );
      }

      int dataStartRow = 1;

      for (var i = 0; i < events.length; i++) {
        final event = events[i];
        final time = DateFormat(
          'dd/MM/yyyy HH:mm:ss',
        ).format(DateTime.fromMillisecondsSinceEpoch(event.timeEvent * 1000));

        final cameraName =
            input.cameras.firstWhereOrNull((c) => c.camId == event.cameraId)?.name ?? '';

        List<CellValue> row = [
          IntCellValue(i + 1),
          TextCellValue(time),
          TextCellValue(event.eventName ?? ''),
          TextCellValue(input.cameraGroupName),
          TextCellValue(cameraName),
          TextCellValue(event.description ?? ''),
        ];

        for (var col = 0; col < row.length; col++) {
          final cell = sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: col, rowIndex: dataStartRow + i),
          );
          cell.value = row[col];
          cell.cellStyle = CellStyle(bold: false);
        }
      }

      final now = DateTime.now();
      final fileName = 'DanhSachSuKien_${DateFormat('ddMMyyyy_HHmmss').format(now)}.xlsx';

      final FileSaveLocation? result = await getSaveLocation(
        suggestedName: fileName,
        acceptedTypeGroups: [
          const XTypeGroup(label: 'Excel', extensions: ['xlsx']),
        ],
      );

      if (result == null) {
        return const ExportEventOutput('', errorMsg: 'Người dùng đã hủy lưu file');
      }

      final List<int>? fileBytes = excel.save();
      if (fileBytes != null) {
        final XFile excelFile = XFile.fromData(
          Uint8List.fromList(fileBytes),
          name: fileName,
          mimeType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        );
        await excelFile.saveTo(result.path);

        return ExportEventOutput(result.path);
      } else {
        return const ExportEventOutput('', errorMsg: 'Lỗi khi tạo nội dung file Excel');
      }
    } catch (e) {
      return ExportEventOutput('', errorMsg: 'Lỗi khi tạo file Excel: $e');
    }
  }
}
