import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_role.dart';

class ItemCameraWidget extends StatelessWidget {
  const ItemCameraWidget({
    super.key,
    required this.itemCamera,
    required this.index,
    this.onAdd,
    this.onEdit,
    this.onConfig,
    this.onDelete,
    this.onRemoveFromGroup,
  });

  final CameraEntity itemCamera;
  final int index;
  final VoidCallback? onAdd;
  final VoidCallback? onEdit;
  final VoidCallback? onConfig;
  final VoidCallback? onDelete;
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
          style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
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
          style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black),
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
          style: AppTypography.style(13, fontWeight: FontWeight.w500, color: AppColors.blue005BAA),
        ),
      ),
    );
  }

  Widget _buildStatusColumn() {
    return Expanded(
      flex: 170,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            CameraStatusWidget(isOnline: itemCamera.isOnline),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsColumn() {
    return Expanded(
      flex: 190,
      child: Center(
        child: PopupMenuButton<String>(
          tooltip: '',
          icon: SvgPicture.asset(AppAssets.icAction),
          padding: EdgeInsets.zero,
          splashRadius: 20,
          position: PopupMenuPosition.under,
          offset: Offset(0, 8),
          onSelected: _handleMenuSelection,
          itemBuilder: _buildMenuItems,
          menuPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 3,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
        ),
      ),
    );
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'edit':
        onEdit?.call();
        break;
      case 'config':
        onConfig?.call();
        break;
      case 'delete':
        onDelete?.call();
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
      _buildConfigMenuItem(),
      _buildDivider(),
      _buildDivider(),
      if (isHaveGroupOwner) ...[_buildRemoveFromGroupMenuItem(), _buildDivider()],
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
      // height: 32,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(icon, color: iconColor, width: 16, height: 16),
          SizedBox(width: 8),
          Text(
            label,
            style: AppTypography.style(13, fontWeight: FontWeight.w500, color: textColor),
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
      textColor: AppColors.black,
    );
  }

  PopupMenuItem<String> _buildConfigMenuItem() {
    return _buildMenuItem(
      value: 'config',
      icon: AppAssets.icConfig,
      label: 'Cấu hình',
      textColor: AppColors.black,
    );
  }

  PopupMenuItem<String> _buildRemoveFromGroupMenuItem() {
    return _buildMenuItem(
      value: 'remove_from_group',
      icon: AppAssets.icDelete,
      label: 'Xóa khỏi nhóm',
      textColor: AppColors.black,
    );
  }

  PopupMenuItem<String> _buildDeleteMenuItem() {
    return _buildMenuItem(
      value: 'delete',
      icon: AppAssets.icDelete,
      label: itemCamera.cameraRole == CameraRole.view ? "Xóa" : 'Xóa khỏi hệ thống',
      iconColor: AppColors.redFF0004,
      textColor: AppColors.redFF0004,
    );
  }

  PopupMenuDivider _buildDivider() {
    return PopupMenuDivider(height: 1, color: AppColors.greyF2F4FA);
  }
}

class CameraStatusWidget extends StatelessWidget {
  const CameraStatusWidget({super.key, required this.isOnline});
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: isOnline ? AppColors.blueD7F1FF : AppColors.scaffoldBgLight,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          isOnline ? 'Online' : 'Offline',
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w500,
            color: isOnline ? AppColors.primary : AppColors.grey6F767E,
          ),
        ),
      ),
    );
  }
}
