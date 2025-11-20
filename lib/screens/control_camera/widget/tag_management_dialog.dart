import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tab_shape_icon.dart';

/// Dialog quản lý tags (thêm, sửa, xóa)
class TagManagementDialog extends StatefulWidget {
  final List<TagEntity> tags;

  const TagManagementDialog({super.key, required this.tags});

  @override
  State<TagManagementDialog> createState() => _TagManagementDialogState();
}

class _TagManagementDialogState extends State<TagManagementDialog> {
  // Màu sắc mẫu cho tags
  final List<Color> _availableColors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
  ];

  bool isAdding = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
      actions: [
        const Divider(height: 1, color: AppColors.greyF2F4FA),
        if (isAdding)
          SizedBox(
            width: double.infinity,
            child: _AddEditTagItem(
              onSave: (tag) => setState(() {
                isAdding = false;
                _saveTag(tag);
              }),
              suggestColor: _getSuggestColor(),
            ),
          ),

        SizedBox(height: 10),
        Material(
          child: InkWell(
            hoverColor: AppColors.blue005AA9.withOpacity(0.05),
            onTap: _addTempTag,
            splashColor: AppColors.blue005AA9.withOpacity(0.05),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: AppColors.blue005AA9),
                  Text(
                    'Thêm phân loại',
                    style: AppTypography.style(14, color: AppColors.blue005AA9),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      content: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.heightOf(context) * 480 / 1080),
        width: MediaQuery.widthOf(context) * 500 / 1600,
        child: BlocBuilder<ControlCameraBloc, ControlCameraState>(
          builder: (context, state) {
            if (state is CreateTagSuccessState) widget.tags.add(state.tag);
            if (state is DeleteTagSuccessState) {
              widget.tags.removeWhere((tag) => tag.id == state.id);
            }

            return widget.tags.isEmpty
                ? Center(
                    child: Text(
                      'Chưa có thẻ phân loại nào',
                      style: AppTypography.style(14, color: AppColors.grey92929D),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Danh sách thẻ phân loại',
                        style: AppTypography.style(16, fontWeight: FontWeight.w700),
                      ),
                      Flexible(
                        child: ListView.builder(
                          itemCount: widget.tags.length,
                          itemBuilder: (context, index) => _AddEditTagItem(
                            key: UniqueKey(),
                            onRemove: (id) => _deleteTag(id),
                            onSave: (tag) => _saveTag(tag),
                            tag: widget.tags[index],
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
      contentPadding: EdgeInsets.only(bottom: 10, left: 24, right: 24, top: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quản lý thẻ phân loại',
              style: AppTypography.style(20, fontWeight: FontWeight.w600, color: AppColors.black),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 24),
              onPressed: () => Navigator.pop(context, widget.tags),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
      titlePadding: EdgeInsets.zero,
    );
  }

  void _addTempTag() => setState(() => isAdding = true);

  void _deleteTag(List<int> id) => context.read<ControlCameraBloc>().add(DeleteTagEvent(id));

  void _saveTag(TagEntity tag) {
    context.read<ControlCameraBloc>().add(CreateTagEvent(tag));
  }

  Color _getSuggestColor() {
    final Map<int, int> colorCount = {for (var color in _availableColors) color.value: 0};
    for (var tag in widget.tags) {
      colorCount[tag.color.value] = (colorCount[tag.color.value] ?? 0) + 1;
    }
    final mostCommonColor = colorCount.entries.reduce((a, b) => a.value < b.value ? a : b).key;
    return Color(mostCommonColor);
  }
}

class _AddEditTagItem extends StatefulWidget {
  final TagEntity? tag;
  final Color? suggestColor;
  final Function(List<int> id)? onRemove;
  final Function(TagEntity tag) onSave;

  const _AddEditTagItem({
    super.key,
    this.tag,
    this.suggestColor,
    this.onRemove,
    required this.onSave,
  });
  @override
  State<_AddEditTagItem> createState() => _AddEditTagItemState();
}

class _AddEditTagItemState extends State<_AddEditTagItem> {
  final TextEditingController _nameController = TextEditingController();

  bool canSave = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.tag?.name ?? '';
    _nameController.addListener(
      () => setState(
        () =>
            canSave = (_nameController.text.isNotEmpty && _nameController.text != widget.tag?.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.widthOf(context) * 500 / 1600 - 48),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyE2E8F0),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          TagShapeIcon(color: widget.tag?.color ?? widget.suggestColor!, width: 18, height: 12),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintStyle: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey92929D,
                ),
                hintText: 'Nhập tên phân loại',
                isDense: true,
              ),
              maxLines: 1,
              style: AppTypography.style(14, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(width: 8),
          if (canSave)
            BlocBuilder<ControlCameraBloc, ControlCameraState>(
              builder: (context, state) {
                if (state is CreateTagLoadingState) return const CircularProgressIndicator();

                return ElevatedButton(
                  onPressed: () => widget.onSave(
                    TagEntity(
                      id: widget.tag?.id ?? [],
                      name: _nameController.text,
                      color: widget.tag?.color ?? widget.suggestColor!,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Text(
                    'Lưu',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          if (widget.tag != null && !canSave)
            SizedBox(
              height: 20,
              width: 20,
              child: IconButton(
                icon: SvgPicture.asset(AppAssets.icCloseSolid, width: 20, height: 20),
                iconSize: 20,
                onPressed: () => widget.onRemove?.call(widget.tag!.id),
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(padding: EdgeInsets.zero),
              ),
            ),
        ],
      ),
    );
  }
}
