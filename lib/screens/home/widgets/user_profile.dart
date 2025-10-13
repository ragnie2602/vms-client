import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/screens/shared/popup_menu.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late final controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      controller: controller,
      menuBuilder: () => IntrinsicWidth(child: _buildMenu()),
      // arrowDecoration: BoxDecoration(color: Colors.white),
      // arrowSize: Size(16, 10),
      showArrow: false,
      pressType: PressType.singleClick,
      verticalMargin: 0,
      horizontalMargin: -20,
      barrierColor: Colors.transparent,
      position: PreferredPosition.bottom,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                  AppData.instance.profile?.avatar ?? "",
                  width: 32,
                  height: 32,
                  loadingBuilder: (context, child, loadingProgress) => CupertinoActivityIndicator(),
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppAssets.defaultAvatar),
                ),
              ),
              SizedBox(width: 12),
              Text(
                AppData.instance.profile?.displayName ?? 'Giám sát viên',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackOrWhite,
                ),
              ),
              SizedBox(width: 12),
              AnimatedBuilder(
                animation: controller,
                builder: (context, _) => TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: controller.menuIsShowing ? 180 : 0,
                    end: controller.menuIsShowing ? 0 : 180,
                  ),
                  duration: Durations.medium2,
                  builder: (context, angle, child) {
                    return Transform.rotate(
                      angle: angle * (math.pi / 180), // đổi độ sang radian
                      child: child,
                    );
                  },
                  child: SvgPicture.asset(
                    AppAssets.icArrowCircleUp,
                    colorFilter: ColorFilter.mode(AppColors.contentFg, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 0, offset: Offset(1, 1)),
        ],
      ),
      // padding: EdgeInsets.symmetric(vertical: 20),
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMenuItem(
              onTap: () => ErrorService.openLogFile(),
              icon: Icons.article,
              title: 'Mở log file',
            ),
            Divider(height: 0.5, color: Colors.grey.shade300),
            _buildMenuItem(
              onTap: () {
                context.read<SocketApiClient>().disconnect();
                context.goNamed(Routes.login.name);
              },
              icon: Icons.logout,
              title: 'Đăng xuất',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        title,
        style: AppTypography.style(14, color: AppColors.blackOrWhite, fontWeight: FontWeight.w500),
      ),
      horizontalTitleGap: 20,
      contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(3)),
      ),
    );
  }
}
