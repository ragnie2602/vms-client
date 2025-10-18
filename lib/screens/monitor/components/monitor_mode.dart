import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';
import 'package:vms_flutter_client/screens/group/widget/group_tree_widget.dart';

import '../bloc/custom_view/custom_view_bloc.dart';
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

  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? _controller;

  @override
  initState() {
    super.initState();
    context.read<CustomViewBloc>().add(GetListCustomViews());
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
                          tabs: [
                            Tab(text: 'Mặc định'),
                            Tab(text: 'Tùy biến'),
                          ],
                        )
                      : null,
                ),
                SizedBox(height: 30),
                if (constraints.maxWidth >= 24)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListenableBuilder(
                      listenable: DefaultTabController.of(context),
                      builder: (context, child) => switch (DefaultTabController.of(context).index) {
                        0 => _buildDefaultMode(constraints.maxWidth),
                        _ => _buildCustomMode(context, constraints.maxWidth, isExpanded),
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      );
    } else if (viewMode == 1) {
      return AddCustomModePane(onBack: () => setState(() => viewMode = 0));
    } else {
      return Container();
    }
  }

  Widget _buildDefaultMode(double currentWidth) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (currentWidth >= 24)
          Text(
            'Kiểu hiển thị',
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackOrWhite,
            ),
          ),
        SizedBox(height: 16),

        BlocBuilder<MonitorBloc, MonitorState>(
          builder: (context, state) {
            if (state is! MonitorSuccess) return SizedBox();

            return SizedBox(
              height: 32,
              child: Row(
                spacing: 8,
                children: [
                  for (var (index, value) in ViewMode.values.indexed)
                    if (currentWidth - 48 >= 32 * (index + 1) + 8 * index)
                      InkWell(
                        onTap: () => context.read<MonitorBloc>().add(ChangeGridMode(value)),
                        child: SvgPicture.asset(
                          state.mode == value ? value.iconActive : value.icon,
                          width: 32,
                          height: 32,
                        ),
                      ),
                ],
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
        SizedBox(height: 16 - 8),
        BlocBuilder<GroupCameraBloc, GroupCameraState>(
          builder: (context, state) {
            if (state is! GetAllGroupCameraSuccessState) return SizedBox();
            return TreeGroupWidget(controller: _controller, tree: state.tree);
            // return TreeView.simple(
            //   padding: EdgeInsets.symmetric(horizontal: 24),
            //   showRootNode: false,
            //   tree: state.tree,
            //   expansionBehavior: ExpansionBehavior.scrollToLastChild,
            //   indentation: const Indentation(),
            //   expansionIndicatorBuilder: (context, node) =>
            //       NoExpansionIndicator(tree: node),
            //   builder: (context, node) => GroupNode(
            //     group: node.data!,
            //     onToggleExpansion: () => _controller?.toggleExpansion(node),
            //   ),
            //   onTreeReady: (controller) {
            //     _controller = controller;
            //     controller.expandAllChildren(controller.tree);
            //   },
            // );
          },
        ),
      ],
    );
  }

  Widget _buildCustomMode(BuildContext context, double currentWidth, bool showing) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<CustomViewBloc, CustomViewState>(
          builder: (context, state) => stateBuilder<ListCustomViewSuccess>(
            state,
            emptyBuilder: () => SizedBox(),
            child: (state) => ListView.builder(
              padding: EdgeInsets.only(bottom: 22),
              shrinkWrap: true,
              itemCount: state.customViews.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      if (currentWidth >= 40 + 48) ...[
                        SvgPicture.asset(state.customViews[index].base.icon, width: 32, height: 32),
                        SizedBox(width: 8),
                      ],
                      SizedBox(height: 32),
                      Expanded(
                        child: Text(
                          state.customViews[index].name,
                          style: AppTypography.style(
                            13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackOrWhite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                      ),

                      if (currentWidth >= widget.maxWidth - 24 - 24)
                        SvgPicture.asset(AppAssets.icDotHorizontal, width: 12, height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => setState(() {
            currentTab = DefaultTabController.of(context).index;
            viewMode = 1;

            context.pushNamed(Routes.custom_live_view.name);
          }),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blackOrWhite, width: 1),
              borderRadius: BorderRadius.circular(3),
              color: AppColors.contentBg,
            ),
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

class AddCustomModePane extends StatefulWidget {
  const AddCustomModePane({super.key, this.onBack});
  final VoidCallback? onBack;

  @override
  State<AddCustomModePane> createState() => _AddCustomModePaneState();
}

class _AddCustomModePaneState extends State<AddCustomModePane> {
  late final CustomViewBloc bloc;

  ViewMode _mode = ViewMode.v2x2;

  @override
  void initState() {
    super.initState();

    bloc = context.read<CustomViewBloc>()..add(AddingCustomView(ViewMode.v2x2));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  bloc.add(GetListCustomViews());
                  widget.onBack?.call();
                },
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.arrow_back, size: 20, color: AppColors.blackOrWhite),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Thêm chế độ tùy biến',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackOrWhite,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Tên chế độ xem',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackOrWhite,
            ),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 19),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.black, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
              hintText: 'Nhập tên chế độ xem',
              hintStyle: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey64748B,
              ),
            ),
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackOrWhite,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Kiểu hiển thị',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackOrWhite,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 32,
            child: Row(
              spacing: 8,
              children: [
                for (var value in ViewMode.values)
                  InkWell(
                    onTap: () => setState(() => bloc.add(AddingCustomView(_mode = value))),
                    child: SvgPicture.asset(
                      _mode == value ? value.iconActive : value.icon,
                      width: 32,
                      height: 32,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onBack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackOrWhiteReverse,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                  ),
                  child: Text(
                    'Hủy',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackOrWhite,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                  child: Text(
                    'Lưu',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhiteReverse,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
