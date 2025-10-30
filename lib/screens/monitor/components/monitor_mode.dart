import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/screens/group/group_camera_view.dart';
import 'package:vms_flutter_client/screens/monitor/add_edit_custom_mode_pane.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/list_custom_views.dart';
import 'package:vms_flutter_client/screens/monitor/custom_monitor_pane.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';

import '../bloc/monitor/monitor_bloc.dart';

class MonitorMode extends StatefulWidget {
  const MonitorMode({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<MonitorMode> createState() => _MonitorModeState();
}

class _MonitorModeState extends State<MonitorMode> with StateBuilderMixin {
  int viewMode = 0;
  int currentTab = 0;

  void _onDefaultModeFilterSelected() {
    if (GoRouterState.of(context).name != Routes.monitoring.name) {
      context.goNamed(Routes.monitoring.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (viewMode == 0) {
      return DefaultTabController(
        length: 2,
        initialIndex: currentTab,
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isExpanded = constraints.maxWidth >= widget.maxWidth - 24 * 2;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (constraints.maxWidth >= 24)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Chế độ xem',
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackOrWhite,
                      ),
                    ),
                  ),
                SizedBox(height: 16, width: double.infinity),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFFF2F4FA),
                  ),
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: 38,
                  alignment: Alignment.center,
                  child: isExpanded
                      ? TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.blackOrWhiteReverse,
                          ),
                          labelColor: AppColors.blackOrWhite,
                          unselectedLabelColor: Color(0xFF6F767E),
                          labelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
                          unselectedLabelStyle: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w500,
                          ),
                          labelPadding: EdgeInsets.only(top: 2),
                          dividerHeight: 0,
                          indicatorWeight: 0,
                          tabs: [
                            Tab(text: 'Mặc định'),
                            Tab(text: 'Tùy biến'),
                          ],
                        )
                      : null,
                ),
                SizedBox(height: 30),
                if (constraints.maxWidth >= 24)
                  Expanded(
                    child: ListenableBuilder(
                      listenable: DefaultTabController.of(context),
                      builder: (context, child) {
                        final tabIndex = DefaultTabController.of(context).index;
                        return IndexedStack(
                          index: tabIndex,
                          children: [
                            _buildDefaultMode(constraints.maxWidth, constraints.maxHeight),
                            _buildCustomMode(context, constraints.maxWidth, isExpanded),
                          ],
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      );
    } else if (viewMode == 1) {
      return AddEditCustomModePane(
        onBack: () {
          setState(() => viewMode = 0);

          final bloc = context.read<CustomViewBloc>();
          if (bloc.preCustomView != null) {
            bloc.add(ShowCustomView(bloc.preCustomView!, CustomMonitorPaneMode.view));
            context.goNamed(
              Routes.custom_live_view.name,
              extra: CustomMonitorPaneArgs(mode: CustomMonitorPaneMode.view),
            );
          } else {
            context.goNamed(Routes.monitoring.name);
          }
        },
      );
    } else {
      return Container();
    }
  }

  Widget _buildDefaultMode(double currentWidth, double availableHeight) {
    onResetCustomViewSelectedItem() {
      context.read<CustomViewBloc>().add(
        ShowCustomView(
          CustomLiveView(id: [], base: ViewMode.v2x2, positions: [], name: ''),
          CustomMonitorPaneMode.view,
        ),
      );
    }

    ;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (currentWidth >= 24)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Kiểu hiển thị',
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.blackOrWhite,
              ),
            ),
          ),
        SizedBox(height: 16),

        BlocSelector<MonitorBloc, MonitorState, ViewMode?>(
          selector: (state) => state is MonitorSuccess ? state.mode : null,
          builder: (context, selectedMode) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: ViewMode.values.length,
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final value = ViewMode.values[index];
                    if (currentWidth - 48 >= 32 * (index + 1) + 8 * index) {
                      return InkWell(
                        onTap: () {
                          onResetCustomViewSelectedItem();

                          if (GoRouterState.of(context).name != Routes.monitoring.name) {
                            context.goNamed(Routes.monitoring.name);
                          }
                          context.read<MonitorBloc>().add(ChangeGridMode(value));
                        },
                        child: SvgPicture.asset(
                          selectedMode == value ? value.iconActive : value.icon,
                          width: 32,
                          height: 32,
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            );
          },
        ),
        SizedBox(height: 32),
        if (currentWidth >= 24)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Nhóm camera',
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.blackOrWhite,
              ),
            ),
          ),
        Expanded(
          child: GroupCameraView(
            onGetCamerasInGroup: (BuildContext contextTreeGroup, List<int> groupId) {
              _onDefaultModeFilterSelected();
              context.read<MonitorBloc>().add(GetAllCameraInGroup(groupId));
              onResetCustomViewSelectedItem();
            },
            onGetAllGroupCamera: (BuildContext contextTreeGroup) {
              _onDefaultModeFilterSelected();
              context.read<MonitorBloc>().add(GetAllCamera());
              onResetCustomViewSelectedItem();
            },
            onGetNoGroupCamera: (BuildContext contextTreeGroup) {
              _onDefaultModeFilterSelected();
              context.read<MonitorBloc>().add(GetAllCameraNoGroup());
              onResetCustomViewSelectedItem();
            },
            onAddCameraToGroup:
                ({
                  required BuildContext c,
                  required List<List<int>> cameraIds,
                  required List<int> currentGroupId,
                }) {},
          ),
        ),
      ],
    );
  }

  Widget _buildCustomMode(BuildContext context, double currentWidth, bool showing) {
    final bloc = context.read<CustomViewBloc>();

    return Column(
      children: [
        Flexible(
          child: ListCustomViews(
            onUpdate: (customView) => setState(() {
              currentTab = DefaultTabController.of(context).index;
              viewMode = 1;
            }),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              currentTab = DefaultTabController.of(context).index;
              viewMode = 1;

              bloc.add(
                ShowCustomView(
                  CustomLiveView(id: [], base: ViewMode.v2x2, positions: [], name: ''),
                  CustomMonitorPaneMode.add,
                ),
              );

              context.goNamed(
                Routes.custom_live_view.name,
                extra: CustomMonitorPaneArgs(mode: CustomMonitorPaneMode.add),
              );
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blackOrWhite, width: 1),
              borderRadius: BorderRadius.circular(3),
              color: AppColors.contentBg,
            ),
            margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showing)
                  SvgPicture.asset(
                    AppAssets.icAdd,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(AppColors.blackOrWhite, BlendMode.srcIn),
                  ),
                showing ? SizedBox(width: 8) : SizedBox(height: 20),
                Flexible(
                  child: Text(
                    "Thêm chế độ tùy biến",
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
