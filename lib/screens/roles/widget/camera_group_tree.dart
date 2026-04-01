import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';

class _GroupNodeData {
  final String title;
  final Set<String> allIds;

  const _GroupNodeData({required this.title, required this.allIds});
}

class CameraGroupTree extends StatefulWidget {
  final ValueNotifier<Set<String>> selectedGroupIds;
  final String rootTitle;

  const CameraGroupTree({
    super.key,
    required this.selectedGroupIds,
    this.rootTitle = 'Tất cả',
  });

  @override
  State<CameraGroupTree> createState() => _CameraGroupTreeState();
}

class _CameraGroupTreeState extends State<CameraGroupTree> {
  TreeNode<_GroupNodeData>? _tree;

  @override
  void initState() {
    super.initState();
    context.read<GroupCameraBloc>().add(GetAllGroupCameraEvent());
  }

  // --- Tree building ---

  /// Đệ quy từ TreeNode<DeviceGroup> (đã build sẵn trong state) → TreeNode<_GroupNodeData>
  TreeNode<_GroupNodeData> _toGroupNode(TreeNode<DeviceGroup> source) {
    final data = source.data!;
    final allIds = _collectSourceIds(source);
    final node = TreeNode<_GroupNodeData>(
      data: _GroupNodeData(title: data.name, allIds: allIds),
    );
    for (final child in source.children.values.cast<TreeNode<DeviceGroup>>()) {
      node.add(_toGroupNode(child));
    }
    return node;
  }

  /// Thu thập tất cả idStr của một TreeNode<DeviceGroup> và con cháu của nó
  Set<String> _collectSourceIds(TreeNode<DeviceGroup> source) {
    final ids = <String>{};
    if (source.data != null) ids.add(source.data!.idStr);
    for (final child in source.children.values.cast<TreeNode<DeviceGroup>>()) {
      ids.addAll(_collectSourceIds(child));
    }
    return ids;
  }

  /// Build cây với root "Tất cả" bọc toàn bộ level-1 nodes
  TreeNode<_GroupNodeData> _buildTree(TreeNode<DeviceGroup> sourceTree) {
    final allIds = _collectSourceIds(sourceTree); // root không có data nên chỉ lấy của children

    final root = TreeNode<_GroupNodeData>.root(
      data: _GroupNodeData(title: widget.rootTitle, allIds: allIds),
    );

    for (final child in sourceTree.children.values.cast<TreeNode<DeviceGroup>>()) {
      root.add(_toGroupNode(child));
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
    return BlocConsumer<GroupCameraBloc, GroupCameraState>(
      listener: (context, state) {
        if (state is GetAllGroupCameraSuccessState) {
          setState(() => _tree = _buildTree(state.tree));
        }
      },
      builder: (context, state) {
        if (state is GroupCameraLoadingState && _tree == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetAllGroupCameraFailState && _tree == null) {
          return Center(child: Text(state.errorMsg));
        }

        if (_tree != null) {
          return TreeView.simpleTyped<_GroupNodeData, TreeNode<_GroupNodeData>>(
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
