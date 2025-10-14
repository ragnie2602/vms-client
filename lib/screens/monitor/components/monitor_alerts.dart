import 'package:flutter/material.dart';

class MonitorAlerts extends StatelessWidget {
  const MonitorAlerts({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Danh sách cảnh báo"),
    );
  }
}
