part of 'export_event_usecase.dart';

class ExportEventOutput extends BaseOutput {
  final String filePath;
  final String? errorMsg;

  const ExportEventOutput(this.filePath, {this.errorMsg});
}
