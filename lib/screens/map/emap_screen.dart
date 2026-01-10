import 'package:flutter/material.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/widgets/list_map_view.dart';
import 'package:vms_flutter_client/screens/map/widgets/map_view.dart';

class EmapScreen extends StatelessWidget {
  final ValueNotifier<EmapEntity?> selectedEmap = ValueNotifier(null);

  EmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 2, child: ListMapView(selectedEmap: selectedEmap)),
        Flexible(flex: 7, child: MapView(selectedEmap: selectedEmap)),
      ],
    );
  }
}
