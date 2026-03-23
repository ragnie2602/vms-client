import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

class TileExpansion extends StatefulWidget {
  const TileExpansion({
    super.key,
    required this.body,
    required this.header,
    this.showTrailing = true,
    this.maintainState = true,
  });

  final Widget body;
  final Widget header;
  final bool showTrailing;
  final bool maintainState;

  @override
  State<TileExpansion> createState() => _TileExpansionState();
}

class _TileExpansionState extends State<TileExpansion> {
  late final ExpansibleController controller = ExpansibleController();

  @override
  Widget build(BuildContext context) {
    return Expansible(
      headerBuilder: (context, animation) => InkWell(
        onTap: () =>
            controller.isExpanded ? controller.collapse() : controller.expand(),
        child: _buildHeader(),
      ),
      bodyBuilder: (context, animation) => widget.body,
      maintainState: widget.maintainState,
      controller: controller,
    );
  }

  Widget _buildHeader() {
    if (widget.showTrailing) {
      return Row(
        children: [
          Expanded(child: widget.header),
          TweenAnimationBuilder<double>(
            tween: Tween(
              begin: controller.isExpanded ? 180 : 0,
              end: controller.isExpanded ? 0 : 180,
            ),
            duration: Durations.short4,
            builder: (context, angle, child) {
              return Transform.rotate(
                angle: angle * (math.pi / 180), // đổi độ sang radian
                child: child,
              );
            },
            child: SvgPicture.asset(
              AppAssets.icDropdown,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(width: 6),
        ],
      );
    }

    return widget.header;
  }
}
