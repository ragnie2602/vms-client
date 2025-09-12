import 'package:flutter/material.dart';
import 'package:vms_flutter_client/screens/common/platform_widget.dart';

import 'camera_data.dart';
import 'widgets/camera_view.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget.builder(
      onAndroid: (context) => Container(),
      onIOS: (context) => Container(),
      onMacOS: (context) => Container(),
      onWindows: (context) => Scrollbar(
        thumbVisibility: true,
        child: GridView.count(
          cacheExtent: 100000, // build hết 36 camera
          primary: true, // true thì scrollbar bên ngoài ms có thể handle đc
          crossAxisCount: 6,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          children: List.generate(24, (index) {
            return CameraView(
              index: index,
              data: CameraData.cameras[index % CameraData.cameras.length],
            );
          }),
        ),
      ),
    );
  }
}
