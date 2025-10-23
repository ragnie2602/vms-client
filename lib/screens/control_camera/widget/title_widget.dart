import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.greyF2F4FA,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 66,
            child: Center(
              child: Text(
                'STT',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Tên Camera',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 360,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Địa chỉ IP / URL stream',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),

          // Expanded(
          //   flex: 151,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //     child: Text(
          //       'Thời gian thêm',
          //       style: AppTypography.style(
          //         13,
          //         fontWeight: FontWeight.w500,
          //         color: AppColors.black4A4A4A,
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Trạng thái',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 190,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  'Thao tác',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black4A4A4A,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
