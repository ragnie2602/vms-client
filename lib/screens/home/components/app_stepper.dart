import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class AppStepper extends StatelessWidget {
  final List<String> listStepName;
  final int currentStepIndex;

  const AppStepper({
    super.key,
    required this.listStepName,
    required this.currentStepIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(listStepName.length, (index) {
        final isLast = index == listStepName.length - 1;
        final isActive = index == currentStepIndex;
        final isDone = index < currentStepIndex;

        return [
          _buildStep(index + 1, listStepName[index], isActive, isDone),
          if (!isLast) _buildDivider(),
        ];
      }).expand((e) => e).toList(),
    );
  }

  Widget _buildStep(int stepNumber, String title, bool isActive, bool isDone) {
    final activeColor = AppColors.blue005EB8; // Indigo blue
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isActive)
                Positioned.fill(
                  child: CustomPaint(
                    painter: DashedCirclePainter(
                      color: activeColor,
                      strokeWidth: 2.0,
                      dashWidth: 6.0,
                      dashSpace: 4.0,
                    ),
                  ),
                ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isActive || isDone)
                      ? activeColor
                      : AppColors.greyC6C6C6,
                ),
                child: Center(
                  child: isDone
                      ? const Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 20,
                        )
                      : Text(
                          stepNumber.toString(),
                          style: AppTypography.style(
                            16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 120,
      height: 2,
      margin: const EdgeInsets.only(top: 28),
      color: const Color(0xFFD1D5DB),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedCirclePainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    final ui.PathMetrics pathMetrics = path.computeMetrics();
    for (ui.PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final length = distance + dashWidth;
        canvas.drawPath(pathMetric.extractPath(distance, length), paint);
        distance = length + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedCirclePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
