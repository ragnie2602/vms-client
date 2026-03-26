import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';

class _SubjectGroupNodeData {
  final String title;
  final Set<String> allIds;

  const _SubjectGroupNodeData({required this.title, required this.allIds});
}

class SubjectGroupTree extends StatefulWidget {
  final ValueNotifier<Set<String>> selectedGroupIds;
  final String rootTitle;

  const SubjectGroupTree({
    super.key,
    required this.selectedGroupIds,
    this.rootTitle = 'Tất cả',
  });

  @override
  State<SubjectGroupTree> createState() => _SubjectGroupTreeState();
}

class _SubjectGroupTreeState extends State<SubjectGroupTree> {
  TreeNode<_SubjectGroupNodeData>? _tree;

  @override
  void initState() {
    super.initState();
    context.read<ObjectGroupBloc>().add(const LoadSubjectGroups());
  }

  // --- Tree building ---

  /// Thu thập tất cả id (string) của node + toàn bộ con cháu
  Set<String> _collectSourceIds(TreeNode<SubjectGroup> source) {
    final ids = <String>{};
    final id = source.data?.id;
    // Bỏ qua node giả "Danh sách đối tượng" (id == 0)
    if (id != null && id != 0) ids.add(id.toString());
    for (final child in source.children.values.cast<TreeNode<SubjectGroup>>()) {
      ids.addAll(_collectSourceIds(child));
    }
    return ids;
  }

  /// Đệ quy chuyển TreeNode<SubjectGroup> → TreeNode<_SubjectGroupNodeData>
  TreeNode<_SubjectGroupNodeData> _toCustomNode(TreeNode<SubjectGroup> source) {
    final data = source.data!;
    final allIds = _collectSourceIds(source);
    final node = TreeNode<_SubjectGroupNodeData>(
      data: _SubjectGroupNodeData(title: data.name ?? '', allIds: allIds),
    );
    for (final child in source.children.values.cast<TreeNode<SubjectGroup>>()) {
      node.add(_toCustomNode(child));
    }
    return node;
  }

  /// Build cây với root "Tất cả" — bỏ qua node giả id==0
  TreeNode<_SubjectGroupNodeData> _buildTree(TreeNode<SubjectGroup> sourceTree) {
    final allIds = <String>{};

    final realNodes = <TreeNode<SubjectGroup>>[];
    for (final child in sourceTree.children.values.cast<TreeNode<SubjectGroup>>()) {
      if ((child.data?.id ?? 0) != 0) {
        realNodes.add(child);
        allIds.addAll(_collectSourceIds(child));
      }
    }

    final root = TreeNode<_SubjectGroupNodeData>.root(
      data: _SubjectGroupNodeData(title: widget.rootTitle, allIds: allIds),
    );

    for (final node in realNodes) {
      root.add(_toCustomNode(node));
    }

    return root;
  }

  // --- Checkbox logic ---

  bool? _triState(Set<String> selected, Set<String> ids) {
    if (ids.isEmpty) return false;
    final hits = ids.where(selected.contains).length;
    if (hits == 0) return false;
    if (hits == ids.length) return true;
    return null;
  }

  void _toggle(bool? checked, Set<String> ids) {
    final next = Set<String>.of(widget.selectedGroupIds.value);
    if (checked == true) {
      next.addAll(ids);
    } else {
      next.removeAll(ids);
    }
    widget.selectedGroupIds.value = next;
  }

  // --- Build ---

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObjectGroupBloc, ObjectGroupState>(
      listenWhen: (prev, curr) =>
          prev.subjectGroupTree != curr.subjectGroupTree ||
          prev.isTreeLoading != curr.isTreeLoading,
      listener: (context, state) {
        final sourceTree = state.subjectGroupTree;
        if (sourceTree != null && !state.isTreeLoading) {
          setState(() => _tree = _buildTree(sourceTree));
        }
      },
      buildWhen: (prev, curr) =>
          prev.isTreeLoading != curr.isTreeLoading ||
          prev.status != curr.status,
      builder: (context, state) {
        if (state.isTreeLoading && _tree == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == ObjectGroupStatus.error && _tree == null) {
          return Center(child: Text(state.errorMessage ?? 'Lỗi tải dữ liệu'));
        }

        if (_tree != null) {
          return TreeView.simpleTyped<_SubjectGroupNodeData, TreeNode<_SubjectGroupNodeData>>(
            tree: _tree!,
            indentation: const Indentation(
              style: IndentStyle.roundJoint,
              color: AppColors.greyE2E8F0,
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
                valueListenable: widget.selectedGroupIds,
                builder: (context, selected, _) {
                  final checkboxValue = _triState(selected, data.allIds);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const SizedBox(width: 28),
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                            tristate: true,
                            value: checkboxValue,
                            activeColor: AppColors.secondary,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (v) => _toggle(v, data.allIds),
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
                              fontWeight: node.isLeaf ? FontWeight.w400 : FontWeight.w500,
                              color: node.isLeaf ? AppColors.grey334155 : AppColors.black111827,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
