import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tag_management_dialog.dart';


/// Di-alog chọn tags
class TagSelectionDialog extends StatefulWidget {
  final List<TagEntity> tags;
  final Function(List<TagEntity>)? onTagsUpdated;

  const TagSelectionDialog({Key? key, required this.tags, this.onTagsUpdated})
    : super(key: key);

  @override
  State<TagSelectionDialog> createState() => _TagSelectionDialogState();
}

class _TagSelectionDialogState extends State<TagSelectionDialog> {
  late TextEditingController _searchController;
  late List<TagEntity> _tags;
  List<TagEntity> _filteredTags = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _tags = widget.tags.map((tag) => tag.copyWith()).toList();
    _filteredTags = List.from(_tags);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTags(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredTags = List.from(_tags);
      } else {
        _filteredTags = _tags
            .where(
              (tag) => tag.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _toggleTag(int index) {
    setState(() {
      final actualIndex = _tags.indexWhere(
        (tag) => tag.id == _filteredTags[index].id,
      );
      if (actualIndex != -1) {
        _tags[actualIndex] = _tags[actualIndex].copyWith(); // TODO:rewrite this
        _filteredTags[index] = _filteredTags[index].copyWith(); // TODO:rewrite this
      }
    });
  }

  Future<void> _openTagManagement() async {
    final result = await showDialog<List<TagEntity>>(
      context: context,
      builder: (context) => TagManagementDialog(tags: _tags),
    );

    if (result != null) {
      setState(() {
        _tags = result.map((tag) => tag.copyWith()).toList();
        _filterTags(_searchController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: MediaQuery.of(context).size.width * 0.3,
          top: MediaQuery.of(context).size.height * 0.5,
          child: Material(
            child: Container(
              width: 450,
              constraints: const BoxConstraints(maxHeight: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search field
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterTags,
                      decoration: InputDecoration(
                        hintText: 'Nhập tên tags',
                        hintStyle: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey92929D,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.grey92929D,
                        ),
                        filled: true,
                        fillColor: AppColors.greyF2F4FA,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),

                  // Tags list
                  Flexible(
                    child: _filteredTags.isEmpty
                        ? Center(
                            child: Text(
                              'Không tìm thấy tags',
                              style: AppTypography.style(
                                14,
                                color: AppColors.grey92929D,
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: _filteredTags.length,
                            itemBuilder: (context, index) {
                              final tag = _filteredTags[index];
                              return InkWell(
                                onTap: () => _toggleTag(index),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: tag.color,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          tag.name,
                                          style: AppTypography.style(
                                            14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      Checkbox(
                                        value: false,
                                        onChanged: (value) => _toggleTag(index),
                                        activeColor: AppColors.secondary,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  const Divider(height: 1, color: AppColors.greyE2E8F0),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Quản lý thẻ phân loại button
                        InkWell(
                          onTap: _openTagManagement,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.settings,
                                size: 20,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Quản lý thẻ phân loại',
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.greyE2E8F0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'Hủy',
                                  style: AppTypography.style(
                                    14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey92929D,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  widget.onTagsUpdated?.call(_tags);
                                  Navigator.pop(context, _tags);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'Xác nhận',
                                  style: AppTypography.style(
                                    14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
