import 'package:flutter/material.dart';

import '../shared/state_builder_mixin.dart';
import 'layout/monitor_desktop_layout.dart';

class MonitorScreen extends StatelessWidget with StateBuilderMixin {
  final Widget child;

  const MonitorScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Có Theme.of(context) --> build lại child khi đổi theme
      color: Theme.of(context).scaffoldBackgroundColor,
      child: MonitorDesktopLayout(content: child),
    );
  }
}
