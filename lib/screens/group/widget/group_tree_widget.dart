import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/group_node.dart';

class TreeGroupWidget extends StatefulWidget {
  const TreeGroupWidget({
    super.key,
    required this.tree,
    this.controller,
    this.action,
    this.actionBuilder,
    this.selectedGroupId,
    this.isShowGroupAll,
    this.onClickAllGroup,
    this.isShowNoGroup,
    this.onClickNoGroup,
    this.enableAddGroup,
    this.onSearchGroup,
    this.searchController,
    this.onClickAddGroup,
    this.isClickAllGroup,
    this.isClickNoGroup,
    this.onClickGroupNode,
  });

  final TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? controller;
  final TreeNode<DeviceGroup> tree;
  final Widget? action;
  final Widget? Function(TreeNode<DeviceGroup> node)? actionBuilder;
  final List<int>? selectedGroupId;
  final bool? isShowGroupAll;
  final VoidCallback? onClickAllGroup;
  final bool? isShowNoGroup;
  final VoidCallback? onClickNoGroup;
  final VoidCallback? onClickAddGroup;
  final Function(BuildContext, List<int>)? onClickGroupNode;
  final bool? enableAddGroup;
  final Function({String? keySearchGroup})? onSearchGroup;
  final TextEditingController? searchController;
  final bool? isClickAllGroup;
  final bool? isClickNoGroup;

  @override
  State<TreeGroupWidget> createState() => _TreeGroupWidgetState();
}

class _TreeGroupWidgetState extends State<TreeGroupWidget> {
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? _treeController;
  TreeNode<DeviceGroup>? _selectedNode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncSelectedNodeFromProp();
  }

  @override
  void didUpdateWidget(TreeGroupWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _treeController?.expandAllChildren(widget.tree);
    });
    if (oldWidget.selectedGroupId != widget.selectedGroupId) {
      _syncSelectedNodeFromProp();
    }
  }

  // dùng để tìm node trong tree
  // khi đang ở node khác mà mở action của node X cần tìm
  // để focus và update list cam (update dữ liệu)
  void _syncSelectedNodeFromProp() {
    if (widget.selectedGroupId == null) {
      setState(() => _selectedNode = null);
      return;
    }
    TreeNode<DeviceGroup>? foundNodeOnTree;
    void searchOnTree(TreeNode<DeviceGroup> node) {
      if (foundNodeOnTree != null) return;
      if (listEquals(node.data?.groupId ?? [], widget.selectedGroupId)) {
        foundNodeOnTree = node;
        return;
      }
      final dynamic children = node.children;
      if (children is Iterable) {
        for (var c in children) {
          searchOnTree(c as TreeNode<DeviceGroup>);
        }
      } else if (children is Map) {
        for (var c in children.values) {
          searchOnTree(c as TreeNode<DeviceGroup>);
        }
      }
    }

    searchOnTree(widget.tree);
    setState(() {
      _selectedNode = foundNodeOnTree;
    });
  }

  void _onNodeTap({
    required TreeNode<DeviceGroup> node,
    required BuildContext context,
  }) {
    setState(() {
      _selectedNode = node;
    });
    widget.onClickGroupNode?.call(context, node.data?.groupId ?? []);
  }

  void _clearSelectedNode() {
    setState(() {
      _selectedNode = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.enableAddGroup == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: widget.searchController,
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
                  onChanged: (value) =>
                      widget.onSearchGroup?.call(keySearchGroup: value),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () => widget.onClickAddGroup?.call(),
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

        LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                if (widget.isShowGroupAll == true)
                  InkWell(
                    onTap: () {
                      _clearSelectedNode();
                      widget.onClickAllGroup?.call();
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.isClickAllGroup == true
                            ? AppColors.greyF2F4FA
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (constraints.maxWidth >= 40)
                              ? SvgPicture.asset(
                                  AppAssets.icAllCamera,
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

                if (widget.isShowNoGroup == true)
                  InkWell(
                    onTap: () {
                      _clearSelectedNode();
                      widget.onClickNoGroup?.call();
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: widget.isClickNoGroup == true
                            ? AppColors.greyF2F4FA
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (constraints.maxWidth >= 40)
                              ? SvgPicture.asset(
                                  AppAssets.icAllCamera,
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
            ),
          ),
        ),

        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                child: widget.tree.length == 0
                    ? Center(child: Text('Không có nhóm phù hợp'))
                    : Scrollbar(
                        thumbVisibility: true,
                        child: TreeView.simple(
                          key: ValueKey(widget.tree.hashCode),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          showRootNode: false,
                          tree: widget.tree,
                          expansionBehavior:
                              ExpansionBehavior.scrollToLastChild,
                          indentation: Indentation(color: Colors.black),
                          expansionIndicatorBuilder: (context, node) =>
                              NoExpansionIndicator(tree: node),
                          builder: (context, node) => GroupNode(
                            group: node.data!,
                            onToggleExpansion: () =>
                                _treeController?.toggleExpansion(node),
                            isExpand: node.isExpanded,
                            actions:
                                widget.actionBuilder?.call(node) ??
                                widget.action,
                            isSelected: _selectedNode == node,
                            onTap: () =>
                                _onNodeTap(node: node, context: context),
                          ),
                          onTreeReady: (treeViewController) {
                            _treeController = treeViewController;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              treeViewController.expandAllChildren(widget.tree);
                            });
                          },
                        ),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
