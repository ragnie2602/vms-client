import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/detection_setting_dialog.dart';

class IntelligentAnalysisWidget extends StatelessWidget {
  const IntelligentAnalysisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 200 / 113,
          crossAxisCount: 3,
          crossAxisSpacing: 21,
          mainAxisSpacing: 13,
        ),
        children: [
          _IAItem(svgPath: AppAssets.icMotionDetection, title: 'Phát hiện chuyển động'),
          _IAItem(
            svgPath: AppAssets.icIntrusionDetection,
            title: 'Phát hiện xâm nhập',
            timeoutField: true,
          ),
          _IAItem(svgPath: AppAssets.icFaceDetection, title: 'Phân biệt đối tượng'),
          _IAItem(svgPath: AppAssets.icLineCrossingDetection, title: 'Phát hiện vượt hàng rào ảo'),
          _IAItem(svgPath: AppAssets.icLostObjectDetection, title: 'Phát hiện vật bị bỏ quên'),
          _IAItem(svgPath: AppAssets.icDangerousObjectDetection, title: 'Phát hiện vật nguy hiểm'),
        ],
      ),
    );
  }
}

class _IAItem extends StatefulWidget {
  final String svgPath;
  final String title;
  final bool timeoutField;

  const _IAItem({required this.svgPath, required this.title, this.timeoutField = false});

  @override
  State<_IAItem> createState() => _IAItemState();
}

class _IAItemState extends State<_IAItem> {
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: on ? AppColors.blueDAE3FF : AppColors.greyF2F4FA,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SvgPicture.asset(widget.svgPath, alignment: AlignmentGeometry.centerLeft),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Transform.rotate(
                    angle: math.pi,
                    child: Switch(
                      activeTrackColor: AppColors.blue005AA9,
                      activeThumbColor: AppColors.white,
                      inactiveTrackColor: AppColors.greyE4E4E4,
                      inactiveThumbColor: AppColors.white,
                      onChanged: (value) => _openSetting(
                        value,
                        timeoutField: widget.timeoutField,
                        title: widget.title,
                      ),
                      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                      value: on,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(widget.title, style: AppTypography.style(14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  _openSetting(bool expected, {required bool timeoutField, required String title}) async {
    if (!expected) return setState(() => on = expected);

    final result = await showDialog(
      context: context,
      builder: (context) => DetectionSettingDialog(title: title, timeout: timeoutField),
    );

    if (result == true) setState(() => on = expected);
  }
}
