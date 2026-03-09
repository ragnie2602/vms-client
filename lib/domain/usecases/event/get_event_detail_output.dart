part of 'get_event_detail_usecase.dart';

class GetEventDetailOutput extends BaseOutput {
  final EventEntity event;
  final List<(Widget, String, dynamic)> displayData;

  GetEventDetailOutput({required this.event, required this.displayData});
}
