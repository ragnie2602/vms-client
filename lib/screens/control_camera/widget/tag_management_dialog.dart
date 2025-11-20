import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tab_shape_icon.dart';

/// Dialog quản lý tags (thêm, sửa, xóa)
class TagManagementDialog extends StatefulWidget {
  final List<TagEntity> tags;

  const TagManagementDialog({Key? key, required this.tags}) : super(key: key);

  @override
  State<TagManagementDialog> createState() => _TagManagementDialogState();
}

class _TagManagementDialogState extends State<TagManagementDialog> {
  late List<TagEntity> _tags;
  final TextEditingController _searchController = TextEditingController();
  List<TagEntity> _filteredTags = [];

  // Màu sắc mẫu cho tags
  final List<Color> _availableColors = [
    const Color(0xFFEF4444), // Red - Camera an ninh
    const Color(0xFF10B981), // Green - Camera ngoài trời
    const Color(0xFFF59E0B), // Orange - Camera hành lang
    const Color(0xFF8B5CF6), // Purple - Camera lớp học
    const Color(0xFFEAB308), // Yellow - Camera sảnh cầu thang
    const Color(0xFF3B82F6), // Blue
    const Color(0xFFEC4899), // Pink
    const Color(0xFF14B8A6), // Teal
  ];

  @override
  void initState() {
    super.initState();
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

  void _addTag() {
    showDialog(
      context: context,
      builder: (context) => _TagEditDialog(
        availableColors: _availableColors,
        onSave: (name, color) {
          setState(() {
            final newTag = TagEntity(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: name,
              color: color,
            );
            _tags.add(newTag);
            _filterTags(_searchController.text);
          });
        },
      ),
    );
  }

  void _editTag(TagEntity tag) {
    showDialog(
      context: context,
      builder: (context) => _TagEditDialog(
        tag: tag,
        availableColors: _availableColors,
        onSave: (name, color) {
          setState(() {
            final index = _tags.indexWhere((t) => t.id == tag.id);
            if (index != -1) {
              _tags[index] = TagEntity(
                id: tag.id,
                name: name,
                color: color,
              );
              _filterTags(_searchController.text);
            }
          });
        },
      ),
    );
  }

  void _deleteTag(TagEntity tag) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc muốn xóa tag "${tag.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _tags.removeWhere((t) => t.id == tag.id);
                _filterTags(_searchController.text);
              });
              Navigator.pop(context);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 500,
        constraints: const BoxConstraints(maxHeight: 650),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quản lý thẻ phân loại',
                    style: AppTypography.style(
                      18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 24),
                    onPressed: () => Navigator.pop(context, _tags),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.greyE2E8F0),

            // Search and Add button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterTags,
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm thẻ phân loại',
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
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _addTag,
                    icon: const Icon(Icons.add, size: 20),
                    label: const Text('Thêm'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tags list
            Flexible(
              child: _filteredTags.isEmpty
                  ? Center(
                      child: Text(
                        'Không có thẻ phân loại nào',
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
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.greyE2E8F0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              TagShapeIcon(
                                color: tag.color,
                                width: 22,
                                height: 12,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  tag.name,
                                  style: AppTypography.style(
                                    14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: AppColors.grey92929D,
                                ),
                                onPressed: () => _editTag(tag),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(width: 12),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onPressed: () => _deleteTag(tag),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),

            const Divider(height: 1, color: AppColors.greyE2E8F0),

            // Footer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, widget.tags),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppColors.greyE2E8F0),
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
                      onPressed: () => Navigator.pop(context, _tags),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Lưu',
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
            ),
          ],
        ),
      ),
    );
  }
}

/// Dialog để thêm/sửa tag
class _TagEditDialog extends StatefulWidget {
  final TagEntity? tag;
  final List<Color> availableColors;
  final Function(String name, Color color) onSave;

  const _TagEditDialog({
    Key? key,
    this.tag,
    required this.availableColors,
    required this.onSave,
  }) : super(key: key);

  @override
  State<_TagEditDialog> createState() => _TagEditDialogState();
}

class _TagEditDialogState extends State<_TagEditDialog> {
  late TextEditingController _nameController;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.tag?.name ?? '');
    _selectedColor = widget.tag?.color ?? widget.availableColors.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.tag == null ? 'Thêm thẻ phân loại' : 'Sửa thẻ phân loại',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Tên thẻ phân loại',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Chọn màu:'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: widget.availableColors.map((color) {
              final isSelected = color == _selectedColor;
              return GestureDetector(
                onTap: () => setState(() => _selectedColor = color),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.trim().isNotEmpty) {
              widget.onSave(_nameController.text.trim(), _selectedColor);
              Navigator.pop(context);
            }
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
