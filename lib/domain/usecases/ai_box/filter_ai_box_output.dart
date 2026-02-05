import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_ai_box_output.freezed.dart';

@freezed
class FilterAiBoxOutput extends BaseOutput with _$FilterAiBoxOutput {
  const factory FilterAiBoxOutput({List<AiBoxEntity>? listAiBox}) =
      _FilterAiBoxOutput;
}
