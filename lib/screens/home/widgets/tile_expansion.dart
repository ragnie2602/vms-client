import 'package:flutter/material.dart';

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
        onTap: () => controller.isExpanded ? controller.collapse() : controller.expand(),
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
          Icon(Icons.arrow_drop_down),
          SizedBox(width: 6),
        ],
      );
    }

    return widget.header;
  }
}
