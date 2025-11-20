import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/utils/task_pool.dart';

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

    // Mỗi lần mở lại tab monitoring thì load lại danh sách --> Đồng bộ khi xóa/thêm camera
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
      // Có Theme.of(context) --> build lại child khi đổi theme
      color: Theme.of(context).scaffoldBackgroundColor,
      child: MonitorDesktopLayout(content: widget.child),
    );
  }
}
