import 'package:flutter/material.dart';

class TagShapeIcon extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const TagShapeIcon({super.key, required this.color, this.width = 36, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(width, height), painter: _TagShapePainter(color));
  }
}

class _TagShapePainter extends CustomPainter {
  final Color color;
  _TagShapePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    // Vuông bên trái, nhọn bên phải
    path.moveTo(0, 0); // Top-left
    path.lineTo(size.width - size.height / 2, 0); // Top-right before tip
    path.lineTo(size.width, size.height / 2); // Tip
    path.lineTo(size.width - size.height / 2, size.height); // Bottom-right before tip
    path.lineTo(0, size.height); // Bottom-left
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TagShapePainter oldDelegate) => oldDelegate.color != color;
}
