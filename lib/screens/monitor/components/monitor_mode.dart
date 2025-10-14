import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';

import '../widgets/group_node.dart';

class MonitorMode extends StatefulWidget {
  const MonitorMode({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<MonitorMode> createState() => _MonitorModeState();
}

class _MonitorModeState extends State<MonitorMode> {
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? _controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
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
                        unselectedLabelStyle: AppTypography.style(14, fontWeight: FontWeight.w500),
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
              if (constraints.maxWidth >= 24)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListenableBuilder(
                    listenable: DefaultTabController.of(context),
                    builder: (context, child) => switch (DefaultTabController.of(context).index) {
                      0 => _buildDefaultMode(),
                      _ => _buildCustomMode(isExpanded),
                    },
                  ),
                ),

              SizedBox(height: 32),
              if (constraints.maxWidth >= 24)
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
              Expanded(
                child: BlocBuilder<GroupCameraBloc, GroupCameraState>(
                  builder: (context, state) {
                    if (state is! GetAllGroupCameraSuccessState) return SizedBox();

                    return TreeView.simple(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      showRootNode: false,
                      tree: state.tree,
                      expansionBehavior: ExpansionBehavior.scrollToLastChild,
                      indentation: const Indentation(),
                      expansionIndicatorBuilder: (context, node) =>
                          NoExpansionIndicator(tree: node),
                      builder: (context, node) => GroupNode(
                        group: node.data!,
                        onToggleExpansion: () => _controller?.toggleExpansion(node),
                      ),
                      onTreeReady: (controller) {
                        _controller = controller;
                        controller.expandAllChildren(controller.tree);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDefaultMode() {
    return Text('Default Mode', maxLines: 1, overflow: TextOverflow.visible);
  }

  Widget _buildCustomMode(bool showing) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.contentBg,
          border: Border.all(color: Color(0xFF005AA9), width: 1),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showing) SvgPicture.asset(AppAssets.icAdd, width: 20, height: 20),
            showing ? SizedBox(width: 8) : SizedBox(height: 20),
            Flexible(
              child: Text(
                "Thêm chế độ tùy biến",
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF005AA9),
                ),
                maxLines: 1,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
