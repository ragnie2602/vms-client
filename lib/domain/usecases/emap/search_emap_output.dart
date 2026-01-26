import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

part 'search_emap_output.freezed.dart';

@freezed
class SearchEmapOutput extends BaseOutput with _$SearchEmapOutput {
  const factory SearchEmapOutput({required List<EmapEntity> listEmapResult}) = _SearchEmapOutput;
}
