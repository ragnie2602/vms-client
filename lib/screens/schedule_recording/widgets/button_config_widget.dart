import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ButtonConfigWidget extends StatelessWidget {
  const ButtonConfigWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: AppColors.greyE2E8F0),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            child: Center(
              child: Text(
                'Hủy',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.blue005AA9,
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 45),
            child: Center(
              child: Text(
                'Lưu',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
