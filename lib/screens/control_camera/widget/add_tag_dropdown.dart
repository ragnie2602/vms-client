import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tab_shape_icon.dart';

class AddTagDropdown extends StatefulWidget {
  final Set<String> excludedCameraNames;
  final Set<TagEntity> selectedTags;

  final VoidCallback? onClose;
  final Function(List<TagEntity>)? onOpenTagManagement;
  final Function(TagEntity)? onTagSelected;

  final LayerLink tagLayerLink;
  final Offset targeterOffset;

  final double? height;

  const AddTagDropdown({
    super.key,
    this.excludedCameraNames = const {},
    this.onClose,
    this.onOpenTagManagement,
    this.onTagSelected,
    required this.selectedTags,
    required this.targeterOffset,
    required this.tagLayerLink,
    this.height,
  });

  @override
  State<AddTagDropdown> createState() => _AddTagDropdownState();
}

class _AddTagDropdownState extends State<AddTagDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final List<TagEntity> _tags = [];

  List<TagEntity> get _filteredTags {
    final query = _searchController.text.toLowerCase();
    // Lọc bỏ các camera đã được chọn trong session và camera đã có trên map
    final availableTags = _tags
        .where((camera) => !widget.excludedCameraNames.contains(camera.name))
        .toList();

    if (query.isEmpty) return availableTags;
    return availableTags
        .where(
          (tag) => removeDiacritics(
            tag.name.toString().toLowerCase(),
          ).contains(removeDiacritics(query.toLowerCase())),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      context.read<ControlCameraBloc>().add(GetAllTagsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onClose,
          child: Container(color: Colors.transparent),
        ),
        CompositedTransformFollower(
          targetAnchor: Alignment.bottomLeft,
          link: widget.tagLayerLink,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: widget.height,
              constraints: BoxConstraints(
                maxHeight:
                    MediaQuery.of(context).size.height -
                    widget.targeterOffset.dy,
              ),
              width: MediaQuery.of(context).size.width * 613 / 1600 - 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
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
                  const SizedBox(height: 12),
                  BlocBuilder<ControlCameraBloc, ControlCameraState>(
                    buildWhen: (previous, current) =>
                        current is GetAllTagsSuccessState ||
                        current is GetAllTagsLoadingState ||
                        current is GetAllTagsFailState,
                    builder: (context, state) {
                      if (state is GetAllTagsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is GetAllTagsSuccessState) {
                        _tags.clear();
                        _tags.addAll(state.tags);
                        // Đồng bộ trạng thái isSelected dựa trên selectedTags
                        for (var tag in _tags) {
                          tag.isSelected = widget.selectedTags.contains(tag);
                        }
                      }
                      if (state is GetAllTagsFailState ||
                          _filteredTags.isEmpty) {
                        return Center(
                          child: Text(
                            "Không có dữ liệu",
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        );
                      }
                      return Flexible(
                        child: ListView.builder(
                          itemCount: _filteredTags.length,
                          itemBuilder: (context, index) {
                            final tag = _filteredTags[index];
                            return Material(
                              child: InkWell(
                                onTap: () {
                                  tag.isSelected = !tag.isSelected;
                                  widget.onTagSelected?.call(tag);
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                  ),
                                  child: Row(
                                    children: [
                                      TagShapeIcon(
                                        color: tag.color,
                                        width: 18,
                                        height: 12,
                                      ),
                                      const SizedBox(width: 8),
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
                                      const SizedBox(width: 8),
                                      tag.isSelected
                                          ? SvgPicture.asset(
                                              AppAssets.icCheck,
                                              color: AppColors.secondary,
                                              height: 22,
                                              width: 22,
                                            )
                                          : const SizedBox(
                                              width: 22,
                                              height: 22,
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: AppColors.greyE2E8F0),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () => widget.onOpenTagManagement?.call(_tags),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.tabSettings,
                          color: AppColors.blue085DA8,
                          height: 17,
                          width: 17,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Quản lý thẻ phân loại',
                          style: AppTypography.style(
                            13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blue085DA8,
                          ),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
