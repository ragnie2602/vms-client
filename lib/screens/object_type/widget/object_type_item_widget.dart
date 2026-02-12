import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

/// Table row widget for Object Type list item
class ObjectTypeItemWidget extends StatefulWidget {
  const ObjectTypeItemWidget({
    super.key,
    required this.item,
    required this.index,
    this.onEdit,
    this.onDelete,
  });

  final ObjectType item;
  final int index;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<ObjectTypeItemWidget> createState() => _ObjectTypeItemWidgetState();
}

class _ObjectTypeItemWidgetState extends State<ObjectTypeItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color hoverBgColor = Theme.of(context).hoverColor;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        color: _isHovered ? hoverBgColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              // STT
              Expanded(
                flex: 60,
                child: Center(
                  child: Text(
                    '${widget.index}',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              // Tên loại đối tượng
              Expanded(
                flex: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.item.name,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),
              // Mô tả
              Expanded(
                flex: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.item.description,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),

              // Trạng thái
              Expanded(flex: 120, child: Center(child: _buildStatusBadge(widget.item.status))),
              // Thao tác
              Expanded(flex: 100, child: Center(child: _buildPopupMenu())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(ObjectTypeStatus status) {
    final bool isActive = status == ObjectTypeStatus.active;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.greenECFFD7 : AppColors.greyF8F9FE,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status.displayName,
        style: AppTypography.style(
          12,
          fontWeight: FontWeight.w500,
          color: isActive ? AppColors.green03BF00 : AppColors.grey6F767E,
        ),
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<String>(
      tooltip: '',
      icon: SvgPicture.asset(AppAssets.icAction),
      padding: EdgeInsets.zero,
      splashRadius: 1,
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8),
      elevation: 3,
      shadowColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      menuPadding: EdgeInsets.zero,
      onSelected: (String value) {
        switch (value) {
          case 'edit':
            widget.onEdit?.call();
            break;
          case 'delete':
            widget.onDelete?.call();
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'edit',
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.icEdit, width: 16, height: 16),
              const SizedBox(width: 8),
              Text(
                'Sửa',
                style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.icDelete, width: 16, height: 16),
              const SizedBox(width: 8),
              Text(
                'Xóa',
                style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black),
              ),
            ],
          ),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
