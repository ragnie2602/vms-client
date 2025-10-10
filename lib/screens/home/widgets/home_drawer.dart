import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../home_bloc.dart';
import 'tile_expansion.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: BlocSelector<HomeBloc, HomeState, HomeTab>(
        selector: (state) => state.selectedTab,
        builder: (context, currentTab) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(23, 18, 0, 20),
                    child: Text(
                      constraints.maxWidth >= maxWidth ? "DANH MỤC CHÍNH" : "",
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

                  ...HomeTab.tabs.map(
                    (tab) => DrawerTile(tab: tab, selectedTab: currentTab, maxWidth: maxWidth),
                  ),
                ],
              );
            },
          );
        },
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

  @override
  Widget build(BuildContext context) {
    bool isSelected = tab == selectedTab;

    return AnimatedContainer(
      duration: Durations.short2,
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: [Colors.white54, Colors.white10],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return tab.nested.isEmpty
              ? _buildTitle(
                  context,
                  isSelected,
                  onTap: () => context.read<HomeBloc>().add(ChangeTab(tab)),
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
                  header: _buildTitle(context, false),
                  showTrailing: constraints.maxWidth >= maxWidth,
                );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context, bool isSelected, {VoidCallback? onTap}) {
    return AnimatedContainer(
      duration: Durations.long2,
      height: 52,
      width: double.infinity,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Durations.long2,
            height: 32,
            width: 3,
            decoration: isSelected
                ? BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
                  )
                : null,
          ),
          SizedBox(width: 20),
          SvgPicture.asset(
            tab.svg,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primary : AppColors.contentFg,
              BlendMode.srcIn,
            ),
            width: 20,
            height: 20,
          ),
          SizedBox(width: 20),
          Flexible(
            child: Text(
              tab.title,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : null,
              ),
              overflow: TextOverflow.visible,
              maxLines: 1,
            ),
          ),
        ],
      ),
    ).let((child) => onTap != null ? InkWell(onTap: onTap, child: child) : child);
  }
}
