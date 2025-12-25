import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/utils/task_pool.dart';
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
    if (context.read<MonitorBloc>().shouldRefreshAllCameras) {
      context.read<MonitorBloc>().add(GetAllCamera(refresh: true));
    }
    super.initState();
  }

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
      child: PlatformBuilder.builder(
        onDesktop: (context) => MonitorDesktopLayout(content: widget.child),
        onMobile: (context) => Center(child: Text("Anh chỉ muốn qua nhà em tặng 1 đóa hoa")),
      ),
    );
  }
}
