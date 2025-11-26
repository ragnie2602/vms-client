import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/utils/task_pool.dart';
import 'package:vms_flutter_client/screens/monitor/mobile_monitor_list.dart';
import 'package:vms_flutter_client/screens/shared/platform_builder.dart';

import 'bloc/monitor/monitor_bloc.dart';
import 'layout/monitor_desktop_layout.dart';

class MonitorScreen extends StatefulWidget {
  final Widget child;

  const MonitorScreen({super.key, required this.child});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MonitorBloc>().add(GetAllCamera());
  }

  @override
  void dispose() {
    TaskPool.instance.clean();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: PlatformBuilder.builder(
        onDesktop: (context) => MonitorDesktopLayout(content: widget.child),
        onMobile: (context) => MobileMonitorList(),
      ),
    );
  }
}
