import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class MobileControlSpeed extends StatelessWidget {
  const MobileControlSpeed({
    super.key,
    required this.speed,
    this.disabled = false,
    required this.onSpeedChanged,
  });
  final double speed;
  final bool disabled;
  final Function(double) onSpeedChanged;

  void _showDialogSpeed(BuildContext context) {
    showDialog(context: context, builder: (context) => _buildDialogSpeed(context)).then((value) {
      if (value != null && value is double) onSpeedChanged(value);
    });
  }

  static const List<double> _speeds = [0.5, 1, 2, 4, 8, 16];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDialogSpeed(context),
      child: Center(
        child: speed == 1.0
            ? SvgPicture.asset(
                AppAssets.icSpeed,
                width: 28,
                height: 28,
                colorFilter: disabled
                    ? ColorFilter.mode(AppColors.grey64748B, BlendMode.srcIn)
                    : null,
              )
            : Text(
                '${speed % 1 == 0 ? speed.toInt() : speed}x',
                style: AppTypography.style(
                  15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackOrWhite,
                ),
              ),
      ),
    );
  }

  Widget _buildDialogSpeed(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tốc độ phát',
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.blackOrWhite,
              ),
            ),
            SizedBox(height: 22),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              alignment: WrapAlignment.center,
              children: _speeds.map((speed) => _buildItemSpeed(context, speed)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemSpeed(BuildContext context, double speed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          child: InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(speed),
            child: IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: speed == this.speed ? AppColors.blue15ABFF : AppColors.grey64748B,
                ),
                constraints: BoxConstraints(minWidth: 42, minHeight: 23),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                child: Text(
                  speed.toString(),
                  style: AppTypography.style(12, fontWeight: FontWeight.w500, color: AppColors.white),
                ),
              ),
            ),
          ),
        ),

        /*  */
        Container(
          margin: EdgeInsets.only(top: 9),
          width: 42,
          height: 23,
          child: speed == 1.0
              ? OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  child: Text(
                    'Bình thường',
                    style: AppTypography.style(
                      11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
