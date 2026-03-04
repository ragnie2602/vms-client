import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';

class AddSubjectGroupDialog extends StatefulWidget {
  /// Pre-filled parent group info when adding from a specific tree node.
  /// If null, the user can select a parent from the dropdown.
  final String? parentGroupName;
  final int? parentGroupId;

  const AddSubjectGroupDialog({
    super.key,
    this.parentGroupName,
    this.parentGroupId,
  });

  @override
  State<AddSubjectGroupDialog> createState() => _AddSubjectGroupDialogState();
}

class _AddSubjectGroupDialogState extends State<AddSubjectGroupDialog> {
  final TextEditingController _nameController = TextEditingController();
  int? _selectedParentId;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedParentId = widget.parentGroupId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên nhóm đối tượng')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    context.read<ObjectGroupBloc>().add(
      CreateSubjectGroup(name: name, parentId: _selectedParentId ?? 0),
    );

    Navigator.pop(context, true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thêm nhóm đối tượng thành công')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thêm nhóm đối tượng',
                    style: AppTypography.style(
                      16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey334155,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.grey64748B,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.greyE2E8F0),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Group Name Field
                  _buildLabel('Tên nhóm đối tượng'),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _nameController,
                      style: AppTypography.style(14, color: AppColors.black),
                      decoration: InputDecoration(
                        hintText: 'Nhập tên nhóm đối tượng',
                        hintStyle: AppTypography.style(
                          14,
                          color: AppColors.grey94A3B8,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Parent Group Field
                  _buildLabel('Nhóm đối tượng cha'),
                  const SizedBox(height: 8),
                  _buildParentGroupSelector(),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EventCustomButton(
                    backgroundColor: Colors.white,
                    borderColor: AppColors.greyE2E8F0,
                    borderRadius: 4,
                    label: 'Hủy',
                    onPressed: _isSubmitting
                        ? () {}
                        : () => Navigator.pop(context),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 10,
                    ),
                    textStyle: AppTypography.style(
                      14,
                      color: AppColors.grey334155,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  _isSubmitting
                      ? const SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : EventCustomButton(
                          backgroundColor: AppColors.blue005AA9,
                          borderColor: AppColors.blue005AA9,
                          borderRadius: 4,
                          label: 'Xác nhận',
                          onPressed: _onConfirm,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 10,
                          ),
                          textStyle: AppTypography.style(
                            14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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

  Widget _buildLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTypography.style(
          12,
          color: AppColors.grey334155,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: ' *',
            style: AppTypography.style(
              12,
              color: AppColors.redFF0004,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentGroupSelector() {
    // If parentGroupId was pre-filled (clicked from a child node), show it as read-only
    if (widget.parentGroupId != null) {
      return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyE2E8F0),
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFFF8F9FE),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.parentGroupName ?? '',
          style: AppTypography.style(14, color: AppColors.black),
        ),
      );
    }

    // If no parentGroupId, show a dropdown from the available subject groups
    return BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
      buildWhen: (previous, current) =>
          previous.subjectGroups != current.subjectGroups,
      builder: (context, state) {
        final groups = state.subjectGroups;

        return SizedBox(
          height: 40,
          child: DropdownButtonFormField<int>(
            value: _selectedParentId,
            isExpanded: true,
            style: AppTypography.style(14, color: AppColors.black),
            decoration: InputDecoration(
              helperStyle: AppTypography.style(14, color: AppColors.redFF0000),
              hintText: 'Chọn nhóm đối tượng cha',
              hintStyle: AppTypography.style(14, color: AppColors.grey64748B),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            items: groups.map((SubjectGroup group) {
              return DropdownMenuItem<int>(
                value: group.id,
                child: Text(
                  group.name??'',
                  style: AppTypography.style(14, color: AppColors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedParentId = value;
              });
            },
          ),
        );
      },
    );
  }
}
