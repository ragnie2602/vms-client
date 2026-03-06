import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

/// Table header widget for Object Type list
class ObjectTypeTitleWidget extends StatelessWidget {
  const ObjectTypeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyF2F4FA,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          _buildHeaderCell('STT', flex: 60, center: true),
          _buildHeaderCell('Tên loại đối tượng', flex: 200),
          _buildHeaderCell('Mô tả', flex: 300),
          _buildHeaderCell('Trạng thái', flex: 120, center: true),
          _buildHeaderCell('Thao tác', flex: 100, center: true),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title, {required int flex, bool center = false}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: center
            ? Center(
                child: Text(
                  title,
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black4A4A4A,
                  ),
                ),
              )
            : Text(
                title,
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
      ),
    );
  }
}
