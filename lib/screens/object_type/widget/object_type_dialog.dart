import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/data/datasources/object_type_service.dart';
import 'package:vms_flutter_client/screens/home/components/components_src.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';
import 'package:vms_flutter_client/screens/object_type/widget/confirm_delete_dialog.dart';

/// Dialog for adding/editing Object Type with drag-drop field configuration
class ObjectTypeDialog extends StatefulWidget {
  const ObjectTypeDialog({super.key, this.objectType, required this.onSubmit});

  final ObjectType? objectType;
  final void Function(ObjectType objectType) onSubmit;

  bool get isEditMode => objectType != null;

  @override
  State<ObjectTypeDialog> createState() => _ObjectTypeDialogState();
}

class _ObjectTypeDialogState extends State<ObjectTypeDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  AIFeature _selectedAIFeature = AIFeature.face;
  ObjectTypeStatus _selectedStatus = ObjectTypeStatus.active;
  List<ObjectTypeField> _fields = [];
  bool _isLoadingFields = false;

  int _nextFieldId = 1;

  @override
  void initState() {
    super.initState();
    if (widget.isEditMode) {
      final obj = widget.objectType!;
      _nameController.text = obj.name;
      _descriptionController.text = obj.description;
      _selectedAIFeature = obj.aiFeature;
      _selectedStatus = obj.status;
      // Start with fields from list data (may be empty)
      _fields = List.from(obj.fields);
      // Fetch detail to get full dataFields
      _fetchDetail(obj.id);
    } else {
      // Default fields for new object type - SRS: must include "Tên đối tượng"
      _fields = [
        const ObjectTypeField(
          id: 'default_name',
          fieldName: 'Tên đối tượng',
          displayName: 'Tên đối tượng',
          dataType: FieldDataType.text,
          isDefault: true,
        ),
      ];
    }
  }

  Future<void> _fetchDetail(int id) async {
    setState(() => _isLoadingFields = true);
    try {
      final service = context.read<ObjectTypeService>();
      final detail = await service.getObjectTypeDetail(id);
      if (!mounted) return;
      setState(() {
        _nameController.text = detail.name;
        _descriptionController.text = detail.description;
        _selectedAIFeature = detail.aiFeature;
        _selectedStatus = detail.status;
        _fields = List.from(detail.fields);
        _isLoadingFields = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoadingFields = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addObjectInfoField() {
    setState(() {
      _fields.add(
        ObjectTypeField(
          id: 'new_field_${_nextFieldId++}',
          fieldName: '',
          displayName: '',
          dataType: FieldDataType.text,
          isDefault: false,
        ),
      );
    });
  }

  void _addFaceRecognitionField() {
    setState(() {
      _fields.add(
        ObjectTypeField(
          id: 'new_field_${_nextFieldId++}',
          fieldName: 'Ảnh nhận diện khuôn mặt',
          displayName: 'Ảnh nhận diện',
          dataType: FieldDataType.file,
          isDefault: false,
        ),
      );
    });
  }

  void _addLicensePlateField() {
    setState(() {
      _fields.add(
        ObjectTypeField(
          id: 'new_field_${_nextFieldId++}',
          fieldName: 'Biển số xe',
          displayName: 'Biển số xe',
          dataType: FieldDataType.text,
          isDefault: false,
        ),
      );
    });
  }

  /// Whether this field is a recognition field (Ảnh nhận diện / Biển số xe)
  bool _isRecognitionField(ObjectTypeField field) {
    return field.fieldName == 'Ảnh nhận diện khuôn mặt' ||
        field.fieldName == 'Biển số xe';
  }

  /// Whether this is a draft field (not yet saved to server)
  bool _isDraftField(ObjectTypeField field) {
    return field.id.startsWith('new_field_') || field.id.startsWith('default_');
  }

  void _removeField(int index) {
    final field = _fields[index];

    // SRS: Fixed default fields cannot be deleted
    if (field.isDefault) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Trường bắt buộc không thể xóa'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // SRS: Draft fields (newly added, not yet saved) → delete instantly
    if (_isDraftField(field)) {
      setState(() => _fields.removeAt(index));
      return;
    }

    // SRS: Saved fields → show confirmation popup
    // For edit mode, determine the right message
    final displayLabel = field.displayName.isNotEmpty
        ? field.displayName
        : field.fieldName;
    showDialog(
      context: context,
      builder: (context) => ConfirmDeleteDialog(
        title: 'Xóa trường dữ liệu',
        content:
            'Bạn có chắc chắn muốn xóa trường dữ liệu $displayLabel không?',
        onConfirm: () {
          setState(() => _fields.removeAt(index));
        },
      ),
    );
  }

  void _updateField(int index, ObjectTypeField field) {
    setState(() {
      _fields[index] = field;
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _fields.removeAt(oldIndex);
      _fields.insert(newIndex, item);
    });
  }

  void _handleSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    // SRS: Validate all field rows
    final fieldErrors = <String>[];
    final displayNames = <String>{};
    for (int i = 0; i < _fields.length; i++) {
      final f = _fields[i];
      if (f.fieldName.trim().isEmpty) {
        fieldErrors.add(
          'Dòng ${i + 1}: Tên trường dữ liệu không được để trống',
        );
      }
      if (f.displayName.trim().isEmpty) {
        fieldErrors.add('Dòng ${i + 1}: Tên hiển thị không được để trống');
      }
      // SRS: Validate duplicate displayName
      final dn = f.displayName.trim().toLowerCase();
      if (dn.isNotEmpty) {
        if (displayNames.contains(dn)) {
          fieldErrors.add('Dòng ${i + 1}: Tên hiển thị bị trùng');
        }
        displayNames.add(dn);
      }
    }

    if (fieldErrors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(fieldErrors.first), backgroundColor: Colors.red),
      );
      return;
    }

    final objectType = ObjectType(
      id: widget.objectType?.id ?? DateTime.now().millisecondsSinceEpoch,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      aiFeature: _selectedAIFeature,
      status: _selectedStatus,
      fields: _fields,
      objectCount: widget.objectType?.objectCount ?? 0,
    );
    widget.onSubmit(objectType);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 8, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.isEditMode
                  ? 'Chỉnh sửa loại đối tượng'
                  : 'Thêm loại đối tượng',
              style: AppTypography.style(
                20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.7,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  // Row 1: Name & Status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppField(
                          controller: _nameController,
                          hintText: 'Nhập tên loại đối tượng',
                          label: 'Tên loại đối tượng',
                          requiredField: true,
                          borderRadius: 3,
                          paddingBottomLabel: 3,
                          validator: (v) => v!.trim().isEmpty
                              ? 'Tên loại đối tượng không được để trống'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: _buildStatusDropdown()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Row 2: AI Feature & Description
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppField(
                          controller: _descriptionController,
                          hintText: 'Nhập mô tả',
                          label: 'Mô tả',
                          borderRadius: 3,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(flex: 2, child: SizedBox()),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Data Fields Section
                  _buildFieldsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton.outline(
                label: 'Hủy',
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 12),
              AppButton.filled(label: 'Lưu', onPressed: _handleSubmit),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Trạng thái',
            style: AppTypography.style(
              14,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton2<ObjectTypeStatus>(
            isExpanded: true,
            value: _selectedStatus,
            items: ObjectTypeStatus.values
                .map(
                  (status) => DropdownMenuItem(
                    value: status,
                    child: Text(
                      status.displayName,
                      style: AppTypography.style(14, color: AppColors.black),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedStatus = value);
              }
            },
            buttonStyleData: ButtonStyleData(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyE2E8F0),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildAIFeatureDropdown() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       RichText(
  //         text: TextSpan(
  //           text: 'Tính năng AI',
  //           style: AppTypography.style(14, color: AppColors.black, fontWeight: FontWeight.w500),
  //           children: const [
  //             TextSpan(
  //               text: ' *',
  //               style: TextStyle(color: Colors.red),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       DropdownButtonHideUnderline(
  //         child: DropdownButton2<AIFeature>(
  //           isExpanded: true,
  //           value: _selectedAIFeature,
  //           items: AIFeature.values
  //               .map(
  //                 (feature) => DropdownMenuItem(
  //                   value: feature,
  //                   child: Text(
  //                     feature.displayName,
  //                     style: AppTypography.style(14, color: AppColors.black),
  //                   ),
  //                 ),
  //               )
  //               .toList(),
  //           onChanged: (value) {
  //             if (value != null) {
  //               setState(() => _selectedAIFeature = value);
  //             }
  //           },
  //           buttonStyleData: ButtonStyleData(
  //             height: 44,
  //             decoration: BoxDecoration(
  //               border: Border.all(color: AppColors.greyE2E8F0),
  //               borderRadius: BorderRadius.circular(4),
  //             ),
  //             padding: const EdgeInsets.symmetric(horizontal: 12),
  //           ),
  //           dropdownStyleData: DropdownStyleData(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildFieldsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Thông tin',
              style: AppTypography.style(
                14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            MenuAnchor(
              menuChildren: [
                SubmenuButton(
                  menuChildren: [
                    MenuItemButton(
                      onPressed: () => _addFaceRecognitionField(),
                      child: Text(
                        'Ảnh nhận diện khuôn mặt',
                        style: AppTypography.style(
                          14,
                          color: AppColors.grey334155,
                        ),
                      ),
                    ),
                    MenuItemButton(
                      onPressed: () => _addLicensePlateField(),
                      child: Text(
                        'Biển số xe',
                        style: AppTypography.style(
                          14,
                          color: AppColors.grey334155,
                        ),
                      ),
                    ),
                  ],
                  child: Text(
                    'Thêm thông tin nhận diện',
                    style: AppTypography.style(14, color: AppColors.grey334155),
                  ),
                ),
                MenuItemButton(
                  onPressed: () => _addObjectInfoField(),
                  child: Text(
                    'Thêm thông tin đối tượng',
                    style: AppTypography.style(14, color: AppColors.grey334155),
                  ),
                ),
              ],
              builder: (context, controller, child) {
                return InkWell(
                  onTap: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blue005AA9,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Thêm trường dữ liệu',
                          style: AppTypography.style(
                            14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Header row
        _buildFieldsHeader(),
        const Divider(height: 1, color: AppColors.greyE2E8F0),
        // Fields list with drag-drop
        if (_isLoadingFields)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _fields.length,
            onReorder: _onReorder,
            buildDefaultDragHandles: false,
            itemBuilder: (context, index) {
              final field = _fields[index];
              return _buildFieldRow(
                key: ValueKey(field.id),
                field: field,
                index: index,
              );
            },
          ),
      ],
    );
  }

  Widget _buildFieldsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      color: AppColors.greyF2F4FA,
      child: Row(
        children: [
          const SizedBox(width: 32), // Drag handle space
          Expanded(
            flex: 2,
            child: Text(
              'Tên trường dữ liệu',
              style: AppTypography.style(
                13,
                fontWeight: FontWeight.w500,
                color: AppColors.black4A4A4A,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Icon',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              'Tên hiển thị',
              style: AppTypography.style(
                13,
                fontWeight: FontWeight.w500,
                color: AppColors.black4A4A4A,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Text(
              'Kiểu dữ liệu',
              style: AppTypography.style(
                13,
                fontWeight: FontWeight.w500,
                color: AppColors.black4A4A4A,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 60,
            child: Center(
              child: Text(
                'Thao tác',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black4A4A4A,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldRow({
    required Key key,
    required ObjectTypeField field,
    required int index,
  }) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyE2E8F0.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drag handle
          SizedBox(
            width: 32,
            child: ReorderableDragStartListener(
              index: index,
              child: SvgPicture.asset(AppAssets.icDrag),
            ),
          ),
          // Field name
          Expanded(
            flex: 2,
            child: _buildSmallTextField(
              initialValue: field.fieldName,
              hintText: 'Tên dữ liệu',
              maxLength: 50,
              onChanged: (value) {
                _updateField(index, field.copyWith(fieldName: value));
              },
            ),
          ),
          const SizedBox(width: 8),
          // Icon
          Expanded(
            flex: 1,
            child: Center(child: _buildIconPicker(index, field)),
          ),
          const SizedBox(width: 8),
          // Display name
          Expanded(
            flex: 2,
            child: _buildSmallTextField(
              initialValue: field.displayName,
              hintText: 'Tên hiển thị',
              maxLength: 50,
              onChanged: (value) {
                _updateField(index, field.copyWith(displayName: value));
              },
            ),
          ),
          const SizedBox(width: 8),
          // Data type – SRS: disabled for recognition fields
          Expanded(
            flex: 1,
            child: _isRecognitionField(field) || field.isDefault
                ? AbsorbPointer(
                    child: Opacity(
                      opacity: 0.5,
                      child: _buildDataTypeDropdown(index, field),
                    ),
                  )
                : _buildDataTypeDropdown(index, field),
          ),
          const SizedBox(width: 8),
          // Actions
          SizedBox(
            width: 60,
            child: Center(
              child: PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_horiz,
                  color: AppColors.grey6F767E,
                  size: 18,
                ),
                splashRadius: 16,
                offset: const Offset(0, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.white,
                onSelected: (value) {
                  if (value == 'delete') {
                    _removeField(index);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.icDelete,
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Xóa',
                          style: AppTypography.style(14, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconPicker(int index, ObjectTypeField field) {
    if (field.iconUrl != null) {
      // Show selected icon with remove button
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: SvgPicture.network(
              field.iconUrl!,
              width: 16,
              height: 16,
              placeholderBuilder: (_) => const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 1),
              ),
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () {
              _updateField(
                index,
                field.copyWith(iconName: null, iconUrl: null),
              );
            },
            child: const Icon(Icons.cancel, size: 16, color: Colors.red),
          ),
        ],
      );
    }

    // Show add icon button with dashed border
    return InkWell(
      onTap: () => _showIconPicker(index, field),
      borderRadius: BorderRadius.circular(4),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: AppColors.grey6F767E,
          strokeWidth: 1.0,
          gap: 4.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add, size: 14, color: AppColors.secondary),
              const SizedBox(width: 4),
              Text(
                'Thêm icon',
                style: AppTypography.style(12, color: AppColors.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallTextField({
    String? initialValue,
    required String hintText,
    int? maxLength,
    required ValueChanged<String> onChanged,
  }) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTypography.style(12, color: AppColors.grey64748B),
        counterText: '', // Hide default counter below
        suffixText: maxLength != null
            ? '${initialValue?.length ?? 0}/$maxLength'
            : null,
        suffixStyle: AppTypography.style(11, color: AppColors.grey64748B),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        isDense: true,
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
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
      ),
      style: AppTypography.style(12, color: AppColors.black),
    );
  }

  Widget _buildDataTypeDropdown(int index, ObjectTypeField field) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<FieldDataType>(
        isExpanded: true,
        value: field.dataType,
        items: FieldDataType.values
            .map(
              (type) => DropdownMenuItem(
                value: type,
                child: Text(type.displayName, style: AppTypography.style(12)),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            _updateField(index, field.copyWith(dataType: value));
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 36,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyE2E8F0),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showIconPicker(int index, ObjectTypeField field) {
    final objectTypeService = context.read<ObjectTypeService>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Chọn icon',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        content: SizedBox(
          width: 400,
          height: 300,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: objectTypeService.getIcons(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Lỗi tải icon: ${snapshot.error}',
                    style: AppTypography.style(14, color: Colors.red),
                  ),
                );
              }
              final icons = snapshot.data ?? [];
              if (icons.isEmpty) {
                return Center(
                  child: Text(
                    'Không có icon',
                    style: AppTypography.style(14, color: AppColors.grey6F767E),
                  ),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: icons.length,
                itemBuilder: (context, i) {
                  final iconData = icons[i];
                  final name = iconData['name'] as String;
                  final url = iconData['url'] as String;
                  final isSelected = field.iconUrl == url;
                  return InkWell(
                    onTap: () {
                      _updateField(
                        index,
                        field.copyWith(iconName: name, iconUrl: url),
                      );
                      Navigator.pop(dialogContext);
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.greyE2E8F0,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.network(
                        url,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColors.secondary : AppColors.black,
                          BlendMode.srcIn,
                        ),
                        placeholderBuilder: (_) => const Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 1),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(4),
      ),
    );

    // Draw dashed path using PathMetrics
    final double dashWidth = gap;
    final double dashSpace = gap;
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double end = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, end.clamp(0, metric.length)),
          paint,
        );
        distance = end + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
