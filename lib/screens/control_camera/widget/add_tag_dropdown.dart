import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tab_shape_icon.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tag_management_dialog.dart';

class AddTagDropdown extends StatefulWidget {
  final Offset position;
  final VoidCallback? onClose;
  final List<TagEntity> listTags;
  final Set<String> excludedCameraNames; // Camera đã có
  final Function(List<TagEntity>)? onTagsUpdated;
  final Function(List<TagEntity>)?
  onManageTagsClicked; // Callback khi click quản lý tags, truyền tags hiện tại

  const AddTagDropdown({
    super.key,
    required this.position,
    this.onClose,
    required this.listTags,
    this.onTagsUpdated,
    this.onManageTagsClicked,
    this.excludedCameraNames = const {},
  });

  @override
  State<AddTagDropdown> createState() => _AddCameraDropdownState();
}

class _AddCameraDropdownState extends State<AddTagDropdown> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<TagEntity> _tags = [];

  // Lưu trạng thái chọn của camera
  final Set<String> _selectedCameras = {};

  List<TagEntity> get _filteredCameras {
    final query = _searchController.text.toLowerCase();
    // Lọc bỏ các camera đã được chọn trong session và camera đã có trên map
    final availableCameras = _tags
        .where(
          (camera) =>
              !_selectedCameras.contains(camera.name) &&
              !widget.excludedCameraNames.contains(camera.name),
        )
        .toList();

    if (query.isEmpty) return availableCameras;
    return availableCameras
        .where((camera) => camera.name.toString().toLowerCase().contains(query))
        .toList();
  }

  void _toggleTag(int index) {
    setState(() {
      final actualIndex = _tags.indexWhere((tag) => tag.id == _tags[index].id);
      if (actualIndex != -1) {
        _tags[actualIndex].isSelected = !_tags[actualIndex].isSelected;
        _tags[index].isSelected = _tags[actualIndex].isSelected;
      }
    });
  }

  void _openTagManagement() async {
    final result = await showDialog<List<TagEntity>>(
      context: context,
      builder: (context) => TagManagementDialog(tags: _tags),
    );

    if (result != null) {
      setState(() {
        _tags = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tags = widget.listTags;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onClose,
          child: Container(color: Colors.transparent),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.3,
          top: MediaQuery.of(context).size.height * 0.5,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height:
                  MediaQuery.of(context).size.height *
                  0.4, // Chiều cao cố định cho container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 16.0,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Nhập tên tag',
                          hintStyle: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey8F95B2,
                          ),
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                            child: SvgPicture.asset(AppAssets.icSearch),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_isLoading)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    )
                  else
                    Expanded(
                      child: Column(
                        children: [
                          // Tags list
                          Flexible(
                            child: _filteredCameras.isEmpty
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    itemCount: _filteredCameras.length,
                                    itemBuilder: (context, index) {
                                      final tag = _filteredCameras[index];
                                      return InkWell(
                                        onTap: () => _toggleTag(index),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
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
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              Checkbox(
                                                value: tag.isSelected,
                                                onChanged: (value) =>
                                                    _toggleTag(index),
                                                activeColor:
                                                    AppColors.secondary,
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
                                  onTap: () {
                                    // Đóng overlay trước
                                    widget.onClose?.call();
                                    // Gọi callback để đóng AlertDialog và mở TagManagementDialog từ widget cha
                                    _openTagManagement();
                                  },
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
                                        onPressed: () => widget.onClose?.call(),
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          side: const BorderSide(
                                            color: AppColors.greyE2E8F0,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
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
                                          widget.onClose?.call();
                                          ;
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.secondary,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
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
                          // InkWell(
                          //   onTap: () async {
                          //     await showDialog<List<TagEntity>>(
                          //       context: context,
                          //       builder: (context) =>
                          //           TagManagementDialog(tags: _tags),
                          //     );
                          //   },
                          //   child: Text("Quản lý thẻ tag"),
                          // ),
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
