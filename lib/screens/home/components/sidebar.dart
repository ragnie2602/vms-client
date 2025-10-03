import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/home_drawer.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    this.minWidth = 50,
    this.maxWidth = 300,
    this.initialWidth = 200,
    this.dividerWidth = 1,
    this.onCursorChange,
    this.enable = true,
  });

  final double minWidth;
  final double maxWidth;
  final double initialWidth;
  final double dividerWidth;
  final Function(MouseCursor)? onCursorChange;
  final bool enable;

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

  @override
  Widget build(BuildContext context) {
    if (!widget.enable) return SizedBox.shrink();

    return ValueListenableBuilder<double>(
      valueListenable: width,
      builder: (context, value, child) => AnimatedContainer(
        duration: Durations.short2,
        width: value + widget.dividerWidth,
        height: double.infinity,
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Row(
          children: <Widget>[
            Expanded(child: HomeDrawer()),
            MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: GestureDetector(
                onHorizontalDragStart: (_) =>
                    widget.onCursorChange?.call(SystemMouseCursors.resizeColumn),
                onHorizontalDragEnd: (_) => widget.onCursorChange?.call(MouseCursor.defer),
                onHorizontalDragUpdate: (details) {
                  if (details.primaryDelta == null) return;

                  var newOffset = width.value + min(details.primaryDelta!, 60);
                  if (newOffset <= widget.minWidth) {
                    width.value = widget.minWidth;
                  } else if (newOffset >= widget.maxWidth) {
                    width.value = widget.maxWidth;
                  } else {
                    width.value = newOffset;
                  }
                },
                child: Container(
                  width: widget.dividerWidth,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 30,
                        offset: Offset(0, 20),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
