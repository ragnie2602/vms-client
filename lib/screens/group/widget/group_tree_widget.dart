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
    this.enableAddGroup,
    this.onSearchGroup,
    this.searchController,
    this.onClickAddGroup,
  });
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? controller;
  final TreeNode<DeviceGroup> tree;
  final Widget? action;
  final bool? isShowGroupAll;
  final VoidCallback? onClickAllGroup;
  final bool? isShowNoGroup;
  final VoidCallback? onClickNoGroup;
  final VoidCallback? onClickAddGroup;
  final bool? enableAddGroup;
  final Function({String? keySearchGroup})? onSearchGroup;
  final TextEditingController? searchController;
  @override
  Widget build(BuildContext context) {
    //  thêm group tất cả
    //  thêm group chưa gán
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        enableAddGroup == true
            ? Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          fillColor: AppColors.greyE2E8F0,
                          prefixIcon: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                            child: SvgPicture.asset(AppAssets.icSearch),
                          ),
                          hintText: 'Nhập tên nhóm',
                          hintStyle: TextStyle(
                            color: AppColors.grey64748B,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyE2E8F0,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyE2E8F0,
                              width: 1,
                            ),
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        onChanged: (value) {
                          onSearchGroup?.call(keySearchGroup: value);
                        },
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          onClickAddGroup?.call();
                        },
                        splashColor: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Tạo nhóm Camera',
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                AppAssets.icExpand,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: double.infinity,
                        height: 1,
                        color: AppColors.greyE2E8F0,
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
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
