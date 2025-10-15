import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/group_node.dart';

// ignore: must_be_immutable
class TreeGroupWidget extends StatelessWidget {
  TreeGroupWidget({
    super.key,
    required this.tree,
    required this.controller,
    this.action,
    this.isShowGroupAll,
    this.onClickAllGroup,
    this.isShowNoGroup,
    this.onClickNoGroup,
  });
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? controller;
  final TreeNode<DeviceGroup> tree;
  final Widget? action;
  final bool? isShowGroupAll;
  final VoidCallback? onClickAllGroup;
  final bool? isShowNoGroup;
  final VoidCallback? onClickNoGroup;
  @override
  Widget build(BuildContext context) {
    //  thêm group tất cả
    //  thêm group chưa gán
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                isShowGroupAll == true
                    ? InkWell(
                        onTap: () {
                          onClickAllGroup?.call();
                        },
                        splashColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              (constraints.maxWidth >= 20 + 20)
                                  ? SvgPicture.asset(
                                      AppAssets.icRootFolder,
                                      width: 20,
                                      height: 20,
                                    )
                                  : const SizedBox(),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Tất cả',
                                  style: AppTypography.style(
                                    13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackOrWhite,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                isShowNoGroup == true
                    ? InkWell(
                        onTap: () {
                          onClickNoGroup?.call();
                        },
                        splashColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              (constraints.maxWidth >= 20 + 20)
                                  ? SvgPicture.asset(
                                      AppAssets.icRootFolder,
                                      width: 20,
                                      height: 20,
                                    )
                                  : const SizedBox(),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Chưa gán nhóm',
                                  style: AppTypography.style(
                                    13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackOrWhite,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        Flexible(
          child: TreeView.simple(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            showRootNode: false,
            tree: tree,
            expansionBehavior: ExpansionBehavior.scrollToLastChild,
            indentation: const Indentation(),
            expansionIndicatorBuilder: (context, node) =>
                NoExpansionIndicator(tree: node),
            builder: (context, node) => GroupNode(
              group: node.data!,
              onToggleExpansion: () => controller?.toggleExpansion(node),
              isExpand: node.isExpanded,
              actions: action,
            ),
            onTreeReady: (treeViewController) {
              controller = treeViewController;
              treeViewController.expandAllChildren(treeViewController.tree);
            },
          ),
        ),
      ],
    );
  }
}
