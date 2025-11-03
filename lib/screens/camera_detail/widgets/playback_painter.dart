import 'package:flutter/material.dart';

class PlaybackPainter extends CustomPainter {
  final Color lineColor;
  final Color circleColor;
  final double lineWidth;
  final double circleSize;

  PlaybackPainter({
    this.lineColor = const Color(0xFFC3D3D9),
    this.circleColor = const Color(0xFF15ABFF),
    this.lineWidth = 1,
    this.circleSize = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = lineWidth
      ..color = lineColor
      ..style = PaintingStyle.stroke;

    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2, 0)
        ..lineTo(size.width / 2, size.height),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      circleSize / 2,
      paint
        ..color = circleColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
