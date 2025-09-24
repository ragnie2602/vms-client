import 'package:flutter/material.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import 'widgets/camera_view.dart';

class MonitorLiveView extends StatelessWidget {
  final CameraEntity data;
  final VoidCallback? onBack;
  const MonitorLiveView({super.key, required this.data, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 13),
          onPressed: onBack,
          label: Text("Quay lại", style: TextStyle(color: Colors.black, fontSize: 13)),
        ),

        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CameraView(data: data, index: -1, isLiveView: true),
          ),
        ),
      ],
    );
  }
}
