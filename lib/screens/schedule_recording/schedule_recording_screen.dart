import 'package:flutter/material.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/list_camera_view.dart';

class ScheduleRecordingScreen extends StatelessWidget {
  const ScheduleRecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 2, child: ListCameraView()),
        Flexible(flex: 7, child: Center(child: Text('Schedule'))),
      ],
    );
  }
}
