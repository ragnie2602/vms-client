import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/time_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';

class ItemCameraWidget extends StatelessWidget {
  const ItemCameraWidget({
    super.key,
    required this.itemCamera,
    required this.index,
  });
  final CameraEntity itemCamera;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 66,
            child: Center(
              child: Text(
                '$index',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 348,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                itemCamera.name,
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 267,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                itemCamera.iPUrlStream,
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 151,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                TimeUtil.convertTime(itemCamera.timeAdded),
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                itemCamera.status.getName(),
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
