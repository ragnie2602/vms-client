import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission_group.dart';

class PermissionList extends StatefulWidget {
  final List<PermissionGroup> groups;
  final ValueNotifier<Set<String>> selectedCodes;
  final String rootTitle;
  final Widget? subTree;

  const PermissionList(
    this.groups, {
    super.key,
    required this.selectedCodes,
    this.rootTitle = 'Tất cả',
    this.subTree,
  });

  @override
  State<PermissionList> createState() => _PermissionListState();
}

class _PermissionListState extends State<PermissionList> {
  late final TreeNode<_NodeData> _tree;

  @override
  void initState() {
    super.initState();
    _tree = _buildTree();
  }

  TreeNode<_NodeData> _buildTree() {
    final allCodes = <String>{};
    for (final g in widget.groups) {
      for (final p in g.permissions ?? const []) {
        allCodes.add(p.code);
      }
    }

    final root = TreeNode<_NodeData>.root(
      data: _NodeData(title: widget.rootTitle, codes: allCodes),
    );

    for (final group in widget.groups) {
      final perms = group.permissions ?? const [];
      final groupCodes = perms.map((e) => e.code).toSet();

      final groupNode = TreeNode<_NodeData>(
        data: _NodeData(title: group.groupName ?? '', codes: groupCodes),
      );

      for (final p in perms) {
        groupNode.add(
          TreeNode<_NodeData>(
            data: _NodeData(title: p.name, codes: {p.code}, isLeaf: true),
          ),
        );
      }

      root.add(groupNode);
    }

    return root;
  }

  bool? _triState(Set<String> selected, Set<String> codes) {
    if (codes.isEmpty) return false;
    final hits = codes.where(selected.contains).length;
    if (hits == 0) return false;
    if (hits == codes.length) return true;
    return null;
  }

  void _toggle(bool? checked, Set<String> codes) {
    final next = Set<String>.of(widget.selectedCodes.value);
    if (checked == true) {
      next.addAll(codes);
    } else {
      next.removeAll(codes);
    }
    widget.selectedCodes.value = next;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TreeView.simpleTyped<_NodeData, TreeNode<_NodeData>>(
            tree: _tree,
            indentation: const Indentation(
              color: AppColors.greyE2E8F0,
              style: IndentStyle.roundJoint,
              width: 20,
            ),
            expansionIndicatorBuilder: (context, node) => ChevronIndicator.rightDown(
              alignment: Alignment.centerLeft,
              color: AppColors.grey94A3B8,
              padding: const EdgeInsets.all(4),
              tree: node,
            ),
            builder: (context, node) {
              final data = node.data;
              if (data == null) return const SizedBox.shrink();

              return ValueListenableBuilder<Set<String>>(
                valueListenable: widget.selectedCodes,
                builder: (context, selected, _) {
                  final checkboxValue = data.isLeaf
                      ? (selected.contains(data.codes.first) ? true : false)
                      : _triState(selected, data.codes);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        SizedBox(width: 28),
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                            tristate: !data.isLeaf,
                            value: checkboxValue,
                            activeColor: AppColors.secondary,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (v) => _toggle(v, data.codes),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                            side: const BorderSide(color: AppColors.greyE2E8F0),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            data.title,
                            style: AppTypography.style(
                              14,
                              fontWeight: data.isLeaf ? FontWeight.w400 : FontWeight.w500,
                              color: data.isLeaf ? AppColors.grey334155 : AppColors.black111827,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(child: widget.subTree ?? Container()),
      ],
    );
  }
}

class _NodeData {
  final String title;
  final Set<String> codes;
  final bool isLeaf;

  const _NodeData({required this.title, required this.codes, this.isLeaf = false});
}
