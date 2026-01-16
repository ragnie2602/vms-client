import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/account/components/account_item.dart';
import 'package:vms_flutter_client/screens/account/mobile_change_password_screen.dart';
import 'package:vms_flutter_client/screens/account/mobile_data_policy.dart';
import 'package:vms_flutter_client/screens/account/mobile_term_usage.dart';

class MobileAccountScreen extends StatefulWidget {
  const MobileAccountScreen({super.key});

  @override
  State<MobileAccountScreen> createState() => _MobileAccountScreenState();
}

class _MobileAccountScreenState extends State<MobileAccountScreen> {
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
        if (state.myProfileUpdatedAt > 0) {}
      },
      child: Scaffold(
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
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Divider(color: AppColors.greyF2F4FA, thickness: 3),
                  AccountItem(
                    onTap: () => context.pushNamed(Routes.info.name),
                    svgPath: AppAssets.icUserProfileX,
                    title: 'Thông tin cá nhân',
                  ),
                  AccountItem(
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const MobileChangePasswordScreen(),
                        ),
                      );
                    },
                    svgPath: AppAssets.icKey02,
                    title: 'Đổi mật khẩu',
                  ),
                  AccountItem(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MobileTermUsageScreen(),
                        ),
                      );
                    },
                    svgPath: AppAssets.icCube,
                    title: 'Điều khoản sử dụng',
                  ),
                  AccountItem(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MobileDataPolicyScreen(),
                        ),
                      );
                    },
                    svgPath: AppAssets.icCube,
                    title: 'Chính sách bảo vệ dữ liệu cá nhân',
                  ),
                  // AccountItem(
                  //   onTap: () {},
                  //   svgPath: AppAssets.icFeedback,
                  //   title: 'Liên hệ & Phản hồi',
                  // ),
                  // AccountItem(
                  //   onTap: () {},
                  //   svgPath: AppAssets.icLanguage,
                  //   title: 'Đổi ngôn ngữ',
                  //   trailing: Container(),
                  // ),
                  AccountItem(
                    onTap: () {
                      showSignOutConfirmationPopup(context);
                    },
                    svgPath: AppAssets.icLogOut,
                    title: 'Đăng xuất',
                    trailing: Container(),
                  ),
                  const Spacer(),
                  _DownloadLogHandler(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'VNPT Secure Vision',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'v1.1.1 build 13',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 52),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSignOutConfirmationPopup(BuildContext context) {
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
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blackOrWhiteReverse,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
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
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AppBloc>().add(SignOut());
                          context.goNamed(Routes.login.name);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blackOrWhite,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
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

class _DownloadLogHandler extends StatefulWidget {
  const _DownloadLogHandler({required this.child});
  final Widget child;

  @override
  State<_DownloadLogHandler> createState() => _DownloadLogHandlerState();
}

class _DownloadLogHandlerState extends State<_DownloadLogHandler> {
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _scheduleDownloadLog(_) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: 5), () async {
      final des = await FileUtil.selectFolderLocation(needFullAccess: true);
      if (des == null) return;

      final res = await ErrorService.downloadLog(des);
      if (res != null) {
        ToastUtil.toastSuccess(
          title: Text(
            'Đã tải xuống log',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: _scheduleDownloadLog,
      onLongPressEnd: (_) => _timer?.cancel(),
      child: Container(color: Colors.transparent, child: widget.child),
    );
  }
}
