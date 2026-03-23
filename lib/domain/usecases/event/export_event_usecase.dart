import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_selector/file_selector.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
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
    List<EventType> eventTypes = [];
    final etRes = await eventRepository.getAllEventType();
    etRes.fold((onFailure) {}, (onSuccess) => eventTypes.addAll(onSuccess));

    final subjectName = input.subjectName?.isNotEmpty == true ? input.subjectName : null;
    List<String>? et = [];
    if (subjectName?.trim().isEmpty == false) {
      et = ['face_detection'];
    } else {
      et = input.eventTypes;
    }

    final List<EventEntity> events = [];
    (await eventRepository.exportEvent(
      input.startTime != null ? input.startTime!.millisecondsSinceEpoch ~/ 1000 : null,
      input.endTime != null ? input.endTime!.millisecondsSinceEpoch ~/ 1000 : null,
      et,
      input.cameraIds,
      input.subjectName,
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
        'Tên đối tượng',
        'Nhóm đối tượng',
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
          bottomBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
          fontColorHex: ExcelColor.white,
          leftBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
          rightBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
          topBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
        );
      }

      int dataStartRow = 1;

      for (var i = 0; i < events.length; i++) {
        final event = events[i];
        final time = DateFormat('dd/MM/yyyy HH:mm:ss').format(event.timeEvent);

        final cameraName =
            input.cameras.firstWhereOrNull((c) => c.camId == event.cameraId)?.name ?? '';

        String subjectName =
            (event.eventType == 'face_detection' && event.payload?['Tên đối tượng'] != null)
            ? event.payload!['Tên đối tượng']
            : '';
        final groupName =
            (event.eventType == 'face_detection' && event.payload?['groupName'] != null)
            ? event.payload!['groupName']
            : '';

        List<CellValue> row = [
          IntCellValue(i + 1),
          TextCellValue(time),
          TextCellValue(event.eventName ?? ''),
          TextCellValue(input.cameraGroupName),
          TextCellValue(cameraName),
          TextCellValue(subjectName),
          TextCellValue(groupName),
          TextCellValue(event.description ?? ''),
        ];

        for (var col = 0; col < row.length; col++) {
          final cell = sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: col, rowIndex: dataStartRow + i),
          );
          cell.value = row[col];
          cell.cellStyle = CellStyle(
            bold: false,
            leftBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
            rightBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
            topBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
            bottomBorder: Border(borderColorHex: ExcelColor.black, borderStyle: BorderStyle.Thin),
          );
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

        return ExportEventOutput(fileName);
      } else {
        return const ExportEventOutput('', errorMsg: 'Lỗi khi tạo nội dung file Excel');
      }
    } catch (e) {
      return ExportEventOutput('', errorMsg: 'Lỗi khi tạo file Excel: $e');
    }
  }
}
