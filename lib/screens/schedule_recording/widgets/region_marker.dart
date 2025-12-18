import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class RegionMarker extends StatefulWidget {
  const RegionMarker({super.key});

  @override
  State<RegionMarker> createState() => _RegionMarkerState();
}

class _RegionMarkerState extends State<RegionMarker> {
  Size? widgetSize;

  final FocusNode _focusNode = FocusNode();
  bool isDrawing = true;
  final ValueNotifier<List<Offset>> pointsNotifier = ValueNotifier<List<Offset>>([]);

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
          isDrawing = false;
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          widgetSize = Size(constraints.maxWidth, constraints.maxHeight);

          return MouseRegion(
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
                  children: [
                    Image.network(
                      'https://preview.redd.it/silksong-100-map-v0-3qcwvcx0phrf1.png?width=640&crop=smart&auto=webp&s=85efdac4b8ccfd8a81039ecb447fe59ff70629bc',
                      fit: BoxFit.cover,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                    RepaintBoundary(
                      child: ValueListenableBuilder<List<Offset>>(
                        valueListenable: pointsNotifier,
                        builder: (_, points, _) => CustomPaint(
                          painter: PolygonPainter(points: points),
                          size: widgetSize!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
    if (widgetSize == null || !isDrawing) return;

    final normalizedPoint = Offset(
      localPosition.dx / widgetSize!.width,
      localPosition.dy / widgetSize!.height,
    );

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.add(normalizedPoint);
    pointsNotifier.value = currentPoints;
  }

  void _removeLastPoint() {
    if (!isDrawing || pointsNotifier.value.isEmpty) return;

    final currentPoints = List<Offset>.from(pointsNotifier.value);
    currentPoints.removeLast();
    pointsNotifier.value = currentPoints;
  }

  void _updateHoverPoint(Offset localPosition) {
    if (widgetSize == null || !isDrawing || pointsNotifier.value.isEmpty) return;

    final normalizedPoint = Offset(
      localPosition.dx / widgetSize!.width,
      localPosition.dy / widgetSize!.height,
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
