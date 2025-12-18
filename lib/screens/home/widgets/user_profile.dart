import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/home/change_my_info_dialog.dart';
import 'package:vms_flutter_client/screens/home/change_my_password_dialog.dart';
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
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) =>
          previous.isSignOut != current.isSignOut ||
          previous.myProfileUpdatedAt != current.myProfileUpdatedAt,
      listener: (context, state) {
        if (state.isSignOut) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          context.read<AppBloc>().add(SignOut());
          context.goNamed(Routes.login.name);
        }
        // Rebuild widget when profile is updated
        if (state.myProfileUpdatedAt > 0) {
          setState(() {});
        }
      },
      child: IgnorePointer(
        ignoring: !MultiWindowUtil.isMainWindow(
          context.read<AppBloc>().windowId,
        ),
        child: CustomPopupMenu(
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
                  SizedBox(
                    height: 32,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.network(
                        AppData.instance.profile?.avatar ?? "",
                        width: 32,
                        height: 32,
                        loadingBuilder: (context, child, loadingProgress) =>
                            CupertinoActivityIndicator(),
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(AppAssets.defaultAvatar),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    AppData.instance.profile?.displayNamePreview ??
                        'Giám sát viên',
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackOrWhite,
                    ),
                  ),
                  SizedBox(width: 12),
                  if (MultiWindowUtil.isMainWindow(
                    context.read<AppBloc>().windowId,
                  ))
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
                            angle:
                                angle * (math.pi / 180), // đổi độ sang radian
                            child: child,
                          );
                        },
                        child: SvgPicture.asset(
                          AppAssets.icArrowCircleUp,
                          colorFilter: ColorFilter.mode(
                            AppColors.contentFg,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
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
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(1, 1),
          ),
        ],
      ),
      // padding: EdgeInsets.symmetric(vertical: 20),
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMenuItem(
              onTap: () => ErrorService.openLogFile(),
              icon: Icon(Icons.article),
              title: 'Mở log file',
            ),
            _buildMenuItem(
              onTap: () => showChangeMyInfoDialog(context),
              icon: SvgPicture.asset(AppAssets.icUserInfo),
              title: 'Thông tin cá nhân',
            ),
            _buildMenuItemWithTooltip(
              title: 'Đa màn hình',
              icon: SvgPicture.asset(AppAssets.icNewWindow),
              onTap: () => context.read<AppBloc>().add(CreateNewWindow()),
              showTooltip:
                  MultiWindowUtil.getSubWindowCount() >=
                  AppConfig.MAXIMUM_SUB_WINDOWS,
              tooltipMessage:
                  'Bạn chỉ được hiển thị tối đa ${AppConfig.MAXIMUM_SUB_WINDOWS} cửa sổ phụ',
              enabled:
                  MultiWindowUtil.getSubWindowCount() <
                  AppConfig.MAXIMUM_SUB_WINDOWS,
            ),
            _buildMenuItem(
              onTap: () {
                if (AppData.instance.profile?.changePassDenied ?? false) {
                  ToastUtil.toastFail(
                    context: context,
                    title: Text(
                      'Bạn không có quyền sử dụng chức năng này!',
                      maxLines: 5,
                    ),
                  );
                  return;
                }
                showChangeMyPasswordDialog(context);
              },
              icon: SvgPicture.asset(AppAssets.icKey),
              title: 'Đổi mật khẩu',
            ),
            _buildMenuItem(
              onTap: () {
                // context.read<SocketApiClient>().disconnect();
                // context.goNamed(Routes.login.name);
                showSignOutConfirmationPopup();
              },
              icon: SvgPicture.asset(AppAssets.icLogout),
              title: 'Đăng xuất',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required Widget icon,
    required VoidCallback? onTap,
    bool enabled = true,
  }) {
    return ListTile(
      onTap: onTap,
      enabled: enabled,
      leading: icon,
      title: Text(
        title,
        style: AppTypography.style(
          14,
          color: AppColors.blackOrWhite,
          fontWeight: FontWeight.w500,
        ),
      ),
      // horizontalTitleGap: 20,
      // contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(3)),
      ),
    );
  }

  Widget _buildMenuItemWithTooltip({
    required String title,
    required Widget icon,
    required VoidCallback? onTap,
    required bool showTooltip,
    required String tooltipMessage,
    bool enabled = true,
  }) {
    final menuItem = _buildMenuItem(
      title: title,
      icon: icon,
      onTap: onTap,
      enabled: enabled,
    );

    if (!showTooltip) return menuItem;

    return Tooltip(
      message: tooltipMessage,
      preferBelow: false,
      verticalOffset: 10,
      waitDuration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: TextStyle(color: Colors.white, fontSize: 12),
      child: menuItem,
    );
  }

  void showSignOutConfirmationPopup() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Đăng xuất',
                    style: AppTypography.style(
                      30,
                      color: AppColors.blackOrWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Bạn có muốn thoát khỏi ứng dụng?',
                    style: AppTypography.style(
                      14,
                      color: AppColors.blackOrWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 130.5 / 1600,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blackOrWhiteReverse,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            side: BorderSide(
                              color: AppColors.greyE2E8F0,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Hủy',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackOrWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 130.5 / 1600,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AppBloc>().add(SignOut());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blackOrWhite,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: Text(
                            'Xác nhận',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackOrWhiteReverse,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
