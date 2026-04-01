import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission.dart';

class PermissionItem extends StatefulWidget {
  final String title;
  final List<Permission> permissions;
  final int depth;
  final bool isLast;
  final List<bool> ancestorHasNext;
  final ValueNotifier<Set<int>> selectedIds;

  const PermissionItem(
    this.permissions,
    this.title, {
    super.key,
    this.depth = 0,
    this.isLast = true,
    this.ancestorHasNext = const [],
    required this.selectedIds,
  });

  @override
  State<PermissionItem> createState() => _PermissionItemState();
}

class _PermissionItemState extends State<PermissionItem> {
  final Map<String, List<Permission>> _pTree = {};

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    for (final p in widget.permissions) {
      if (p.name.isEmpty) continue;

      final key = p.name.split('.').first;
      final _permission = p.copyWith(
        name: key.length < p.name.length ? p.name.substring(key.length + 1) : p.name,
      );

      if (_pTree.containsKey(key)) {
        _pTree[key]!.add(_permission);
      } else {
        _pTree[key] = [_permission];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const double indent = 20;
    final entries = _pTree.entries.toList();

    return ListTileTheme(
      data: const ListTileThemeData(minLeadingWidth: 16, horizontalTitleGap: 8),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        dense: true,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.depth > 0)
              SizedBox(
                width: widget.depth * indent,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Vẽ theo đúng chiều cao row hiện tại để các đoạn dọc nối liền nhau.
                    return CustomPaint(
                      size: Size(widget.depth * indent, constraints.maxHeight),
                      painter: _TreeLinesPainter(
                        depth: widget.depth,
                        ancestorHasNext: widget.ancestorHasNext,
                        isLast: widget.isLast,
                        lineColor: AppColors.greyE4E7EC,
                      ),
                    );
                  },
                ),
              ),
            if (_pTree.isNotEmpty)
              Icon(
                _isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                color: AppColors.grey94A3B8,
                size: 16,
              ),
          ],
        ),
        onExpansionChanged: (value) => setState(() => _isExpanded = value),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        showTrailingIcon: false,
        title: _title(indent: indent),
        tilePadding: EdgeInsets.zero,
        children: [
          for (int i = 0; i < entries.length; i++)
            PermissionItem(
              entries[i].value,
              entries[i].key,
              ancestorHasNext: widget.depth == 0
                  ? widget.ancestorHasNext
                  : [...widget.ancestorHasNext, !widget.isLast],
              depth: widget.depth + 1,
              isLast: i == entries.length - 1,
              selectedIds: widget.selectedIds,
            ),
        ],
      ),
    );
  }

  bool _isSelected(Set<int> value) {
    if (widget.permissions.length == 1) {
      return value.contains(widget.permissions.first.code);
    } else {
      return widget.permissions.every((p) => value.contains(p.code ?? ''));
    }
  }

  Widget _title({required double indent}) {
    String _title = widget.title;
    if (_pTree.isEmpty && widget.permissions.isNotEmpty) {
      _title = widget.permissions.first.name ?? '';
    }

    return Row(
      children: [
        SizedBox(
          height: 18,
          width: 18,
          child: ValueListenableBuilder(
            valueListenable: widget.selectedIds,
            builder: (context, value, child) {
              return Checkbox(
                activeColor: AppColors.secondary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  final next = Set<int>.of(widget.selectedIds.value);
                  // final ids = widget.permissions.map((e) => e.id);
                  final ids = <int>[];

                  if (value == true) {
                    next.addAll(ids);
                  } else {
                    next.removeAll(ids);
                  }
                  widget.selectedIds.value = next;
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                side: BorderSide(color: AppColors.greyE2E8F0),
                value: _isSelected(value),
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Text(_title, style: AppTypography.style(14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _TreeLinesPainter extends CustomPainter {
  final int depth;
  final List<bool> ancestorHasNext;
  final bool isLast;
  final Color lineColor;

  const _TreeLinesPainter({
    required this.depth,
    required this.ancestorHasNext,
    required this.isLast,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (depth <= 0) return;

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final midY = size.height / 2;
    final colWidth = size.width / depth;

    for (int i = 0; i < ancestorHasNext.length && i < depth - 1; i++) {
      if (!ancestorHasNext[i]) continue;
      final x = (i + 0.5) * colWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    final x = (depth - 0.5) * colWidth;
    canvas.drawLine(Offset(x, 0), Offset(x, isLast ? midY * 3 / 4 : midY), paint);
    if (!isLast) {
      canvas.drawLine(Offset(x, midY), Offset(x, size.height), paint);
    }
    canvas.drawArc(Rect.fromLTRB(x, midY / 2, size.width, midY), pi / 2, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant _TreeLinesPainter oldDelegate) {
    return oldDelegate.depth != depth ||
        oldDelegate.isLast != isLast ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.ancestorHasNext.length != ancestorHasNext.length ||
        !_listEquals(oldDelegate.ancestorHasNext, ancestorHasNext);
  }

  bool _listEquals(List<bool> a, List<bool> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
