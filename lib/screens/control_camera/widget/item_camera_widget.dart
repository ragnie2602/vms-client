import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_role.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';

class ItemCameraWidget extends StatelessWidget {
  const ItemCameraWidget({
    super.key,
    required this.itemCamera,
    required this.index,
    this.onAdd,
    this.onEdit,
    this.onDelete,
    this.onShare,
    this.onRemoveFromGroup,
  });

  final CameraEntity itemCamera;
  final int index;
  final VoidCallback? onAdd;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onShare;
  final VoidCallback? onRemoveFromGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          _buildIndexColumn(),
          _buildNameColumn(),
          _buildIpColumn(),
          _buildStatusColumn(),
          _buildActionsColumn(),
        ],
      ),
    );
  }

  Widget _buildIndexColumn() {
    return Expanded(
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
    );
  }

  Widget _buildNameColumn() {
    return Expanded(
      flex: 400,
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
    );
  }

  Widget _buildIpColumn() {
    return Expanded(
      flex: 360,
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
    );
  }

  Widget _buildStatusColumn() {
    return Expanded(
      flex: 190,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CameraStatusWidget(cameraStatus: itemCamera.status),
      ),
    );
  }

  Widget _buildActionsColumn() {
    return Expanded(
      flex: 190,
      child: Center(
        child: PopupMenuButton<String>(
          icon: SvgPicture.asset(AppAssets.icAction),
          padding: EdgeInsets.zero,
          splashRadius: 20,
          onSelected: _handleMenuSelection,
          itemBuilder: _buildMenuItems,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 8,
        ),
      ),
    );
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'edit':
        onEdit?.call();
        break;
      case 'delete':
        onDelete?.call();
        break;
      case 'share':
        onShare?.call();
        break;
      case 'remove_from_group':
        onRemoveFromGroup?.call();
        break;
    }
  }

  List<PopupMenuEntry<String>> _buildMenuItems(BuildContext context) {
    final isViewRole = itemCamera.cameraRole == CameraRole.view;
    final isHaveGroupOwner = (itemCamera.groupOwnerId ?? []).isNotEmpty;

    if (isViewRole) {
      return [_buildDeleteMenuItem()];
    }

    return [
      _buildEditMenuItem(),
      _buildDivider(),
      _buildShareMenuItem(),
      _buildDivider(),
      if (isHaveGroupOwner) ...[
        _buildRemoveFromGroupMenuItem(),
        _buildDivider(),
      ],
      _buildDeleteMenuItem(),
    ];
  }

  PopupMenuItem<String> _buildMenuItem({
    required String value,
    required String icon,
    required String label,
    Color? iconColor,
    Color? textColor,
  }) {
    return PopupMenuItem<String>(
      value: value,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(icon, color: iconColor),
          SizedBox(width: 8),
          Text(
            label,
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildEditMenuItem() {
    return _buildMenuItem(
      value: 'edit',
      icon: AppAssets.icEdit,
      label: 'Sửa',
      textColor: AppColors.black171725,
    );
  }

  PopupMenuItem<String> _buildShareMenuItem() {
    return _buildMenuItem(
      value: 'share',
      icon: AppAssets.iconShare,
      label: 'Chia sẻ',
    );
  }

  PopupMenuItem<String> _buildRemoveFromGroupMenuItem() {
    return _buildMenuItem(
      value: 'remove_from_group',
      icon: AppAssets.icDelete,
      label: 'Xóa khỏi nhóm',
    );
  }

  PopupMenuItem<String> _buildDeleteMenuItem() {
    return _buildMenuItem(
      value: 'delete',
      icon: AppAssets.icDelete,
      label: 'Xóa khỏi hệ thống',
      iconColor: AppColors.redFF0004,
      textColor: AppColors.redFF0004,
    );
  }

  PopupMenuDivider _buildDivider() {
    return PopupMenuDivider(height: 0.5, color: AppColors.greyE2E8F0);
  }
}

class CameraStatusWidget extends StatelessWidget {
  const CameraStatusWidget({super.key, required this.cameraStatus});
  final CameraStatus cameraStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
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
              margin: EdgeInsets.only(right: 2),
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
