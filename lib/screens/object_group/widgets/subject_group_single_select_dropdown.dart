import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';

class SubjectGroupSingleSelectDropdown extends StatefulWidget {
  final List<SubjectGroup> groups;
  final SubjectGroup? selectedGroup;
  final ValueChanged<SubjectGroup?> onChanged;
  final String label;

  const SubjectGroupSingleSelectDropdown({
    super.key,
    required this.groups,
    this.selectedGroup,
    required this.onChanged,
    required this.label,
  });

  @override
  State<SubjectGroupSingleSelectDropdown> createState() =>
      _SubjectGroupSingleSelectDropdownState();
}

class _SubjectGroupSingleSelectDropdownState
    extends State<SubjectGroupSingleSelectDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  final Set<int> _collapsedIds = {};
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<SubjectGroup> _buildTreeOrderedList() {
    final Map<int, List<SubjectGroup>> childrenMap = {};
    final List<SubjectGroup> roots = [];
    final Map<int, SubjectGroup> idMap = {};

    for (final group in widget.groups) {
      if (group.id != null) {
        idMap[group.id!] = group;
      }
      if (group.parentId == null || group.parentId == 0) {
        roots.add(group);
      } else {
        childrenMap.putIfAbsent(group.parentId!, () => []).add(group);
      }
    }

    final String query = removeDiacritics(_searchQuery.toLowerCase().trim());
    final bool isSearching = query.isNotEmpty;

    Set<int> includedIds = {};
    if (isSearching) {
      for (final group in widget.groups) {
        if (removeDiacritics(group.name?.toLowerCase() ?? '').contains(query)) {
          int? currentId = group.id;
          while (currentId != null &&
              currentId != 0 &&
              !includedIds.contains(currentId)) {
            includedIds.add(currentId);
            final parentId = idMap[currentId]?.parentId;
            currentId = parentId;
          }
        }
      }
    }

    final List<SubjectGroup> ordered = [];
    void dfs(SubjectGroup node) {
      if (isSearching && node.id != null && !includedIds.contains(node.id)) {
        return;
      }

      ordered.add(node);

      final bool isCollapsed = _collapsedIds.contains(node.id);
      if (isCollapsed) return;

      final children = childrenMap[node.id] ?? [];
      for (final child in children) {
        dfs(child);
      }
    }

    for (final root in roots) {
      dfs(root);
    }

    return ordered;
  }

  bool _hasChildren(SubjectGroup group) {
    return widget.groups.any((g) => g.parentId == group.id);
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    final spaceBelow = screenHeight - position.dy - size.height - 8;
    final spaceAbove = position.dy - 8;

    final openAbove = spaceBelow < 250 && spaceAbove > spaceBelow;
    final availableHeight = openAbove ? spaceAbove : spaceBelow;
    final dropdownMaxHeight = availableHeight.clamp(100.0, 300.0);

    final offset = openAbove ? const Offset(0, -4) : Offset(0, size.height + 4);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeDropdown,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: Alignment.topLeft,
              followerAnchor: openAbove
                  ? Alignment.bottomLeft
                  : Alignment.topLeft,
              offset: offset,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: dropdownMaxHeight,
                    maxWidth: size.width,
                    minWidth: size.width,
                  ),
                  child: StatefulBuilder(
                    builder: (context, setOverlayState) {
                      final orderedGroups = _buildTreeOrderedList();
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Nhập tên nhóm',
                                hintStyle: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey92929D,
                                ),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.greyE2E8F0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.greyE2E8F0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                if (_searchQuery != value) {
                                  _collapsedIds.clear();
                                }
                                _searchQuery = value;
                                setOverlayState(() {});
                              },
                            ),
                          ),
                          Flexible(
                            child: orderedGroups.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Text(
                                        'Không có dữ liệu hiển thị',
                                        style: AppTypography.style(
                                          14,
                                          color: AppColors.grey94A3B8,
                                        ),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: orderedGroups.length,
                                    itemBuilder: (context, index) {
                                      final group = orderedGroups[index];
                                      final groupId = group.id;
                                      if (groupId == null) {
                                        return const SizedBox.shrink();
                                      }
                                      final isSelected =
                                          widget.selectedGroup?.id == groupId;
                                      final level = group.level ?? 0;
                                      final hasChildren = _hasChildren(group);
                                      final isCollapsed = _collapsedIds
                                          .contains(groupId);

                                      return InkWell(
                                        onTap: () {
                                          widget.onChanged(group);
                                          _closeDropdown();
                                        },
                                        child: Container(
                                          color: isSelected
                                              ? AppColors.primary.withValues(
                                                  alpha: 0.1,
                                                )
                                              : Colors.transparent,
                                          padding: EdgeInsets.only(
                                            left: 12.0 + level * 20.0,
                                            right: 12,
                                            top: 8,
                                            bottom: 8,
                                          ),
                                          child: Row(
                                            children: [
                                              if (hasChildren)
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (isCollapsed) {
                                                        _collapsedIds.remove(
                                                          groupId,
                                                        );
                                                      } else {
                                                        _collapsedIds.add(
                                                          groupId,
                                                        );
                                                      }
                                                    });
                                                    setOverlayState(() {});
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 4,
                                                        ),
                                                    child: Icon(
                                                      !isCollapsed
                                                          ? Icons
                                                                .arrow_drop_down
                                                          : Icons.arrow_right,
                                                      size: 18,
                                                      color:
                                                          AppColors.grey64748B,
                                                    ),
                                                  ),
                                                )
                                              else
                                                const SizedBox(width: 22),
                                              Expanded(
                                                child: Text(
                                                  group.name ?? '',
                                                  style: AppTypography.style(
                                                    14,
                                                    color: isSelected
                                                        ? AppColors.primary
                                                        : AppColors.black,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              if (isSelected)
                                                const Icon(
                                                  Icons.check,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isOpen = false;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: AppTypography.style(
              12,
              color: AppColors.grey334155,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        CompositedTransformTarget(
          link: _layerLink,
          child: InkWell(
            onTap: _toggleDropdown,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isOpen ? AppColors.primary : AppColors.greyE2E8F0,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: widget.selectedGroup == null
                        ? Text(
                            'Lựa chọn nhóm đối tượng',
                            style: AppTypography.style(
                              14,
                              color: AppColors.grey94A3B8,
                            ),
                          )
                        : Text(
                            widget.selectedGroup!.name ?? '',
                            maxLines: 1,
                            style: AppTypography.style(
                              14,
                              color: AppColors.grey334155,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ),
                  Icon(
                    _isOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.grey64748B,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
