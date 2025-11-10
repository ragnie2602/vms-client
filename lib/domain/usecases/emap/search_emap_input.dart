import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

part 'search_emap_input.freezed.dart';

@freezed
class SearchEmapInput extends BaseInput with _$SearchEmapInput {
  const factory SearchEmapInput({
    String? keyword,
    List<EmapEntity>? listEmapOrigin,
  }) = _SearchEmapInput;
}
