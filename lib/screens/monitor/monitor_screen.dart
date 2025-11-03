import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/utils/task_pool.dart';

import 'layout/monitor_desktop_layout.dart';

class MonitorScreen extends StatefulWidget {
  final Widget child;

  const MonitorScreen({super.key, required this.child});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  @override
  void dispose() {
    TaskPool.instance.clean();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Có Theme.of(context) --> build lại child khi đổi theme
      color: Theme.of(context).scaffoldBackgroundColor,
      child: MonitorDesktopLayout(content: widget.child),
    );
  }
}
