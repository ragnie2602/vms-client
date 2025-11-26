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

class TagDropdown extends StatefulWidget {
  final Set<String> excludedCameraNames;
  final Set<TagEntity> selectedTags;

  final VoidCallback? onClose;
  final Function(List<TagEntity>)? onOpenTagManagement;
  final Function(TagEntity)? onTagSelected;

  final LayerLink tagLayerLink;
  final Offset targeterOffset;

  const TagDropdown({
    super.key,
    this.excludedCameraNames = const {},
    this.onClose,
    this.onOpenTagManagement,
    this.onTagSelected,
    required this.selectedTags,
    required this.targeterOffset,
    required this.tagLayerLink,
  });

  @override
  State<TagDropdown> createState() => _TagDropdownState();
}

class _TagDropdownState extends State<TagDropdown> {
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

  void _toggleTag(TagEntity tag) {
    setState(() {
      final actualIndex = _tags.indexWhere((t) => t == tag);
      if (actualIndex != -1) {
        _tags[actualIndex].isSelected = !_tags[actualIndex].isSelected;
        // Notify parent
        widget.onTagSelected?.call(_tags[actualIndex]);
      }
    });
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
          offset: Offset(0, 8),
          targetAnchor: Alignment.bottomCenter,
          link: widget.tagLayerLink,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints(maxHeight: 300),
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                        // Deep copy or just copy? TagEntity seems mutable (isSelected is not final).
                        // We need to sync with widget.selectedTags
                        for (var tag in state.tags) {
                          // Check if this tag is in selectedTags
                          // Using contains which uses TagEntity.== (based on ID)
                          final isSelected = widget.selectedTags.contains(tag);
                          // Create a copy to avoid modifying the state directly if it's shared (though state.tags usually new)
                          // But TagEntity has isSelected which is mutable.
                          // Let's assume we can modify it or copy it.
                          // Best to copy if we are modifying.
                          var newTag = tag.copyWith();
                          newTag.isSelected = isSelected;
                          _tags.add(newTag);
                        }
                      }
                      if (state is GetAllTagsFailState ||
                          _filteredTags.isEmpty) {
                        return Center(
                          child: Text(
                            "Không tìm thấy kết quả phù hợp",
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
                                onTap: () => _toggleTag(tag),
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
                                          color: tag.isSelected
                                              ? AppColors.blue085DA8
                                              : Colors.white,
                                          border: Border.all(
                                            color: tag.isSelected
                                                ? AppColors.blue085DA8
                                                : AppColors.greyE2E8F0,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: tag.isSelected
                                            ? const Icon(
                                                Icons.check,
                                                size: 14,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),
                                      const SizedBox(width: 12),
                                      TagShapeIcon(
                                        color: tag.color,
                                        width: 18,
                                        height: 12,
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          tag.name,
                                          style: AppTypography.style(
                                            14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
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
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Quản lý thẻ phân loại',
                          style: AppTypography.style(
                            15,
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
