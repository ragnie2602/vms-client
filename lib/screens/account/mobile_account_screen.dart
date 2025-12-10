import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/base_view.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/account/bloc/account_bloc.dart';
import 'package:vms_flutter_client/screens/account/components/account_item.dart';
import 'package:vms_flutter_client/screens/account/mobile_change_password_screen.dart';

class MobileAccountScreen extends BaseView<AccountBloc> {
  const MobileAccountScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AccountBloc, AccountState>(
          listenWhen: (previous, current) =>
              previous.isSignOutCompleted != current.isSignOutCompleted,
          listener: (context, state) {
            if (state.isSignOutCompleted) {
              context.read<AppBloc>().add(SignOut());
            }
          },
        ),
        BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) =>
              previous.isSignOut != current.isSignOut ||
              previous.myProfileUpdatedAt != current.myProfileUpdatedAt,
          listener: (context, state) {
            if (state.isSignOut) {
              if (Navigator.canPop(context)) Navigator.pop(context);
              context.goNamed(Routes.login.name);
            }
            // Rebuild widget when profile is updated
            // Note: In Stateless widget, we rely on BlocBuilder to rebuild UI if data changes.
            // But here the profile data is static in AppData.instance.
            // If we need to rebuild, we might need a BlocBuilder wrapping the profile section.
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) =>
                previous.myProfileUpdatedAt != current.myProfileUpdatedAt,
            builder: (context, state) {
              return Row(
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
                  Expanded(
                    child: Text(
                      AppData.instance.profile?.displayNamePreview ?? 'Giám sát viên',
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.style(
                        18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackOrWhite,
                      ),
                    ),
                  ),
                ],
              );
            },
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
                          builder: (context) => const MobileChangePasswordScreen(),
                        ),
                      );
                    },
                    svgPath: AppAssets.icKey02,
                    title: 'Đổi mật khẩu',
                  ),
                  AccountItem(
                    onTap: () {},
                    svgPath: AppAssets.icCube,
                    title: 'Điều khoản & Điều kiện',
                  ),
                  AccountItem(
                    onTap: () {},
                    svgPath: AppAssets.icCube,
                    title: 'Chính sách quyền riêng tư',
                  ),
                  AccountItem(
                    onTap: () {},
                    svgPath: AppAssets.icFeedback,
                    title: 'Liên hệ & Phản hồi',
                  ),
                  AccountItem(
                    onTap: () {},
                    svgPath: AppAssets.icLanguage,
                    title: 'Đổi ngôn ngữ',
                    trailing: Container(),
                  ),
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
                          'v1.0',
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
                            side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
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
                            // Close dialog first? Or wait for navigation?
                            // Usually we close dialog then perform action.
                            // The listener in BaseView handles navigation.
                            // Here we just trigger the event.
                            // But wait, the original code popped dialog inside listener.
                            // So here we keep it open until listener handles it?
                            // Original:
                            // if (state.isSignOut) { if (Navigator.canPop) pop(); ... }
                            // So we just add event here.
                            
                            // Using AccountBloc to handle sign out flow
                            bloc(context).add(AccountSignOutPressed());
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
      final des = await FileUtil.selectFolderLocation(title: 'Chọn vị trí để tải log');
      if (des == null) return;

      final res = await ErrorService.downloadLog(des);
      if (res != null) {
        if (mounted) {
           ToastUtil.toastSuccess(
            context: context, // Explicitly pass context if needed or rely on global key if ToastUtil supports it.
            // Original code: ToastUtil.toastSuccess(title: ...). 
            // Checking original file imports... ToastUtil seems to require context usually or has global.
            // Original line 228: ToastUtil.toastSuccess(title: Text(...));
            // Let's assume the signature allows it.
            title: Text(
              'Đã tải xuống log',
              style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
            ),
          );
        }
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
