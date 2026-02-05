import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class AiBoxTitleWidget extends StatelessWidget {
  const AiBoxTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 46),
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
            flex: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Text(
                'Tên AI box',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 230,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Text(
                'Hãng AI box',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 230,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Text(
                'Model',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Text(
                'Địa chỉ IP/Port',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Text(
                'Số cam kết nối',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Center(
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
          ),
          Expanded(
            flex: 132,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
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
