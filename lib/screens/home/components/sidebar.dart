import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

import '../widgets/home_drawer.dart';
import '../widgets/logo.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    this.minWidth = 63,
    this.maxWidth = 255,
    this.initialWidth = 255,
    this.dividerWidth = 6,
  });

  final double minWidth;
  final double maxWidth;
  final double initialWidth;
  final double dividerWidth;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  late ValueNotifier<double> width = ValueNotifier(widget.initialWidth);

  @override
  void didUpdateWidget(covariant Sidebar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.maxWidth != oldWidget.maxWidth || widget.minWidth != oldWidget.minWidth) {
      if (width.value >= widget.maxWidth) {
        width.value = widget.maxWidth;
      }
      if (width.value <= widget.minWidth) {
        width.value = widget.minWidth;
      }
    }
  }

  void _onToggleExpanded() {
    width.value = width.value >= widget.maxWidth ? widget.minWidth : widget.maxWidth;
  }

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.SHOW_HOME_SIDEBAR) return SizedBox.shrink();

    return ValueListenableBuilder<double>(
      valueListenable: width,
      builder: (context, value, child) => AnimatedContainer(
        duration: Durations.short2,
        width: value + widget.dividerWidth,
        height: double.infinity,
        color: AppColors.contentBg,
        child: Column(
          children: [
            Logo(onToggle: _onToggleExpanded, isExpanded: value >= widget.maxWidth),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: HomeDrawer(maxWidth: widget.maxWidth)),
                  Container(
                    height: double.infinity,
                    width: widget.dividerWidth,
                    color: AppColors.scaffoldBg,
                  ),
                  // MouseRegion(
                  //   cursor: SystemMouseCursors.resizeColumn,
                  //   child: GestureDetector(
                  //     onHorizontalDragStart: (_) =>
                  //         widget.onCursorChange?.call(SystemMouseCursors.resizeColumn),
                  //     onHorizontalDragEnd: (_) => widget.onCursorChange?.call(MouseCursor.defer),
                  //     onHorizontalDragUpdate: (details) {
                  //       if (details.primaryDelta == null) return;

                  //       var newOffset = width.value + min(details.primaryDelta!, 60);
                  //       if (newOffset <= widget.minWidth) {
                  //         width.value = widget.minWidth;
                  //       } else if (newOffset >= widget.maxWidth) {
                  //         width.value = widget.maxWidth;
                  //       } else {
                  //         width.value = newOffset;
                  //       }
                  //     },
                  //     child: Container(
                  //       width: widget.dividerWidth,
                  //       height: double.infinity,
                  //       color: Colors.white70,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
