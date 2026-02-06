part of 'fetch_config_table_usecase.dart';

class FetchConfigTableOutput extends BaseOutput {
  final Map<String, List<FieldConfigEntity>> configTable;

  FetchConfigTableOutput(this.configTable);
}
