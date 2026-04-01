import 'package:flutter/material.dart';

/* CAUTIONS:
 * - With any flex row, the table needs wrapping in a Expanded widget.
 */
class CustomTable extends StatelessWidget {
  final Widget Function(String value)? cellBuilder;
  final double columnSpacing;
  final CustomTableData data;
  final CrossAxisAlignment? defaultVerticalAlignment;
  final Widget Function(int i, String value)? headerBuilder;
  final List<CrossAxisAlignment?>? horizontalAlignments;
  final double rowSpacing;
  final List<CrossAxisAlignment>? verticalAlignments;
  final Widget? verticalBorder;

  const CustomTable({
    super.key,
    this.cellBuilder,
    this.columnSpacing = 0,
    required this.data,
    this.defaultVerticalAlignment,
    this.headerBuilder,
    this.horizontalAlignments,
    this.rowSpacing = 0,
    this.verticalBorder,
    this.verticalAlignments,
  });

  bool get isExpanded => data.rowFlexes != null && data.rowFlexes!.any((element) => element != 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._buildHeader(),
        isExpanded ? Expanded(child: _buildBody()) : _buildBody(),
      ],
    );
  }

  Iterable<Widget> _buildHeader() {
    if (data.headers != null) {
      return [
        Row(
          children: [
            for (var h = 0; h < data.headers!.length; h++)
              Expanded(
                flex: data.columnFlexes[h],
                child: headerBuilder?.call(h, data.headers![h]) ?? Text(data.headers![h]),
              ),
          ],
        ),
      ];
    }
    return [];
  }

  Widget _buildBody() {
    _getHorizontalAlignment(int c) {
      if (horizontalAlignments != null && horizontalAlignments!.length > c) {
        if (horizontalAlignments![c] == CrossAxisAlignment.end) {
          return Alignment.centerRight;
        }
        if (horizontalAlignments![c] == CrossAxisAlignment.center) {
          return Alignment.center;
        }
        if (horizontalAlignments![c] == null) {
          return null;
        }
      }
      return Alignment.centerLeft;
    }

    _getVerticalAlignment(int r) {
      if (verticalAlignments != null && verticalAlignments!.length > r) {
        return verticalAlignments![r];
      }
      return defaultVerticalAlignment ?? CrossAxisAlignment.start;
    }

    return Column(
      children: [
        for (int r = 0; r < data.data.length; r++) ...[
          () {
            final core = Row(
              crossAxisAlignment: _getVerticalAlignment(r),
              children: [
                for (int c = 0; c < data.data[r].length; c++) ...[
                  Expanded(
                    flex: data.columnFlexes[c],
                    child: _getHorizontalAlignment(c) == null
                        ? data.data[r][c]
                        : Align(alignment: _getHorizontalAlignment(c)!, child: data.data[r][c]),
                  ),
                  if (c < data.data[r].length - 1) SizedBox(width: columnSpacing),
                ],
              ],
            );
            return (data.rowFlexes?[r] != null && data.rowFlexes![r] != 0)
                ? Expanded(flex: data.rowFlexes?[r] ?? 1, child: core)
                : core;
          }(),
          if (verticalBorder != null) verticalBorder!,
          if (r < data.data.length - 1) SizedBox(height: rowSpacing),
        ],
      ],
    );
  }
}

/* CAUTIONS:
 * - The rowFlexes must be greater than or equal the data.length.
 * - The columnFlexes must be greater than or equal any data[r].length.
 */
class CustomTableData {
  final List<int> columnFlexes;
  final List<List<Widget>> data;
  final List<String>? headers;
  final List<int>? rowFlexes;

  CustomTableData({required this.columnFlexes, required this.data, this.headers, this.rowFlexes});
}
