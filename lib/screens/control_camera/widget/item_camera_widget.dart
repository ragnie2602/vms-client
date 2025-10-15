import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/time_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';

class ItemCameraWidget extends StatelessWidget {
  const ItemCameraWidget({super.key, required this.itemCamera, required this.index, this.onAdd, this.onEdit, this.onDelete});
  final CameraEntity itemCamera;
  final int index;
  final VoidCallback? onAdd;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

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
                style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
              ),
            ),
          ),
          Expanded(
            flex: 348,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                itemCamera.name,
                style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black4A4A4A),
              ),
            ),
          ),
          Expanded(
            flex: 267,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                itemCamera.iPUrlStream,
                style: AppTypography.style(13, fontWeight: FontWeight.w500, color: AppColors.blue005BAA),
              ),
            ),
          ),

          Expanded(
            flex: 151,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                TimeUtil.convertTime(itemCamera.timeAdded),
                style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black171725),
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
            child: Center(
              child: PopupMenuButton<String>(
                icon: SvgPicture.asset(AppAssets.icAction),
                padding: EdgeInsets.zero,
                splashRadius: 20,
                onSelected: (String value) {
                  switch (value) {
                    case 'add':
                      onAdd?.call();
                      break;
                    case 'edit':
                      onEdit?.call();
                      break;
                    case 'delete':
                      onDelete?.call();
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'add',
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 16, color: AppColors.black171725),
                        SizedBox(width: 8),
                        Text(
                          'Thêm',
                          style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black171725),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuDivider(height: 0.5, color: AppColors.greyE2E8F0),
                  PopupMenuItem<String>(
                    value: 'edit',
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.icEdit),
                        SizedBox(width: 8),
                        Text(
                          'Sửa',
                          style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black171725),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuDivider(height: 0.5, color: AppColors.greyE2E8F0),
                  PopupMenuItem<String>(
                    value: 'delete',
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.icDelete),
                        SizedBox(width: 8),
                        Text('Xóa', style: AppTypography.style(14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 8,
              ),
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
      decoration: BoxDecoration(color: cameraStatus.bgColor, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: cameraStatus.contentColor),
            ),
            Text(
              cameraStatus.getName(),
              style: AppTypography.style(14, fontWeight: FontWeight.w500, letterSpacing: 0.2, color: cameraStatus.contentColor),
            ),
          ],
        ),
      ),
    );
  }
}
