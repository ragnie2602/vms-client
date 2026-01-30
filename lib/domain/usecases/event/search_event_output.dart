import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class SearchEventOutput extends BaseOutput {
  final Pageable<EventEntity> events;
  final int totalCount;

  final String? errorMsg;

  const SearchEventOutput(this.events, this.totalCount, {this.errorMsg});
}
