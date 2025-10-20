import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';

class CustomLiveView {
  final List<int> id;
  final ViewMode base;
  final List<LiveViewPosition> positions;
  final String name;

  const CustomLiveView({
    required this.id,
    required this.base,
    required this.positions,
    required this.name,
  });

  CustomLiveView copyWith({List<LiveViewPosition>? positions, String? name, ViewMode? base}) {
    return CustomLiveView(
      id: id,
      base: base ?? this.base,
      positions: positions ?? this.positions,
      name: name ?? this.name,
    );
  }
}
