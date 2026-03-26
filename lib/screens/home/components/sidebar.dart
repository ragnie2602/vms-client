import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';

import '../bloc/home_bloc.dart';
import '../widgets/home_drawer.dart';
import '../widgets/theme_box.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    this.minWidth = 63,
    this.maxWidth = 255,
    this.initialWidth = 255,
    this.dividerWidth = 6,
    this.currentPath,
  });

  final double minWidth;
  final double maxWidth;
  final double initialWidth;
  final double dividerWidth;
  final String? currentPath;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  late double maxWidth = widget.maxWidth;
  late double minWidth = widget.minWidth;

  final tabs = <HomeTab>[];

  @override
  initState() {
    super.initState();

    int windowId = 0;
    if (mounted) windowId = context.read<AppBloc>().windowId;
    if (MultiWindowUtil.isMainWindow(windowId)) {
      tabs.addAll(HomeTab.tabs);
    } else {
      tabs.add(HomeTab.tabs[0]);
      tabs.add(HomeTab.tabs[1]);
    }
  }

  @override
  void didUpdateWidget(covariant Sidebar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.maxWidth != maxWidth || widget.minWidth != minWidth) {
      if (maxWidth >= widget.maxWidth) maxWidth = widget.maxWidth;
      if (maxWidth <= widget.minWidth) maxWidth = widget.minWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.SHOW_HOME_SIDEBAR) return SizedBox.shrink();

    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) =>
          previous.themeMode != current.themeMode ||
          previous.displayFullScreenLiveView != current.displayFullScreenLiveView,
      listener: (context, state) => setState(() {}),
      child: Visibility(
        visible: !context.read<AppBloc>().state.displayFullScreenLiveView,
        child: BlocSelector<HomeBloc, HomeState, bool>(
          selector: (state) => state.expandedSidebar,
          builder: (context, expandedSidebar) {
            return AnimatedContainer(
              duration: Durations.short2,
              width: expandedSidebar ? maxWidth : minWidth,
              height: double.infinity,
              color: AppColors.contentBg,
              child: Column(
                children: [
                  /* Logo */
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        height: AppConfig.APP_BAR_HEIGHT,
                        child: SvgPicture.asset(
                          constraints.maxWidth >= widget.maxWidth
                              ? AppAssets.logoFull
                              : AppAssets.logoOnly,
                        ),
                      );
                    },
                  ),
                  Divider(height: 1, color: AppColors.scaffoldBg),
                  Expanded(
                    child: widget.currentPath != Routes.onboarding.path
                        ? HomeDrawer(
                            maxWidth: maxWidth,
                            onToggleExpanded: () => context.read<HomeBloc>().add(ToggleSidebar()),
                            tabs: tabs,
                          )
                        : SizedBox.shrink(),
                  ),

                  /*  */
                  ThemeBox(
                    maxWidth: widget.maxWidth,
                    expandedPadding: const EdgeInsets.symmetric(horizontal: 20),
                    collapsedPadding: const EdgeInsets.symmetric(horizontal: 6),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
