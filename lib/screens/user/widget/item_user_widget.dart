import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';

class ItemUserWidget extends StatefulWidget {
  const ItemUserWidget({
    super.key,
    required this.itemUser,
    required this.index,
    this.onResetPassword,
    this.onEdit,
    this.onDelete,
  });
  final UserEntity itemUser;
  final int index;
  final VoidCallback? onResetPassword;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<ItemUserWidget> createState() => _ItemUserWidgetState();
}

class _ItemUserWidgetState extends State<ItemUserWidget> {
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
          padding: EdgeInsets.symmetric(vertical: 10),
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
                  child: Text(
                    widget.itemUser.account,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.itemUser.fullName,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.itemUser.emailAddress,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.itemUser.telNumber,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.itemUser.type == UserType.admin ||
                            widget.itemUser.type == UserType.admin_client
                        ? 'Tài khoản admin'
                        : 'Tài khoản thường',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black171725,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 112,
                child: Center(
                  child: PopupMenuButton<String>(
                    tooltip: '',
                    icon: SvgPicture.asset(AppAssets.icAction),
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    position: PopupMenuPosition.under,
                    offset: Offset(0, 8),
                    elevation: 3,
                    shadowColor: AppColors.black,
                    surfaceTintColor: Colors.transparent,
                    color: Colors.white,
                    menuPadding: EdgeInsets.zero,
                    onSelected: (String value) {
                      switch (value) {
                        case 'reset_password':
                          widget.onResetPassword?.call();
                          break;
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
                        value: 'reset_password',
                        height: 32,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.icReset,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Khôi phục mật khẩu',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuDivider(
                        height: 0.5,
                        color: AppColors.greyE2E8F0,
                      ),
                      PopupMenuItem<String>(
                        value: 'edit',
                        height: 32,
                        padding: EdgeInsets.symmetric(
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
                            SizedBox(width: 8),
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
                      PopupMenuDivider(
                        height: 0.5,
                        color: AppColors.greyE2E8F0,
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        height: 32,
                        padding: EdgeInsets.symmetric(
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
                            SizedBox(width: 8),
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
                    // elevation set above
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
