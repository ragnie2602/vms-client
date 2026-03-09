import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';

import '../bloc/home_bloc.dart';
import 'tile_expansion.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.maxWidth,
    required this.onToggleExpanded,
    required this.tabs,
  });
  final double maxWidth;
  final VoidCallback onToggleExpanded;
  final List<HomeTab> tabs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(),
      backgroundColor: AppColors.contentBg,
      child: BlocSelector<HomeBloc, HomeState, HomeTab>(
        selector: (state) => state.selectedTab,
        builder: (context, currentTab) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildToggleSection(constraints.maxWidth >= maxWidth),

                  ...tabs.map(
                    (tab) => DrawerTile(
                      tab: tab,
                      selectedTab: currentTab,
                      maxWidth: maxWidth,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildToggleSection(bool isExpanded) {
    return InkWell(
      onTap: isExpanded ? null : onToggleExpanded,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Row(
          children: [
            Visibility(
              visible: isExpanded,
              replacement: SizedBox(width: 3),
              child: Expanded(
                child: Text(
                  "DANH MỤC CHÍNH",
                  style: AppTypography.style(
                    9,
                    letterSpacing: 3,
                    darkColor: Color(0xFF93989A),
                    lightColor: Color(0xFF92929D),
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                ),
              ),
            ),

            /*  */
            InkWell(
              onTap: onToggleExpanded,
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset(
                isExpanded
                    ? AppAssets.icArrowSquareLeft
                    : AppAssets.icArrowSquareRight,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  AppColors.contentFg,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final HomeTab tab;
  final HomeTab selectedTab;
  final int level;
  final double maxWidth;

  const DrawerTile({
    super.key,
    required this.tab,
    required this.selectedTab,
    this.level = 0,
    required this.maxWidth,
  });

  void _handleTap(BuildContext context) {
    Routes? _route;
    Object? _extra;
    bool _force = false; // Bỏ qua check selectedTab == tab

    // Trường hợp đang mở detail từ tab monitoring --> click lại vào monitoring
    // --> selectedTab == tab --> bị bỏ qua
    // --> cần force = true để bỏ qua check selectedTab == tab
    if (tab.route == Routes.monitoring &&
        GoRouter.of(context).state.name == Routes.cameraDetail.name) {
      _force = true;
    }

    if (tab.route == Routes.monitoring) {
      final isDefaultMode = context.read<AppBloc>().isDefaultMode;

      _route = isDefaultMode ? Routes.monitoring : Routes.custom_live_view;
    }

    // Mở tab playback <=> mở tab camera detail (với trạng thái empty)
    if (tab.route == Routes.playback) {
      _route = Routes.cameraDetail;
      _extra = CameraDetailScreenArgs(
        data: null,
        isPlayback: true,
        title: 'Xem lại',
        key: UniqueKey(),
        showFullCamera: true,
      );
    }

    context.read<HomeBloc>().add(
      ChangeTab(tab, route: _route, extra: _extra, force: _force),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = tab == selectedTab;

    return AnimatedContainer(
      duration: Durations.short2,
      decoration: BoxDecoration(
        color: AppColors.contentBg,
        gradient: isSelected
            ? LinearGradient(
                colors: [
                  AppColors.blackOrWhiteReverse.withValues(alpha: 0.35),
                  AppColors.blackOrWhiteReverse.withValues(alpha: 0.25),
                  AppColors.blackOrWhiteReverse.withValues(alpha: 0.05),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isExpanded = constraints.maxWidth >= maxWidth;
          return tab.nested.isEmpty
              ? _buildTitle(
                  context,
                  isSelected,
                  onTap: () => _handleTap(context),
                  showTooltip: !isExpanded,
                )
              : TileExpansion(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: tab.nested
                        .map(
                          (subTab) => DrawerTile(
                            tab: subTab,
                            selectedTab: selectedTab,
                            level: level + 1,
                            maxWidth: maxWidth,
                          ),
                        )
                        .toList(),
                  ),
                  header: _buildTitle(
                    context,
                    tab.nested.contains(selectedTab),
                    showTooltip: !isExpanded,
                  ),
                  showTrailing: constraints.maxWidth >= maxWidth,
                );
        },
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    bool isSelected, {
    VoidCallback? onTap,
    bool showTooltip = false,
  }) {
    final isNested = level > 0;
    final contentColor = isSelected ? AppColors.primary : AppColors.contentFg;

    return AnimatedContainer(
          duration: Durations.long2,
          height: 52,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.5),
            child: Row(
              children: [
                if (isNested) ...[
                  SizedBox(width: 36),
                  Text('■', style: TextStyle(fontSize: 8, color: contentColor)),
                  const SizedBox(width: 12),
                ] else ...[
                  AnimatedContainer(
                    duration: Durations.long2,
                    height: 32,
                    width: 3,
                    decoration: isSelected
                        ? BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(100),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(width: 20),
                  tab.useMaterialIcon && tab.materialIcon != null
                      ? Icon(
                          _getMaterialIcon(tab.materialIcon!),
                          color: contentColor,
                          size: 20,
                        )
                      : SvgPicture.asset(
                          tab.svg,
                          colorFilter: ColorFilter.mode(
                            contentColor,
                            BlendMode.srcIn,
                          ),
                          width: 20,
                          height: 20,
                        ),
                  SizedBox(width: 20),
                ],
                Flexible(
                  child: Text(
                    tab.title,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? AppColors.primary : null,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        )
        .let(
          (it) => !showTooltip
              ? it
              : Tooltip(
                  margin: EdgeInsets.only(left: 52.5),
                  verticalOffset: -52 / 2 + 11 + 4,
                  message: tab.title,
                  textStyle: AppTypography.style(
                    11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  child: it,
                ),
        )
        .let(
          (child) =>
              onTap != null ? InkWell(onTap: onTap, child: child) : child,
        );
  }

  IconData _getMaterialIcon(String iconName) {
    switch (iconName) {
      case 'person':
        return Icons.person;
      case 'group':
        return Icons.group;
      case 'face':
        return Icons.face;
      case 'badge':
        return Icons.badge;
      default:
        return Icons.help_outline;
    }
  }
}
