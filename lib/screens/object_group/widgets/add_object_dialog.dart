import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/map/widgets/dash_border_widget.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

class AddObjectDialog extends StatefulWidget {
  final ObjectType objectType;

  const AddObjectDialog({super.key, required this.objectType});

  @override
  State<AddObjectDialog> createState() => _AddObjectDialogState();
}

class _AddObjectDialogState extends State<AddObjectDialog> {
  // Controllers for text fields, keyed by fieldName
  final Map<String, TextEditingController> _textControllers = {};
  // Local file paths for preview, keyed by fieldName
  final Map<String, List<String>> _localFilePaths = {};
  // Uploaded file IDs, keyed by fieldName
  final Map<String, List<int>> _uploadedFileIds = {};
  // Uploading state per field
  final Map<String, bool> _uploadingFields = {};
  // Overall submitting state
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    for (final field in widget.objectType.fields) {
      if (field.dataType != FieldDataType.file) {
        _textControllers[field.fieldName] = TextEditingController();
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickAndUploadFiles(String fieldName) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);

    if (result == null || result.files.isEmpty) return;

    final newPaths = result.files.where((f) => f.path != null).map((f) => f.path!).toList();
    if (newPaths.isEmpty) return;

    // Add local paths for preview immediately
    setState(() {
      final existing = _localFilePaths[fieldName] ?? [];
      _localFilePaths[fieldName] = [...existing, ...newPaths];
      _uploadingFields[fieldName] = true;
    });

    // Upload each file immediately
    try {
      final repo = context.read<IObjectGroupRepository>();
      final existingIds = _uploadedFileIds[fieldName] ?? [];
      final List<int> newIds = [];

      for (final path in newPaths) {
        final fileId = await repo.uploadFile(path);
        newIds.add(fileId);
      }

      if (mounted) {
        setState(() {
          _uploadedFileIds[fieldName] = [...existingIds, ...newIds];
          _uploadingFields[fieldName] = false;
        });
      }
    } catch (e) {
      if (mounted) {
        // Remove the failed paths from preview
        setState(() {
          final paths = _localFilePaths[fieldName] ?? [];
          for (final path in newPaths) {
            paths.remove(path);
          }
          _localFilePaths[fieldName] = paths;
          _uploadingFields[fieldName] = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Tải file thất bại: $e')));
      }
    }
  }

  void _removeFile(String fieldName, int index) {
    setState(() {
      _localFilePaths[fieldName]?.removeAt(index);
      _uploadedFileIds[fieldName]?.removeAt(index);
      if (_localFilePaths[fieldName]?.isEmpty ?? true) {
        _localFilePaths.remove(fieldName);
      }
      if (_uploadedFileIds[fieldName]?.isEmpty ?? true) {
        _uploadedFileIds.remove(fieldName);
      }
    });
  }

  Future<void> _onConfirm() async {
    setState(() => _isSubmitting = true);

    try {
      final repo = context.read<IObjectGroupRepository>();

      // Build fieldValues map
      final Map<String, dynamic> fieldValues = {};
      for (final field in widget.objectType.fields) {
        if (field.dataType == FieldDataType.file) {
          final ids = _uploadedFileIds[field.fieldName];
          if (ids != null && ids.isNotEmpty) {
            fieldValues[field.fieldName] = ids;
          }
        } else {
          final text = _textControllers[field.fieldName]?.text ?? '';
          if (text.isNotEmpty) {
            fieldValues[field.fieldName] = text;
          }
        }
      }

      await repo.createObject(widget.objectType.id, fieldValues);

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Thêm đối tượng thành công')));
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Thêm đối tượng thất bại: $e')));
      }
    }
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
                  Expanded(
                    child: Text(
                      'Thêm đối tượng [${widget.objectType.name}]',
                      style: AppTypography.style(
                        16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey334155,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: AppColors.grey64748B, size: 20),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.greyE2E8F0),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...widget.objectType.fields.asMap().entries.map((entry) {
                      final index = entry.key;
                      final field = entry.value;
                      final fieldWidget = _buildFieldWidget(field);
                      if (index < widget.objectType.fields.length - 1) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: fieldWidget,
                        );
                      }
                      return fieldWidget;
                    }),
                  ],
                ),
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
                    onPressed: _isSubmitting ? () {} : () => Navigator.pop(context),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
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
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
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

  Widget _buildFieldWidget(ObjectTypeField field) {
    switch (field.dataType) {
      case FieldDataType.file:
        return _buildImagePicker(field);
      case FieldDataType.text:
      case FieldDataType.number:
      case FieldDataType.date:
        return _buildTextField(field);
    }
  }

  Widget _buildLabel(String label, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTypography.style(12, color: AppColors.grey334155, fontWeight: FontWeight.w600),
        children: isRequired
            ? [
                TextSpan(
                  text: ' *',
                  style: AppTypography.style(
                    12,
                    color: AppColors.redFF0004,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]
            : [],
      ),
    );
  }

  Widget _buildTextField(ObjectTypeField field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(field.displayName),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            controller: _textControllers[field.fieldName],
            style: AppTypography.style(14, color: AppColors.black),
            decoration: InputDecoration(
              hintText: 'Nhập ${field.displayName.toLowerCase()}',
              hintStyle: AppTypography.style(14, color: AppColors.grey94A3B8),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker(ObjectTypeField field) {
    final localPaths = _localFilePaths[field.fieldName] ?? [];
    final isUploading = _uploadingFields[field.fieldName] == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(field.displayName),
        const SizedBox(height: 8),

        // Image preview grid
        if (localPaths.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: localPaths.asMap().entries.map((entry) {
              final index = entry.key;
              final path = entry.value;
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.file(File(path), width: 80, height: 96, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: InkWell(
                      onTap: () => _removeFile(field.fieldName, index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.8),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(3),
                        child: const Icon(Icons.close, color: Colors.white, size: 12),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],

        // Pick file button
        CustomPaint(
          painter: DashedBorderPainter(),
          child: InkWell(
            onTap: isUploading ? null : () => _pickAndUploadFiles(field.fieldName),
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: isUploading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 8),
                        Text('Đang tải lên...'),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: AppColors.grey94A3B8, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Vui lòng chọn file có định dạng .PNG, .JPEG',
                          style: AppTypography.style(14, color: AppColors.grey94A3B8),
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
