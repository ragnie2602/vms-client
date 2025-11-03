import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';

class ItemUserWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
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
            flex: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                itemUser.account,
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
                itemUser.fullName,
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
                itemUser.emailAddress,
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
                itemUser.telNumber,
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
                itemUser.type == UserType.admin || itemUser.type == UserType.admin_client
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
                icon: SvgPicture.asset(AppAssets.icAction),
                padding: EdgeInsets.zero,
                splashRadius: 20,
                onSelected: (String value) {
                  switch (value) {
                    case 'reset_password':
                      onResetPassword?.call();
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
                    value: 'reset_password',
                    padding: EdgeInsets.only(left: 12, bottom: 8, right: 16, top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppAssets.icReset),
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
                  PopupMenuDivider(height: 0.5, color: AppColors.greyE2E8F0),
                  PopupMenuItem<String>(
                    value: 'edit',
                    padding: EdgeInsets.only(left: 12, bottom: 8, right: 16, top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppAssets.icEdit),
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
                  PopupMenuDivider(height: 0.5, color: AppColors.greyE2E8F0),
                  PopupMenuItem<String>(
                    value: 'delete',
                    padding: EdgeInsets.only(left: 12, bottom: 8, right: 16, top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppAssets.icDelete),
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
