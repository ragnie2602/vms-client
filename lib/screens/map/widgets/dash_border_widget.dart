import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class DashedBorderPainter extends CustomPainter {
  final bool? isError;
  DashedBorderPainter({this.isError});

  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 6;
    const double dashSpace = 4;
    final Paint paint = Paint()
      ..color = isError == true ? AppColors.redFF0004 : Colors.grey.shade300
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(8),
    );

    final Path path = Path()..addRRect(rrect);
    final PathMetrics metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double end = distance + dashWidth;
        final Path extractPath = metric.extractPath(
          distance,
          end.clamp(0, metric.length),
        );
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
