import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class MonitorPanel extends StatefulWidget {
  const MonitorPanel({super.key, required this.width});
  final double width;

  @override
  State<MonitorPanel> createState() => MonitorPanelState();
}

class MonitorPanelState extends State<MonitorPanel> {
  late final ValueNotifier<double> _panelWidth = ValueNotifier(0);

  Completer<void> _completer = Completer<void>();
  bool get isOpening => _panelWidth.value == widget.width;
  double get maxWidth => widget.width;

  Widget? content;
  Function(int?)? onPanelIndexChanged;

  @override
  void dispose() {
    _panelWidth.dispose();
    super.dispose();
  }

  Future<void> togglePanel(
    Widget content, {
    int? id,
    Function(int?)? onPanelIndexChanged,
    bool closePrevious = false,
  }) async {
    this.onPanelIndexChanged = onPanelIndexChanged;
    this.onPanelIndexChanged?.call(id);

    if (isOpening && this.content != null && this.content!.key != content.key) {
      if (closePrevious) {
        _completer = Completer<void>();
        _panelWidth.value = 0;
        await _completer.future;
      } else {
        this.content = content;
        setState(() {});
        return;
      }
    }

    this.content = content;
    _panelWidth.value = _panelWidth.value == 0 ? widget.width : 0;
    if (!isOpening) this.onPanelIndexChanged?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _panelWidth,
      builder: (context, width, child) => AnimatedContainer(
        duration: Durations.medium1,
        width: width,
        height: double.infinity,
        color: AppColors.contentBg,
        onEnd: () => !_completer.isCompleted ? _completer.complete() : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
              child: InkWell(
                onTap: () {
                  _panelWidth.value = 0;
                  onPanelIndexChanged?.call(null);
                },
                child: SvgPicture.asset(AppAssets.icClose),
              ),
            ),
            if (content != null) Expanded(child: content!),
          ],
        ),
      ),
    );
  }
}
