import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_ai_box_input.freezed.dart';

@freezed
class FilterAiBoxInput extends BaseInput with _$FilterAiBoxInput {
  const factory FilterAiBoxInput({
    String? keyword,
    AiBoxStatus? statusFilter,
    List<AiBoxEntity>? listAiBoxOrigin,
  }) = _FilterAiBoxInput;
}
