import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/item_camera_widget.dart';

class AiBoxItemWidget extends StatefulWidget {
  const AiBoxItemWidget({
    super.key,
    required this.itemAiBox,
    required this.index,
    this.onEdit,
    this.onDelete,
  });

  final AiBoxEntity itemAiBox;
  final int index;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<AiBoxItemWidget> createState() => _AiBoxItemWidgetState();
}

class _AiBoxItemWidgetState extends State<AiBoxItemWidget> {
  bool _isHovered = false;

  String _getIpPortText() {
    final ip = widget.itemAiBox.ip;
    final port = widget.itemAiBox.port;

    if ((ip == null || ip.isEmpty) &&
        (port == null || port.toString().isEmpty)) {
      return '';
    }
    if (ip == null || ip.isEmpty) {
      return ':$port';
    }
    if (port == null || port.toString().isEmpty) {
      return ip;
    }
    return '$ip:$port';
  }

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
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 46),
          child: Row(
            children: [
              Expanded(
                flex: 66,
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
              Expanded(
                flex: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.itemAiBox.name ?? '',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey0F172A,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 230,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (widget.itemAiBox.manufacturer ?? '').isEmpty
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.greyF1F5F9,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  widget.itemAiBox.manufacturer ?? '',
                                  style: AppTypography.style(
                                    12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1E293B,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ),
                            ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 230,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.itemAiBox.model ?? '',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey1E293B,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    _getIpPortText(),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue005BAA,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 160,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${widget.itemAiBox.numberCameraUsed ?? '_'}/${widget.itemAiBox.maxCamera ?? '_'} camera',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue005BAA,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 130,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    CameraStatusWidget(isOnline: widget.itemAiBox.status == 1),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                flex: 132,
                child: Center(
                  child: PopupMenuButton<String>(
                    tooltip: '',
                    icon: SvgPicture.asset(AppAssets.icAction),
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.icEdit,
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Sửa',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(
                        height: 0.5,
                        color: AppColors.greyE2E8F0,
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        height: 32,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.icDelete,
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Xóa',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
