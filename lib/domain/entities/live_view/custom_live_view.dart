import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';

class CustomLiveView {
  final List<int> id;
  final BaseView base;
  final List<LiveViewPosition> positions;
  final String name;

  const CustomLiveView({
    required this.id,
    required this.base,
    required this.positions,
    required this.name,
  });
}
