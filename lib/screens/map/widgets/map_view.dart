import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: Text(
          'Chưa có bản đồ camera nào. Click + để thêm bản đồ camera',
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey64748B,
          ),
        ),
      ),
    );
  }
}
