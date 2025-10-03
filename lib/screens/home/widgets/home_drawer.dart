import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: BlocSelector<HomeBloc, HomeState, HomeTab>(
        selector: (state) => state.selectedTab,
        builder: (context, currentTab) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: SizedBox(),
              ),

              ...HomeTab.tabs.map((tab) => DrawerTile(tab: tab, selectedTab: currentTab)),
            ],
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

  const DrawerTile({super.key, required this.tab, required this.selectedTab, this.level = 0});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short2,
      decoration: BoxDecoration(
        gradient: tab == selectedTab
            ? LinearGradient(
                colors: [Colors.white54, Colors.white10],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool showTrailing = constraints.maxWidth > 70;

          return tab.nested.isEmpty
              ? ListTile(
                  leading: Icon(tab.icon, size: 30),
                  title: Text(tab.title, overflow: TextOverflow.visible, maxLines: 1),
                  onTap: () => context.read<HomeBloc>().add(ChangeTab(tab)),
                  dense: true,
                  style: ListTileStyle.drawer,
                  contentPadding: EdgeInsets.fromLTRB(10 + level * 5, 12, 10, 12),
                  selected: tab == selectedTab,
                  selectedColor: Colors.redAccent,
                )
              : ExpansionTile(
                  leading: Icon(tab.icon, size: 30),
                  title: Text(tab.title, overflow: TextOverflow.visible, maxLines: 1),
                  dense: true,
                  trailing: showTrailing ? null : SizedBox.shrink(),
                  tilePadding: EdgeInsets.fromLTRB(10 + level * 5, 12, showTrailing ? 10 : 0, 12),
                  maintainState: true,
                  shape: RoundedRectangleBorder(),
                  internalAddSemanticForOnTap: true,
                  collapsedBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.white.withValues(alpha: 0.1 + level * 0.1),
                  children: tab.nested
                      .map(
                        (subTab) =>
                            DrawerTile(tab: subTab, selectedTab: selectedTab, level: level + 1),
                      )
                      .toList(),
                );
        },
      ),
    );
  }
}
