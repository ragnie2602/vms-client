import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

const double ICON_SIZE = 20;

class RegionMarker extends StatefulWidget {
  const RegionMarker({super.key});

  @override
  State<RegionMarker> createState() => RegionMarkerState();
}

class RegionMarkerState extends State<RegionMarker> {
  final GlobalKey _stackKey = GlobalKey();
  Size? _size;

  final FocusNode _focusNode = FocusNode();
  bool isDrawing = true;
  final ValueNotifier<List<Offset>> pointsNotifier = ValueNotifier<List<Offset>>([]);

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
          setState(() => isDrawing = false);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.precise,
        onEnter: (event) => _addPoint(event.localPosition),
        onHover: (event) => _updateHoverPoint(event.localPosition),
        onExit: (_) => _removeLastPoint(),
        child: Listener(
          onPointerDown: (event) {
            _focusNode.requestFocus();
            _addPoint(event.localPosition);
          },
          child: GestureDetector(
            onDoubleTap: () => isDrawing = false,
            child: Stack(
              key: _stackKey,
              fit: StackFit.passthrough,
              children: [
                Image.network(
                  'https://preview.redd.it/silksong-100-map-v0-3qcwvcx0phrf1.png?width=640&crop=smart&auto=webp&s=85efdac4b8ccfd8a81039ecb447fe59ff70629bc',
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => _size = context.size);
                    return child;
                  },
                ),
                Positioned.fill(
                  child: RepaintBoundary(
                    child: ValueListenableBuilder<List<Offset>>(
                      valueListenable: pointsNotifier,
                      builder: (_, points, _) =>
                          CustomPaint(painter: PolygonPainter(points: points)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    pointsNotifier.dispose();
    super.dispose();
  }

  void _addPoint(Offset localPosition) {
    if (_size == null || !isDrawing) return;

    final normalizedPoint = Offset(
      localPosition.dx / _size!.width,
      localPosition.dy / _size!.height,
    );

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.add(normalizedPoint);
    pointsNotifier.value = currentPoints;
  }

  void clearRegion() {
    if (pointsNotifier.value.isEmpty) return;

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.clear();
    pointsNotifier.value = currentPoints;

    isDrawing = true;
  }

  // Offset _getClearPosition(List<Offset> points, BoxConstraints constraints) {
  //   if (points.length <= 1) return Offset.zero;

  //   final _points = List<Offset>.from(points)
  //     ..sort((a, b) {
  //       if (b.dx > a.dx || (b.dx == a.dx && b.dy < a.dy)) return -1;
  //       return 1;
  //     });

  //   var fp = _points.last;
  //   if (fp.dx * constraints.maxWidth + ICON_SIZE <= constraints.maxWidth &&
  //       fp.dy * constraints.maxHeight - ICON_SIZE >= 0) {
  //     return Offset(
  //       fp.dx * constraints.maxWidth + ICON_SIZE,
  //       fp.dy * constraints.maxHeight - ICON_SIZE,
  //     );
  //   }
  //   fp = _points[_points.length - 2];
  //   if (fp.dx * constraints.maxWidth + ICON_SIZE <= constraints.maxWidth &&
  //       fp.dy * constraints.maxHeight + ICON_SIZE <= constraints.maxHeight) {
  //     return Offset(
  //       fp.dx * constraints.maxWidth + ICON_SIZE,
  //       fp.dy * constraints.maxHeight + ICON_SIZE,
  //     );
  //   }
  //   fp = _points.first;
  //   if (fp.dx * constraints.maxWidth - ICON_SIZE >= 0 &&
  //       fp.dy * constraints.maxHeight - ICON_SIZE >= 0) {
  //     return Offset(
  //       fp.dx * constraints.maxWidth - ICON_SIZE,
  //       fp.dy * constraints.maxHeight - ICON_SIZE,
  //     );
  //   }
  //   fp = _points[1];
  //   if (fp.dx * constraints.maxWidth - ICON_SIZE >= 0 &&
  //       fp.dy * constraints.maxHeight + ICON_SIZE <= constraints.maxHeight) {
  //     return Offset(
  //       fp.dx * constraints.maxWidth - ICON_SIZE,
  //       fp.dy * constraints.maxHeight + ICON_SIZE,
  //     );
  //   }

  //   return Offset.zero;
  // }

  void _removeLastPoint() {
    if (!isDrawing || pointsNotifier.value.isEmpty) return;

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.removeLast();
    pointsNotifier.value = currentPoints;
  }

  void _updateHoverPoint(Offset localPosition) {
    if (_size == null || !isDrawing || pointsNotifier.value.isEmpty) return;

    final normalizedPoint = Offset(
      localPosition.dx / _size!.width,
      localPosition.dy / _size!.height,
    );

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints[currentPoints.length - 1] = normalizedPoint;
    pointsNotifier.value = currentPoints;
  }
}

class PolygonPainter extends CustomPainter {
  final List<Offset> points;
  PolygonPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final areaPaint = Paint()
      ..color = AppColors.blue15ABFF.withAlpha(77)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path path = Path();

    Offset startPoint = Offset(points[0].dx * size.width, points[0].dy * size.height);
    path.moveTo(startPoint.dx, startPoint.dy);
    for (var i = 1; i < points.length; i++) {
      Offset current = Offset(points[i].dx * size.width, points[i].dy * size.height);
      path.lineTo(current.dx, current.dy);
    }
    path.close();

    canvas.drawPath(path, areaPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(PolygonPainter oldDelegate) => oldDelegate.points != points;
}

class LineMarker extends StatefulWidget {
  const LineMarker({super.key});

  @override
  State<LineMarker> createState() => LineMarkerState();
}

class LineMarkerState extends State<LineMarker> {
  Size? _size;

  bool isDrawing = true;
  final ValueNotifier<List<Offset>> pointsNotifier = ValueNotifier<List<Offset>>([]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: MouseRegion(
        cursor: SystemMouseCursors.precise,
        onEnter: (event) => _addPoint(event.localPosition),
        onHover: (event) => _updateHoverPoint(event.localPosition),
        onExit: (_) => _removeLastPoint(),
        child: Listener(
          onPointerDown: (event) {
            _addPoint(event.localPosition);
            if (pointsNotifier.value.length > 2) {
              isDrawing = false;
              _removeLastPoint();
            }
          },
          child: GestureDetector(
            onDoubleTap: () => isDrawing = false,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Image.network(
                  'https://cdn.mos.cms.futurecdn.net/8iKiEgFUf7fhvoApnwGUCW.jpg',
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => _size = context.size);
                    return child;
                  },
                ),
                Positioned.fill(
                  child: ValueListenableBuilder(
                    valueListenable: pointsNotifier,
                    builder: (context, points, _) =>
                        CustomPaint(painter: LinePainter(points: points)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addPoint(Offset localPosition) {
    if (_size == null || !isDrawing) return;

    final normalizedPoint = Offset(
      localPosition.dx / _size!.width,
      localPosition.dy / _size!.height,
    );

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.add(normalizedPoint);
    pointsNotifier.value = currentPoints;
  }

  void clearRegion() {
    if (pointsNotifier.value.isEmpty) return;

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.clear();
    pointsNotifier.value = currentPoints;

    isDrawing = true;
  }

  void _removeLastPoint() {
    if (!isDrawing || pointsNotifier.value.isEmpty) return;

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.removeLast();
    pointsNotifier.value = currentPoints;
  }

  void _updateHoverPoint(Offset localPosition) {
    if (_size == null || !isDrawing || pointsNotifier.value.isEmpty) return;

    final normalizedPoint = Offset(
      localPosition.dx / _size!.width,
      localPosition.dy / _size!.height,
    );

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints[currentPoints.length - 1] = normalizedPoint;
    pointsNotifier.value = currentPoints;
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> points;
  LinePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final pointPaint = Paint()
      ..color = AppColors.blue005AA9
      ..style = PaintingStyle.fill;

    for (var point in points) {
      canvas.drawCircle(Offset(point.dx * size.width, point.dy * size.height), 5, pointPaint);
    }

    if (points.length < 2) return;

    final start = Offset(points[0].dx * size.width, points[0].dy * size.height);
    final end = Offset(points[1].dx * size.width, points[1].dy * size.height);

    final linePaint = Paint()
      ..color = AppColors.blue005AA9
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(start, end, linePaint);

    final arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final (a, b) = _getArrowPoints(start, end, size);
    canvas.drawLine(a, b, arrowPaint);

    arrowPaint.style = PaintingStyle.fill;
    _drawArrowHead(canvas, a, b, arrowPaint);
    _drawArrowHead(canvas, b, a, arrowPaint);

    _drawLabel(canvas, a, 'A');
    _drawLabel(canvas, b, 'B');
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => oldDelegate.points != points;

  void _drawArrowHead(Canvas canvas, Offset from, Offset to, Paint paint) {
    const arrLen = 12;

    final dx = to.dx - from.dx;
    final dy = to.dy - from.dy;
    final len = sqrt(dx * dx + dy * dy);
    if (len == 0) return;

    final ux = dx / len;
    final uy = dy / len;

    final centerBase = Offset(to.dx - arrLen * sqrt(3) * ux / 2, to.dy - arrLen * sqrt(3) * uy / 2);

    final perpX = -uy;
    final perpY = ux;
    final halfBase = arrLen / 2;

    final base1 = Offset(centerBase.dx + perpX * halfBase, centerBase.dy + perpY * halfBase);
    final base2 = Offset(centerBase.dx - perpX * halfBase, centerBase.dy - perpY * halfBase);

    final path = Path()
      ..moveTo(to.dx, to.dy)
      ..lineTo(base1.dx, base1.dy)
      ..lineTo(base2.dx, base2.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  (Offset, Offset) _getArrowPoints(Offset start, Offset end, Size size) {
    const arrowLength = 30.0;

    final alpha = atan2(end.dy - start.dy, end.dx - start.dx);
    final center = Offset((start.dx + end.dx) / 2, (start.dy + end.dy) / 2);
    final normal = Offset(-sin(alpha), cos(alpha));

    Offset a = center + normal * arrowLength;
    Offset b = center - normal * arrowLength;

    // bool _inBounds(Offset p) => p.dx >= 0 && p.dx <= size.width && p.dy >= 0 && p.dy <= size.height;

    // if (!_inBounds(a)) {
    //   var delta = max((0 - a.dx) / normal.dx, (a.dy - size.height) / normal.dy);
    //   a = a - normal * delta;
    // } else if (!_inBounds(b)) {
    //   var delta = max((b.dx - size.width) / normal.dx, (0 - b.dy) / normal.dy);
    //   b = b - normal * delta;
    // }

    return (a, b);
  }

  void _drawLabel(Canvas canvas, Offset position, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final offset = Offset(position.dx + 6, position.dy - textPainter.height - 2);

    textPainter.paint(canvas, offset);
  }
}
