import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/account/components/account_item.dart';

class MobileAccountScreen extends StatelessWidget {
  const MobileAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: SizedBox(
                height: 50,
                width: 50,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    AppData.instance.profile?.avatar ?? "",
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AppAssets.defaultAvatar),
                    loadingBuilder: (context, child, loadingProgress) =>
                        CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              AppData.instance.profile?.displayNamePreview ?? 'Giám sát viên',
              overflow: TextOverflow.ellipsis,
              style: AppTypography.style(
                18,
                fontWeight: FontWeight.w600,
                color: AppColors.blackOrWhite,
              ),
            ),
          ],
        ),
        toolbarHeight: 70,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const Divider(color: AppColors.greyF2F4FA, thickness: 3),
          AccountItem(
            onTap: () => context.pushNamed(Routes.info.name),
            svgPath: AppAssets.icUserProfileX,
            title: 'Thông tin cá nhân',
          ),
          AccountItem(onTap: () {}, svgPath: AppAssets.icKey02, title: 'Đổi mật khẩu'),
          AccountItem(onTap: () {}, svgPath: AppAssets.icCube, title: 'Điều khoản & Điều kiện'),
          AccountItem(onTap: () {}, svgPath: AppAssets.icCube, title: 'Chính sách quyền riêng tư'),
          AccountItem(onTap: () {}, svgPath: AppAssets.icFeedback, title: 'Liên hệ & Phản hồi'),
          AccountItem(
            onTap: () {},
            svgPath: AppAssets.icLanguage,
            title: 'Đổi ngôn ngữ',
            trailing: Container(),
          ),
          AccountItem(
            onTap: () {},
            svgPath: AppAssets.icLogOut,
            title: 'Đăng xuất',
            trailing: Container(),
          ),
          const Spacer(),
          Text('VNPT Secure Vision', style: AppTypography.style(14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Text('v1.0', style: AppTypography.style(14, fontWeight: FontWeight.w400)),
          const SizedBox(height: 52),
        ],
      ),
    );
  }
}
