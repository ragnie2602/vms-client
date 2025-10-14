import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
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
                  14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
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
                  14,
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
                  color: AppColors.blue005BAA,
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
                  14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black171725,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CameraStatusWidget(cameraStatus: itemCamera.status),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 190,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(child: SvgPicture.asset(AppAssets.icAction)),
            ),
          ),
        ],
      ),
    );
  }
}

class CameraStatusWidget extends StatelessWidget {
  const CameraStatusWidget({super.key, required this.cameraStatus});
  final CameraStatus cameraStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: cameraStatus.bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: cameraStatus.contentColor,
              ),
            ),
            Text(
              cameraStatus.getName(),
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
                color: cameraStatus.contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
