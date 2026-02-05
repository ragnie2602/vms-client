import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_alarm_config.dart';

import '../../../shared/player/audio_player.dart';

part 'title_with_tooltip.dart';
part 'properties_config.dart';
part 'roi_area_config.dart';
part 'time_ranges_config.dart';

class AlarmConfigPopup extends StatelessWidget {
  final CameraAlarmConfig alarm;
  const AlarmConfigPopup({super.key, required this.alarm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFFCFDFD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: EdgeInsets.fromLTRB(24, 14, 24 - 12, 14),
      contentPadding: EdgeInsets.zero,
      title: _buildTitle(context),
      content: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.greyF2F4FA),
            bottom: BorderSide(width: 1, color: AppColors.greyF2F4FA),
          ),
          color: AppColors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: MediaQuery.of(context).size.width * 0.5,
        height: 640,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(flex: 2, child: PropertiesConfig(alarm: alarm)),
                SizedBox(width: 12),
                Expanded(flex: 3, child: ROIAreaConfig()),
              ],
            ),

            /* Time range */
            SizedBox(height: 18),
            Expanded(child: TimeRangesConfig()),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.fromLTRB(24, 16, 24, 16),
      actions: [
        _buildActionBtn(
          text: 'Hủy',
          bgColor: AppColors.white,
          fgColor: Color(0xFF374151),
          borderColor: AppColors.greyD1D5DB,
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(width: 1),
        _buildActionBtn(
          text: 'Lưu',
          bgColor: Color(0xFF005EB8),
          fgColor: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        /* Icon */
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.string(alarm.icon, width: 42, height: 42),
        ),

        /* Text */
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                alarm.name,
                style: AppTypography.style(
                  16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey0F172A,
                  lineHeight: 24 / 16,
                ),
              ),
              Text(
                alarm.description,
                style: AppTypography.style(
                  12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey64748B,
                  lineHeight: 16 / 12,
                ),
              ),
            ],
          ),
        ),

        /* close */
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
          tooltip: 'Đóng',
        ),
      ],
    );
  }

  Widget _buildActionBtn({
    required String text,
    required Function() onPressed,
    required Color bgColor,
    required Color fgColor,
    Color? borderColor,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        minimumSize: Size(106, 42),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: borderColor != null ? BorderSide(width: 1, color: borderColor) : BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTypography.style(
          14,
          fontWeight: FontWeight.w600,
          color: fgColor,
          lineHeight: 20 / 14,
        ),
      ),
    );
  }
}
