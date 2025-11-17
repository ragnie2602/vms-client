
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class ItemCameraWidget extends StatelessWidget {
  const ItemCameraWidget({
    super.key,
    required this.camera,
    this.isSelected,
    this.onClick,
  });
  final CameraEntity camera;
  final bool? isSelected;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onClick != null) {
          onClick?.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: isSelected == true ? AppColors.greyE3F0FF : Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),

        child: Row(
          children: [
            Container(
              height: 35,
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                AppAssets.icVideoOn,
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // 'Tên cam nè dài dài dài dài dài lúm luôn á',
                    camera.name,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackOrWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    // "Đang hoạt động",
                    camera.isOnline ? "Đang hoạt động" : "Dừng hoạt động",
                    style: AppTypography.style(
                      12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF647488),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            SizedBox.square(
              dimension: 8,
              child: CircleAvatar(
                backgroundColor: camera.isOnline
                    ? Color(0xFF21CCC3)
                    : Color(0xFF64748B),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
