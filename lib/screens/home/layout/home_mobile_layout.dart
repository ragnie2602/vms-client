import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/monitor/components/filter_drawer.dart';

class HomeMobileLayout extends StatefulWidget {
  final Widget content;
  final String currentPath;

  const HomeMobileLayout({super.key, required this.content, required this.currentPath});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  final FilterDrawerController _filterDrawerController = FilterDrawerController();

  @override
  Widget build(BuildContext context) {
    final data = _bottomNavigationBarData(widget.currentPath);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(padding: const EdgeInsets.only(left: 1, top: 1), child: widget.content),
          ),
        ],
      ),
      bottomNavigationBar: data == null
          ? null
          : BottomNavigationBar(
              currentIndex: max(
                0,
                data.routes.indexWhere((r) => r.path == GoRouterState.of(context).uri.path),
              ),
              items: List.generate(
                data.routes.length,
                (index) => BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(data.activeAssets[index], height: 24, width: 24),
                  icon: SvgPicture.asset(data.assets[index], height: 24, width: 24),
                  label: data.labels[index],
                ),
              ),
              onTap: (int idx) => context.goNamed(data.routes[idx].name, extra: GoRouterState.of(context).extra),
              selectedItemColor: AppColors.blue15ABFF,
              selectedLabelStyle: AppTypography.style(
                11,
                fontWeight: FontWeight.w500,
                color: AppColors.blue15ABFF,
              ),
              unselectedLabelStyle: AppTypography.style(
                11,
                fontWeight: FontWeight.w500,
                color: AppColors.grey666666,
              ),
            ),
      endDrawer: FilterDrawer(controller: _filterDrawerController),
    );
  }

  _BottomNavigationBarData? _bottomNavigationBarData(String currentPath) {
    final location = Routes.fromName(currentPath.substring(1));
    switch (location) {
      case Routes.monitoring:
      case Routes.account:
        return _BottomNavigationBarData(
          labels: ['Trang chủ', 'Tài khoản'],
          activeAssets: [AppAssets.icHomeFilled, AppAssets.icUserFilled],
          assets: [AppAssets.icHome, AppAssets.icUser],
          routes: [Routes.monitoring, Routes.account],
        );
      case Routes.cameraDetail:
      case Routes.playback:
        return _BottomNavigationBarData(
          labels: ['Xem trực tiếp', 'Xem lại'],
          activeAssets: [AppAssets.icVideoOnlineFilled, AppAssets.icPlaybackFilled],
          assets: [AppAssets.icVideoOn, AppAssets.icPlayback],
          routes: [Routes.cameraDetail, Routes.playback],
        );
      default:
    }

    return null;
  }
}

class _BottomNavigationBarData {
  final List<String> labels;
  final List<String> activeAssets;
  final List<String> assets;
  final List<Routes> routes;

  const _BottomNavigationBarData({
    required this.labels,
    required this.activeAssets,
    required this.assets,
    required this.routes,
  });
}
