import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';

class MockObject {
  final String? name;
  final String? id;
  final String? type;
  final List<MockObject>? children;

  MockObject({this.name, this.id, this.type, this.children});

  TreeNode<MockObject> toTreeNode() {
    final node = TreeNode<MockObject>(key: id ?? '', data: this);
    if (children != null) {
      for (final child in children!) {
        node.add(child.toTreeNode());
      }
    }
    return node;
  }

  List<MockObject> convertToOneLevel({
    int? hideFromLevel,
    int currentLevel = 1,
  }) {
    if (hideFromLevel != null && currentLevel >= hideFromLevel) {
      return [];
    }
    List<MockObject> result = [this];
    if (children != null) {
      for (var child in children!) {
        result.addAll(
          child.convertToOneLevel(
            hideFromLevel: hideFromLevel,
            currentLevel: currentLevel + 1,
          ),
        );
      }
    }
    return result;
  }
}

extension TreeObjectGroupExt on List<MockObject> {
  TreeNode<MockObject> get convertTree {
    TreeNode<MockObject> tree = TreeNode.root();
    for (var group in this) {
      tree.add(group.toTreeNode());
    }
    return tree;
  }
}

class GroupObjectTreeWidget extends StatefulWidget {
  const GroupObjectTreeWidget({
    super.key,
    required this.tree,
    this.controller,
    this.actionBuilder,
    this.selectedObjectId,
    this.onClickObjectNode,
    this.onClickAddGroup,
    this.onMenuAddObject,
    this.onMenuAddGroup,
    this.onMenuEdit,
    this.onMenuDelete,
  });

  final TreeViewController<MockObject, TreeNode<MockObject>>? controller;
  final TreeNode<MockObject> tree;
  final Widget? Function(TreeNode<MockObject> node)? actionBuilder;
  final String? selectedObjectId;
  final Function(BuildContext, String)? onClickObjectNode;
  final VoidCallback? onClickAddGroup;
  final Function(TreeNode<MockObject>)? onMenuAddObject;
  final Function(TreeNode<MockObject>)? onMenuAddGroup;
  final Function(TreeNode<MockObject>)? onMenuEdit;
  final Function(TreeNode<MockObject>)? onMenuDelete;

  @override
  State<GroupObjectTreeWidget> createState() => _GroupObjectTreeWidgetState();
}

class _GroupObjectTreeWidgetState extends State<GroupObjectTreeWidget> {
  TreeViewController<MockObject, TreeNode<MockObject>>? _treeController;
  TreeNode<MockObject>? _selectedNode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncSelectedNodeFromProp();
  }

  @override
  void didUpdateWidget(GroupObjectTreeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _treeController?.expandAllChildren(widget.tree);
    });
    if (oldWidget.selectedObjectId != widget.selectedObjectId) {
      _syncSelectedNodeFromProp();
    }
  }

  void _syncSelectedNodeFromProp() {
    if (widget.selectedObjectId == null) {
      setState(() => _selectedNode = null);
      return;
    }
    TreeNode<MockObject>? foundNodeOnTree;
    void searchOnTree(TreeNode<MockObject> node) {
      if (foundNodeOnTree != null) return;
      if (node.data?.id == widget.selectedObjectId) {
        foundNodeOnTree = node;
        return;
      }
      final dynamic children = node.children;
      if (children is Iterable) {
        for (var c in children) {
          searchOnTree(c as TreeNode<MockObject>);
        }
      } else if (children is Map) {
        for (var c in children.values) {
          searchOnTree(c as TreeNode<MockObject>);
        }
      }
    }

    searchOnTree(widget.tree);
    setState(() {
      _selectedNode = foundNodeOnTree;
    });
  }

  void _onNodeTap({
    required TreeNode<MockObject> node,
    required BuildContext context,
  }) {
    setState(() {
      _selectedNode = node;
    });
    widget.onClickObjectNode?.call(context, node.data?.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tạo nhóm quản lý đối tượng',
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => widget.onClickAddGroup?.call(),
                    splashColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: 1.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.greyF2F4FA,
              ),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                child: widget.tree.length == 0
                    ? Center(
                        child: Text(
                          'Không có dữ liệu',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey64748B,
                          ),
                        ),
                      )
                    : TreeView.simple(
                        key: ValueKey(widget.tree.hashCode),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        showRootNode: false,
                        tree: widget.tree,
                        expansionBehavior: ExpansionBehavior.none,
                        indentation: Indentation(
                          color: AppColors.greyE2E8F0,
                          thickness: 1,
                        ),
                        expansionIndicatorBuilder: (context, node) =>
                            NoExpansionIndicator(tree: node),
                        builder: (context, node) => GroupObjectNodeWidget(
                          node: node,
                          onToggleExpansion: () =>
                              _treeController?.toggleExpansion(node),
                          isExpand: node.isExpanded,
                          actions: widget.actionBuilder?.call(node),
                          isSelected: _selectedNode == node,
                          onTap: () => _onNodeTap(node: node, context: context),
                          onMenuAddObject: () =>
                              widget.onMenuAddObject?.call(node),
                          onMenuAddGroup: () =>
                              widget.onMenuAddGroup?.call(node),
                          onMenuEdit: () => widget.onMenuEdit?.call(node),
                          onMenuDelete: () => widget.onMenuDelete?.call(node),
                        ),
                        onTreeReady: (treeViewController) {
                          _treeController = treeViewController;
                          Future.delayed(
                            Duration.zero,
                            () =>
                                _treeController?.expandAllChildren(widget.tree),
                          );
                        },
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class GroupObjectNodeWidget extends StatelessWidget {
  const GroupObjectNodeWidget({
    super.key,
    required this.node,
    this.onTap,
    this.onToggleExpansion,
    this.actions,
    this.isExpand,
    this.isSelected,
    this.onMenuAddObject,
    this.onMenuAddGroup,
    this.onMenuEdit,
    this.onMenuDelete,
  });

  final TreeNode<MockObject> node;
  final Function()? onTap;
  final Function()? onToggleExpansion;
  final Widget? actions;
  final bool? isExpand;
  final bool? isSelected;
  final Function()? onMenuAddObject;
  final Function()? onMenuAddGroup;
  final Function()? onMenuEdit;
  final Function()? onMenuDelete;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
        splashColor: Colors.transparent,
        onTap: onTap ?? () {},
        child: Container(
          // padding matches GroupNode exactly
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected == true
                ? AppColors.greyF2F4FA
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (constraints.maxWidth >= 20 + 20) ...[
                // level 0 -> folder icon, level 1+ collapse/expand, leaf -> empty
                SvgPicture.asset(
                  node.level == 1
                      ? AppAssets.icRootFolder
                      : (!node.isLeaf && isExpand == true)
                      ? AppAssets.icCollapse
                      : (!node.isLeaf)
                      ? AppAssets.icExpand
                      : AppAssets.icExpand,
                  width: node.level == 1
                      ? 20
                      : node.isLeaf
                      ? 0
                      : 12,
                  height: node.level == 1
                      ? 20
                      : node.isLeaf
                      ? 0
                      : 12,
                ).let((child) {
                  return onToggleExpansion != null && !node.isLeaf
                      ? GestureDetector(onTap: onToggleExpansion, child: child)
                      : child;
                }),
              ],
              if (constraints.maxWidth >= 20 + 20 + 8) const SizedBox(width: 8),
              Expanded(
                child: Text(
                  node.data?.name ?? '',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                ),
              ),
              if (actions != null && constraints.maxWidth >= 12) actions!,
            ],
          ),
        ),
      ),
    );
  }
}
