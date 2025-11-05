import 'package:flutter/material.dart';
import 'package:vms_flutter_client/screens/map/widgets/list_map_view.dart';
import 'package:vms_flutter_client/screens/map/widgets/map_view.dart';

class EmapScreen extends StatelessWidget {
  const EmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 2, child: ListMapView()),
        Flexible(flex: 7, child: MapView()),
      ],
    );
  }
}
