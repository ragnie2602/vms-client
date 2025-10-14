import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

import '../components/monitor_actions.dart';
import '../widgets/monitor_panel.dart';

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
  late final GlobalKey<MonitorPanelState> _leftPanelKey = GlobalKey();
  late final GlobalKey<MonitorPanelState> _rightPanelKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MonitorActions(leftPanelKey: _leftPanelKey, rightPanelKey: _rightPanelKey),
        Container(width: double.infinity, height: 1, color: AppColors.scaffoldBg),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MonitorPanel(width: widget.leftPanelWidth, key: _leftPanelKey),

              Expanded(
                child: Padding(padding: const EdgeInsets.all(20), child: widget.content),
              ),

              MonitorPanel(width: widget.rightPanelWidth, key: _rightPanelKey),
            ],
          ),
        ),
      ],
    );
  }
}
