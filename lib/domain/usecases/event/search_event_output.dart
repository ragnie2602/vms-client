part of 'search_event_use_case.dart';

class SearchEventOutput extends BaseOutput {
  final Pageable<EventEntity> events;
  final int totalCount;

  final String? errorMsg;

  const SearchEventOutput(this.events, this.totalCount, {this.errorMsg});
}
