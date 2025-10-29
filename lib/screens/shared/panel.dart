import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class PanelController {
  late Future<void> Function(Widget content, {int? id, Function(int?)? onPanelIndexChanged})
  togglePanel;
  late void Function() closePanel;

  late double expandedWidth;
}

class Panel extends StatefulWidget {
  final double expandedWidth;
  final PanelController? controller;
  const Panel({super.key, required this.expandedWidth, this.controller});

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  late final ValueNotifier<double> _width = ValueNotifier(0);

  Widget? content;
  Function(int?)? onPanelIndexChanged;
  bool get isOpening => _width.value == widget.expandedWidth;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.expandedWidth = widget.expandedWidth;
      widget.controller!.togglePanel = togglePanel;
      widget.controller!.closePanel = closePanel;
    }

    super.initState();
  }

  @override
  void dispose() {
    _width.dispose();
    super.dispose();
  }

  Future<void> togglePanel(Widget content, {int? id, Function(int?)? onPanelIndexChanged}) async {
    this.onPanelIndexChanged = onPanelIndexChanged;
    this.onPanelIndexChanged?.call(id);

    if (isOpening && this.content != null && this.content!.key != content.key) {
      this.content = content;
      setState(() {});
      return;
    }

    this.content = content;
    _width.value = _width.value == 0 ? widget.expandedWidth : 0;
    if (!isOpening) this.onPanelIndexChanged?.call(null);
  }

  void closePanel() {
    if (!isOpening) return;
    _width.value = 0;
    onPanelIndexChanged?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _width,
      builder: (context, width, child) => AnimatedContainer(
        duration: Durations.medium1,
        width: width,
        height: double.infinity,
        color: AppColors.contentBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
              child: InkWell(
                onTap: () {
                  _width.value = 0;
                  onPanelIndexChanged?.call(null);
                },
                child: SvgPicture.asset(AppAssets.icClose),
              ),
            ),
            if (content != null && isOpening) Expanded(child: content!),
          ],
        ),
      ),
    );
  }
}
