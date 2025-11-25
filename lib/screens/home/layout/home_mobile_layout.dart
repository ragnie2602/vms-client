import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class HomeMobileLayout extends StatelessWidget {
  final Widget content;

  const HomeMobileLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(padding: const EdgeInsets.only(left: 1, top: 1), child: content),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppAssets.icHomeFilled, height: 24, width: 24),
            icon: SvgPicture.asset(AppAssets.icHome, height: 24, width: 24),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppAssets.icUserFilled, height: 24, width: 24),
            icon: SvgPicture.asset(AppAssets.icUser, height: 24, width: 24),
            label: 'Tài khoản',
          ),
        ],
        onTap: (int idx) => _onItemTapped(idx, context),
        selectedItemColor: AppColors.blue15ABFF,
        selectedLabelStyle: AppTypography.style(11, fontWeight: FontWeight.w500, color: AppColors.blue15ABFF),
        unselectedLabelStyle: AppTypography.style(11, fontWeight: FontWeight.w500, color: AppColors.grey666666),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(Routes.monitoring.path)) return 0;
    if (location.startsWith(Routes.users.path)) return 1;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(Routes.monitoring.name);
        break;
      case 1:
        context.goNamed(Routes.users.name);
        break;
    }
  }
}
