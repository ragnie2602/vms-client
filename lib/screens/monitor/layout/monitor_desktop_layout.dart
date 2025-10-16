import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

import '../../shared/panel.dart';
import '../components/monitor_actions.dart';

class MonitorDesktopLayout extends StatefulWidget {
  const MonitorDesktopLayout({
    super.key,
    required this.content,
    this.leftPanelWidth = 281,
    this.rightPanelWidth = 280,
  });
  final Widget content;
  final double leftPanelWidth;
  final double rightPanelWidth;

  @override
  State<MonitorDesktopLayout> createState() => _MonitorDesktopLayoutState();
}

class _MonitorDesktopLayoutState extends State<MonitorDesktopLayout> {
  late final PanelController _leftController = PanelController();
  late final PanelController _rightController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MonitorActions(leftController: _leftController, rightController: _rightController),
        Container(width: double.infinity, height: 1, color: AppColors.scaffoldBg),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Panel(expandedWidth: widget.leftPanelWidth, controller: _leftController),

              Expanded(
                child: Padding(padding: const EdgeInsets.all(20), child: widget.content),
              ),

              Panel(expandedWidth: widget.rightPanelWidth, controller: _rightController),
            ],
          ),
        ),
      ],
    );
  }
}
