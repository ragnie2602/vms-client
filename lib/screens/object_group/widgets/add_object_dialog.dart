import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/map/widgets/dash_border_widget.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/image_upload_info_tooltip.dart';

class AddObjectDialog extends StatefulWidget {
  final ObjectType objectType;
  final ObjectData? existingObject; // null for create, non-null for edit
  final List<SubjectGroup> subjectGroups;
  final SubjectGroup? initialSubjectGroup;

  const AddObjectDialog({
    super.key,
    required this.objectType,
    this.existingObject,
    this.subjectGroups = const [],
    this.initialSubjectGroup,
  });

  bool get isEditMode => existingObject != null;

  @override
  State<AddObjectDialog> createState() => _AddObjectDialogState();
}

class _AddObjectDialogState extends State<AddObjectDialog> {
  // Controllers for text fields, keyed by fieldName
  final Map<String, TextEditingController> _textControllers = {};
  // Local file paths for preview (newly picked files), keyed by fieldName
  final Map<String, List<String>> _localFilePaths = {};
  // Existing image URLs from server (edit mode), keyed by fieldName
  final Map<String, List<String>> _existingImageUrls = {};
  // Uploaded file IDs (newly uploaded), keyed by fieldName
  final Map<String, List<int>> _uploadedFileIds = {};
  // Uploading state per field
  final Map<String, bool> _uploadingFields = {};
  // Loading detail state
  bool _isLoadingDetail = false;
  // Overall submitting state
  bool _isSubmitting = false;
  // Selected subject group IDs
  final Set<int> _selectedSubjectGroupIds = {};
  // Drag and drop state per field
  final Map<String, bool> _isDragging = {};
  // Validation errors
  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    // Initialize text controllers
    for (final field in widget.objectType.fields) {
      if (field.dataType != FieldDataType.file) {
        _textControllers[field.fieldName] = TextEditingController();
        _errors[field.fieldName] = null;
      }
    }

    // If edit mode, fetch detail and pre-fill
    if (widget.isEditMode) {
      _loadObjectDetail();
    } else {
      // check init group
      if (widget.initialSubjectGroup?.id != null) {
        _selectedSubjectGroupIds.add(widget.initialSubjectGroup!.id!);
      }
    }
  }

  Future<void> _loadObjectDetail() async {
    setState(() => _isLoadingDetail = true);
    try {
      final repo = context.read<IObjectGroupRepository>();
      final detail = await repo.getObjectDetail(widget.existingObject!.id);

      if (!mounted) return;

      // Pre-fill text fields
      for (final field in widget.objectType.fields) {
        final value = detail.fieldValues[field.fieldName];
        if (field.dataType != FieldDataType.file) {
          _textControllers[field.fieldName]?.text = value?.toString() ?? '';
        } else {
          // Handle image fields - value is a list of URLs
          if (value is List && value.isNotEmpty) {
            _existingImageUrls[field.fieldName] = value
                .map((e) => e.toString())
                .toList();
          }
        }
      }

      // Pre-select subject groups from existing object
      if (detail.subjectGroups.isNotEmpty) {
        _selectedSubjectGroupIds.addAll(
          detail.subjectGroups.where((g) => g.id != null).map((g) => g.id!),
        );
      }

      setState(() => _isLoadingDetail = false);
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingDetail = false);
        ToastUtil.toastFail(
          context: context,
          title: Text('$e'),
        );
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
    const maxImages = 6;
    final currentExisting = (_existingImageUrls[fieldName] ?? []).length;
    final currentLocal = (_localFilePaths[fieldName] ?? []).length;
    final remaining = maxImages - currentExisting - currentLocal;
    if (remaining <= 0) return;

    final isRecognitionImage = fieldName == 'Ảnh nhận diện khuôn mặt';
    final pickerExtensions = isRecognitionImage
        ? ['bmp', 'jpg', 'png']
        : ['jpg', 'jpeg', 'png'];

    // Pick files
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: pickerExtensions,
      allowMultiple: remaining > 1,
    );

    if (result == null || result.files.isEmpty) return;

    setState(() {
      if (_errors[fieldName] != null) {
        _errors[fieldName] = null;
      }
    });

    bool hasInvalidFormats = false;
    final allowedExtensions = isRecognitionImage
        ? ['.bmp', '.jpg', '.png']
        : ['.jpg', '.jpeg', '.png'];
    var newPaths = result.files
        .where((f) => f.path != null)
        .where((f) {
          final ext = p.extension(f.path!).toLowerCase();
          if (!allowedExtensions.contains(ext)) {
            hasInvalidFormats = true;
            return false;
          }
          return true;
        })
        .map((f) => f.path!)
        .toList();

    if (newPaths.isEmpty) {
      if (hasInvalidFormats && mounted) {
        ToastUtil.toastFail(
          context: context,
          title: Text(
            isRecognitionImage
                ? 'Định dạng file không hỗ trợ. Chỉ hỗ trợ BMP, JPG, PNG.'
                : 'Định dạng file không hỗ trợ. Chỉ hỗ trợ JPG, JPEG, PNG.',
          ),
        );
      }
      return;
    }

    // Truncate to remaining slots
    if (newPaths.length > remaining) {
      newPaths = newPaths.sublist(0, remaining);
    }

    // Process and compress images if needed
    final List<String> processedPaths = [];
    bool hasSmallFiles = false;

    for (final path in newPaths) {
      final file = File(path);
      final length = await file.length();

      if (length < 2048) {
        hasSmallFiles = true;
        continue; // Skip files smaller than 2KB
      }

      if (length > 5242880) {
        // > 5MB
        final tempDir = await getTemporaryDirectory();
        final ext = p.extension(path);
        // Use jpeg if extension is unsupported by compressor
        final targetExt =
            (ext.toLowerCase() == '.png' ||
                ext.toLowerCase() == '.jpg' ||
                ext.toLowerCase() == '.bmp')
            ? ext
            : '.jpg';
        final targetPath = p.join(
          tempDir.path,
          '${DateTime.now().millisecondsSinceEpoch}_comp$targetExt',
        );

        final format = targetExt.toLowerCase() == '.png'
            ? CompressFormat.png
            : (targetExt.toLowerCase() == '.webp'
                  ? CompressFormat.webp
                  : CompressFormat.jpeg);

        XFile? compressResult;
        try {
          compressResult = await FlutterImageCompress.compressAndGetFile(
            path,
            targetPath,
            quality: 70,
            minWidth: 1024,
            minHeight: 1024,
            format: format,
          );

          // Loop to ensure size <= 1MB
          int currentQuality = 70;
          while (compressResult != null &&
              await File(compressResult.path).length() > 1048576 &&
              currentQuality > 10) {
            currentQuality -= 20;
            final newTargetPath = p.join(
              tempDir.path,
              '${DateTime.now().millisecondsSinceEpoch}_comp_q${currentQuality}$targetExt',
            );
            compressResult = await FlutterImageCompress.compressAndGetFile(
              path,
              newTargetPath,
              quality: currentQuality,
              minWidth: 1024,
              minHeight: 1024,
              format: format,
            );
          }
        } catch (e) {
          debugPrint('Image compression error: $e');
          compressResult = null; // fallback to original path
        }

        if (compressResult != null &&
            await File(compressResult.path).length() <= 5242880) {
          processedPaths.add(compressResult.path);
        } else if (compressResult != null) {
          processedPaths.add(compressResult.path);
        } else {
          processedPaths.add(path); // Fallback to original
        }
      } else {
        processedPaths.add(path);
      }
    }

    if (processedPaths.isEmpty) {
      if (hasSmallFiles && mounted) {
        ToastUtil.toastFail(
          context: context,
          title: const Text('Kích thước ảnh phải từ 2KB trở lên.'),
        );
      }
      return;
    }

    if (hasSmallFiles && mounted) {
      ToastUtil.toastFail(
        context: context,
        title: const Text('Đã bỏ qua các ảnh nhỏ hơn 2KB.'),
      );
    }

    // Add local paths for preview immediately
    setState(() {
      final existing = _localFilePaths[fieldName] ?? [];
      _localFilePaths[fieldName] = [...existing, ...processedPaths];
      _uploadingFields[fieldName] = true;
    });

    // Upload each file immediately
    final repo = context.read<IObjectGroupRepository>();
    final List<String> failedPaths = [];
    final List<int> newIds = [];

    for (final path in processedPaths) {
      try {
        final fileId = await repo.uploadFile(path);
        newIds.add(fileId);
      } catch (e) {
        failedPaths.add(path);
      }
    }

    if (mounted) {
      setState(() {
        final existingIds = _uploadedFileIds[fieldName] ?? [];
        _uploadedFileIds[fieldName] = [...existingIds, ...newIds];
        _uploadingFields[fieldName] = false;

        if (failedPaths.isNotEmpty) {
          // Remove failed paths from preview
          final paths = _localFilePaths[fieldName] ?? [];
          for (final p in failedPaths) {
            paths.remove(p);
          }
          _localFilePaths[fieldName] = paths;
        }
      });

      if (failedPaths.length == processedPaths.length) {
        ToastUtil.toastFail(
          context: context,
          title: const Text('Ảnh không đạt tiêu chuẩn. Vui lòng thử lại.'),
        );
      } else if (failedPaths.isNotEmpty) {
        ToastUtil.toastSuccess(
          context: context,
          title: const Text('Tải ảnh thành công một phần. Đã loại bỏ ảnh lỗi.'),
        );
      }
    }
  }

  void _removeLocalFile(String fieldName, int index) {
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

  void _removeExistingImage(String fieldName, int index) {
    setState(() {
      _existingImageUrls[fieldName]?.removeAt(index);
      if (_existingImageUrls[fieldName]?.isEmpty ?? true) {
        _existingImageUrls.remove(fieldName);
      }
    });
  }

  /// Extract file ID from URL like "http://vs.vivas.vn/api/files/view/3320"
  int? _extractFileIdFromUrl(String url) {
    final match = RegExp(r'/files/view/(\d+)').firstMatch(url);
    if (match != null) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }

  Future<void> _onConfirm() async {
    // Validate required fields
    bool hasError = false;
    setState(() {
      _errors.clear();
      for (final field in widget.objectType.fields) {
        final isNameField =
            field.fieldName == 'name' || field.fieldName == 'Tên đối tượng';
        final isImageField = field.fieldName == 'Ảnh nhận diện khuôn mặt';
        final isRequired = field.isRequired || isNameField || isImageField;

        if (field.dataType != FieldDataType.file) {
          final text = _textControllers[field.fieldName]?.text.trim() ?? '';
          if (isRequired && text.isEmpty) {
            _errors[field.fieldName] =
                '${field.displayName} không được để trống';
            hasError = true;
          }
        } else {
          final localPaths = _localFilePaths[field.fieldName] ?? [];
          final existingUrls = _existingImageUrls[field.fieldName] ?? [];
          if (isRequired && localPaths.isEmpty && existingUrls.isEmpty) {
            _errors[field.fieldName] =
                'Vui lòng chọn ít nhất 1 ${field.displayName.toLowerCase()}';
            hasError = true;
          }
        }
      }

      // Additional check for subject group if required
      if (widget.subjectGroups.isNotEmpty && _selectedSubjectGroupIds.isEmpty) {
        _errors['subjectGroup'] = 'Vui lòng chọn ít nhất 1 nhóm đối tượng';
        hasError = true;
      }
    });

    if (hasError) return;

    setState(() => _isSubmitting = true);

    try {
      final repo = context.read<IObjectGroupRepository>();

      // Build fieldValues map
      final Map<String, dynamic> fieldValues = {};
      for (final field in widget.objectType.fields) {
        if (field.dataType == FieldDataType.file) {
          final List<int> allIds = [];

          // Add IDs from existing images (edit mode - kept images)
          final existingUrls = _existingImageUrls[field.fieldName] ?? [];
          for (final url in existingUrls) {
            final id = _extractFileIdFromUrl(url);
            if (id != null) allIds.add(id);
          }

          // Add IDs from newly uploaded files
          final newIds = _uploadedFileIds[field.fieldName] ?? [];
          allIds.addAll(newIds);

          if (allIds.isNotEmpty) {
            fieldValues[field.fieldName] = allIds;
          }
        } else {
          final text = _textControllers[field.fieldName]?.text ?? '';
          if (text.isNotEmpty) {
            fieldValues[field.fieldName] = text;
          }
        }
      }

      final subjectGroupIds = _selectedSubjectGroupIds.toList();

      if (widget.isEditMode) {
        await repo.updateObject(
          widget.existingObject!.id,
          widget.objectType.id,
          fieldValues,
          subjectGroupIds: subjectGroupIds,
        );
      } else {
        await repo.createObject(
          widget.objectType.id,
          fieldValues,
          subjectGroupIds: subjectGroupIds,
        );
      }

      if (mounted) {
        Navigator.pop(context, true);
        ToastUtil.toastSuccess(
          context: context,
          title: Text(
            widget.isEditMode
                ? 'Sửa đối tượng thành công'
                : 'Thêm đối tượng thành công',
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ToastUtil.toastFail(
          context: context,
          title: Text(
            widget.isEditMode
                ? 'Sửa đối tượng thất bại: $e'
                : 'Thêm đối tượng thất bại: $e',
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isEditMode
        ? 'Sửa ${widget.objectType.name}'
        : 'Thêm ${widget.objectType.name}';

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
                      title,
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
            Flexible(
              child: _isLoadingDetail
                  ? const Padding(
                      padding: EdgeInsets.all(48),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...widget.objectType.fields.asMap().entries.map((
                            entry,
                          ) {
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
                          if (widget.subjectGroups.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            _buildSubjectGroupMultiSelect(),
                          ],
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

  Widget _buildFieldWidget(ObjectTypeField field) {
    switch (field.dataType) {
      case FieldDataType.file:
        return _buildImagePicker(field);
      case FieldDataType.text:
        // case FieldDataType.number:
        // case FieldDataType.date:
        return _buildTextField(field);
    }
  }

  Widget _buildLabel(String label, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTypography.style(
          12,
          color: AppColors.grey334155,
          fontWeight: FontWeight.w600,
        ),
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
    final isNameField =
        field.fieldName == 'name' || field.fieldName == 'Tên đối tượng';
    final isRequired = field.isRequired || isNameField;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(field.displayName, isRequired: isRequired),
        const SizedBox(height: 8),
        SizedBox(
          height: _errors[field.fieldName] != null ? 60 : 40,
          child: TextField(
            controller: _textControllers[field.fieldName],
            style: AppTypography.style(14, color: AppColors.black),
            onChanged: (val) {
              if (_errors[field.fieldName] != null) {
                setState(() => _errors[field.fieldName] = null);
              }
            },
            decoration: InputDecoration(
              hintText: 'Nhập ${field.displayName.toLowerCase()}',
              hintStyle: AppTypography.style(14, color: AppColors.grey94A3B8),
              errorText: _errors[field.fieldName],
              errorStyle: AppTypography.style(12, color: AppColors.redFF0004),
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
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker(ObjectTypeField field) {
    final localPaths = _localFilePaths[field.fieldName] ?? [];
    final existingUrls = _existingImageUrls[field.fieldName] ?? [];
    final isUploading = _uploadingFields[field.fieldName] == true;
    final totalImages = existingUrls.length + localPaths.length;
    const maxImages = 6;
    final canAddMore = totalImages < maxImages && !isUploading;
    final isImageField = field.fieldName == 'Ảnh nhận diện khuôn mặt';
    final isRequired = field.isRequired || isImageField;

    return DropTarget(
      onDragEntered: (_) => setState(() => _isDragging[field.fieldName] = true),
      onDragExited: (_) => setState(() => _isDragging[field.fieldName] = false),
      onDragDone: (details) {
        setState(() {
          _isDragging[field.fieldName] = false;
          if (_errors[field.fieldName] != null) {
            _errors[field.fieldName] = null;
          }
        });
        _handleDroppedFiles(field.fieldName, details);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: (_isDragging[field.fieldName] == true)
              ? Border.all(color: AppColors.primary, width: 2)
              : null,
          color: (_isDragging[field.fieldName] == true)
              ? AppColors.primary.withValues(alpha: 0.05)
              : null,
        ),
        padding: (_isDragging[field.fieldName] == true)
            ? const EdgeInsets.all(6)
            : EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildLabel(field.displayName, isRequired: isRequired),
                if (isImageField) ...[
                  const SizedBox(width: 6),
                  const ImageUploadInfoTooltip(),
                ],
              ],
            ),
            const SizedBox(height: 8),

            if (totalImages > 0 || isUploading) ...[
              // Grid layout: 3 columns
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 80 / 96,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Existing server images
                  ...existingUrls.asMap().entries.map((entry) {
                    final index = entry.key;
                    final url = entry.value;
                    return _buildImageTile(
                      child: InkWell(
                        onTap: () =>
                            _showImagePreviewDialog(context, imageUrl: url),
                        child: CachedNetworkImage(
                          imageUrl: url,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.greyE2E8F0,
                            child: const Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.greyE2E8F0,
                            child: const Icon(Icons.broken_image, size: 20),
                          ),
                        ),
                      ),
                      onRemove: () =>
                          _removeExistingImage(field.fieldName, index),
                    );
                  }),
                  // Newly picked local images
                  ...localPaths.asMap().entries.map((entry) {
                    final index = entry.key;
                    final path = entry.value;
                    return _buildImageTile(
                      child: InkWell(
                        onTap: () =>
                            _showImagePreviewDialog(context, localPath: path),
                        child: Image.file(
                          File(path),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onRemove: () => _removeLocalFile(field.fieldName, index),
                    );
                  }),
                  // "+" add button (inline in grid)
                  if (canAddMore)
                    InkWell(
                      onTap: () => _pickAndUploadFiles(field.fieldName),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyE2E8F0),
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.greyF2F4FA,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 32,
                            color: AppColors.grey94A3B8,
                          ),
                        ),
                      ),
                    ),
                  // Uploading indicator
                  if (isUploading)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyE2E8F0),
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.greyF2F4FA,
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    ),
                ],
              ),
            ] else ...[
              CustomPaint(
                painter: DashedBorderPainter(
                  isError: _errors[field.fieldName] != null,
                ),
                child: InkWell(
                  onTap: () => _pickAndUploadFiles(field.fieldName),
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: AppColors.grey94A3B8),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            isImageField
                                ? 'Vui lòng kéo thả hoặc chọn file có định\ndạng .BMP, .PNG, .JPEG'
                                : 'Vui lòng kéo thả hoặc chọn file có định\ndạng .JPG, .JPEG, .PNG',
                            textAlign: TextAlign.center,
                            style: AppTypography.style(
                              14,
                              color: AppColors.grey94A3B8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            if (_errors[field.fieldName] != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _errors[field.fieldName]!,
                  style: AppTypography.style(12, color: AppColors.redFF0004),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleDroppedFiles(
    String fieldName,
    DropDoneDetails details,
  ) async {
    const maxImages = 6;
    final currentExisting = (_existingImageUrls[fieldName] ?? []).length;
    final currentLocal = (_localFilePaths[fieldName] ?? []).length;
    final remaining = maxImages - currentExisting - currentLocal;
    if (remaining <= 0) return;

    // Filter for image files only
    final isRecognitionImage = fieldName == 'Ảnh nhận diện khuôn mặt';
    final imageExtensions = isRecognitionImage
        ? ['.bmp', '.jpg', '.jpeg', '.png']
        : ['.jpg', '.jpeg', '.png'];
    bool hasInvalidFormats = false;

    var droppedPaths = details.files
        .where((f) {
          final ext = p.extension(f.path).toLowerCase();
          if (!imageExtensions.contains(ext)) {
            hasInvalidFormats = true;
            return false;
          }
          return true;
        })
        .map((f) => f.path)
        .toList();

    if (droppedPaths.isEmpty) {
      if (hasInvalidFormats && mounted) {
        ToastUtil.toastFail(
          context: context,
          title: Text(
            isRecognitionImage
                ? 'Định dạng file không hỗ trợ. Chỉ hỗ trợ BMP, JPG, PNG.'
                : 'Định dạng file không hỗ trợ. Chỉ hỗ trợ JPG, JPEG, PNG.',
          ),
        );
      }
      return;
    }

    // Truncate to remaining slots
    if (droppedPaths.length > remaining) {
      droppedPaths = droppedPaths.sublist(0, remaining);
    }

    // Process and compress images if needed
    final List<String> processedPaths = [];
    bool hasSmallFiles = false;

    for (final path in droppedPaths) {
      final file = File(path);
      final length = await file.length();

      if (length < 2048) {
        hasSmallFiles = true;
        continue; // Skip files smaller than 2KB
      }

      if (length > 5242880) {
        // > 5MB
        final tempDir = await getTemporaryDirectory();
        final ext = p.extension(path);
        final targetExt =
            (ext.toLowerCase() == '.png' ||
                ext.toLowerCase() == '.jpg' ||
                ext.toLowerCase() == '.jpeg' ||
                ext.toLowerCase() == '.webp')
            ? ext
            : '.jpg';
        final targetPath = p.join(
          tempDir.path,
          '${DateTime.now().millisecondsSinceEpoch}_comp$targetExt',
        );

        final format = targetExt.toLowerCase() == '.png'
            ? CompressFormat.png
            : (targetExt.toLowerCase() == '.webp'
                  ? CompressFormat.webp
                  : CompressFormat.jpeg);

        XFile? compressResult;
        try {
          compressResult = await FlutterImageCompress.compressAndGetFile(
            path,
            targetPath,
            quality: 70,
            minWidth: 1024,
            minHeight: 1024,
            format: format,
          );

          // Loop to ensure size <= 1MB
          int currentQuality = 70;
          while (compressResult != null &&
              await File(compressResult.path).length() > 1048576 &&
              currentQuality > 10) {
            currentQuality -= 20;
            final newTargetPath = p.join(
              tempDir.path,
              '${DateTime.now().millisecondsSinceEpoch}_comp_q$currentQuality$targetExt',
            );
            compressResult = await FlutterImageCompress.compressAndGetFile(
              path,
              newTargetPath,
              quality: currentQuality,
              minWidth: 1024,
              minHeight: 1024,
              format: format,
            );
          }
        } catch (e) {
          debugPrint('Image compression error: $e');
          compressResult = null; // fallback to original path
        }

        if (compressResult != null &&
            await File(compressResult.path).length() <= 5242880) {
          processedPaths.add(compressResult.path);
        } else if (compressResult != null) {
          processedPaths.add(compressResult.path);
        } else {
          processedPaths.add(path); // Fallback to original
        }
      } else {
        processedPaths.add(path);
      }
    }

    if (processedPaths.isEmpty) {
      if (hasSmallFiles && mounted) {
        ToastUtil.toastFail(
          context: context,
          title: const Text('Kích thước ảnh phải từ 2KB trở lên.'),
        );
      }
      return;
    }

    if (hasSmallFiles && mounted) {
      ToastUtil.toastFail(
        context: context,
        title: const Text('Đã bỏ qua các ảnh nhỏ hơn 2KB.'),
      );
    }

    // Add local paths for preview
    setState(() {
      final existing = _localFilePaths[fieldName] ?? [];
      _localFilePaths[fieldName] = [...existing, ...processedPaths];
      _uploadingFields[fieldName] = true;
    });

    // Upload each file
    final repo = context.read<IObjectGroupRepository>();
    final List<String> failedPaths = [];
    final List<int> newIds = [];

    for (final path in processedPaths) {
      try {
        final fileId = await repo.uploadFile(path);
        newIds.add(fileId);
      } catch (e) {
        failedPaths.add(path);
      }
    }

    if (mounted) {
      setState(() {
        final existingIds = _uploadedFileIds[fieldName] ?? [];
        _uploadedFileIds[fieldName] = [...existingIds, ...newIds];
        _uploadingFields[fieldName] = false;

        if (failedPaths.isNotEmpty) {
          final paths = _localFilePaths[fieldName] ?? [];
          for (final p in failedPaths) {
            paths.remove(p);
          }
          _localFilePaths[fieldName] = paths;
        }
      });

      if (failedPaths.length == processedPaths.length) {
        ToastUtil.toastFail(
          context: context,
          title: const Text('Ảnh không đạt tiêu chuẩn. Vui lòng thử lại.'),
        );
      } else if (failedPaths.isNotEmpty) {
        ToastUtil.toastSuccess(
          context: context,
          title: const Text('Tải ảnh thành công một phần. Đã loại bỏ ảnh lỗi.'),
        );
      }
    }
  }

  Widget _buildImageTile({
    required Widget child,
    required VoidCallback onRemove,
  }) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox.expand(child: child),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: InkWell(
            onTap: onRemove,
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
  }

  void _showImagePreviewDialog(
    BuildContext context, {
    String? imageUrl,
    String? localPath,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(24),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              InteractiveViewer(
                child: imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : Image.file(File(localPath!), fit: BoxFit.contain),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(backgroundColor: Colors.black45),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubjectGroupMultiSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Nhóm đối tượng', isRequired: true),
        const SizedBox(height: 8),
        _SubjectGroupMultiSelectDropdown(
          // hiển thị full list nhóm
          groups: widget.subjectGroups.toList(),
          selectedIds: _selectedSubjectGroupIds,
          hasError: _errors['subjectGroup'] != null,
          onChanged: (ids) {
            setState(() {
              if (_errors['subjectGroup'] != null) {
                _errors['subjectGroup'] = null;
              }
              _selectedSubjectGroupIds
                ..clear()
                ..addAll(ids);
            });
          },
        ),
        if (_errors['subjectGroup'] != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _errors['subjectGroup']!,
              style: AppTypography.style(12, color: AppColors.redFF0004),
            ),
          ),
      ],
    );
  }
}

/// A custom multi-select dropdown with checkboxes for subject groups,
/// displayed as a tree hierarchy.
class _SubjectGroupMultiSelectDropdown extends StatefulWidget {
  final List<SubjectGroup> groups;
  final Set<int> selectedIds;
  final ValueChanged<Set<int>> onChanged;
  final bool hasError;

  const _SubjectGroupMultiSelectDropdown({
    required this.groups,
    required this.selectedIds,
    required this.onChanged,
    this.hasError = false,
  });

  @override
  State<_SubjectGroupMultiSelectDropdown> createState() =>
      _SubjectGroupMultiSelectDropdownState();
}

class _SubjectGroupMultiSelectDropdownState
    extends State<_SubjectGroupMultiSelectDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  // Track collapsed parent nodes
  final Set<int> _collapsedIds = {};

  /// Build a sorted flat list from the tree hierarchy (DFS order)
  List<SubjectGroup> _buildTreeOrderedList() {
    // Build parent -> children map
    final Map<int, List<SubjectGroup>> childrenMap = {};
    final List<SubjectGroup> roots = [];

    for (final group in widget.groups) {
      if (group.parentId == null || group.parentId == 0) {
        roots.add(group);
      } else {
        childrenMap.putIfAbsent(group.parentId!, () => []).add(group);
      }
    }

    // DFS traversal
    final List<SubjectGroup> ordered = [];
    void dfs(SubjectGroup node) {
      ordered.add(node);
      if (_collapsedIds.contains(node.id)) return; // skip children if collapsed
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

    // Calculate available space below and above the trigger
    final spaceBelow = screenHeight - position.dy - size.height - 8;
    final spaceAbove = position.dy - 8;

    // Decide whether to open downward or upward
    final openAbove = spaceBelow < 150 && spaceAbove > spaceBelow;
    final availableHeight = openAbove ? spaceAbove : spaceBelow;
    final dropdownMaxHeight = availableHeight.clamp(100.0, 280.0);

    final offset = openAbove
        ? Offset(0, -dropdownMaxHeight - 4)
        : Offset(0, size.height + 4);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeDropdown,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
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
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: orderedGroups.length,
                        itemBuilder: (context, index) {
                          final group = orderedGroups[index];
                          final groupId = group.id;
                          if (groupId == null) return const SizedBox.shrink();
                          final isSelected = widget.selectedIds.contains(
                            groupId,
                          );
                          final level = group.level ?? 0;
                          final hasChildren = _hasChildren(group);
                          final isCollapsed = _collapsedIds.contains(groupId);

                          return InkWell(
                            onTap: () {
                              final newIds = Set<int>.from(widget.selectedIds);
                              if (isSelected) {
                                newIds.remove(groupId);
                              } else {
                                newIds.add(groupId);
                              }
                              widget.onChanged(newIds);
                              setOverlayState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 12.0 + level * 20.0,
                                right: 12,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Row(
                                children: [
                                  // Expand/collapse toggle for parents
                                  if (hasChildren)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isCollapsed) {
                                            _collapsedIds.remove(groupId);
                                          } else {
                                            _collapsedIds.add(groupId);
                                          }
                                        });
                                        setOverlayState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 4,
                                        ),
                                        child: Icon(
                                          isCollapsed
                                              ? Icons.arrow_right
                                              : Icons.arrow_drop_down,
                                          size: 18,
                                          color: AppColors.grey64748B,
                                        ),
                                      ),
                                    )
                                  else
                                    const SizedBox(width: 22),
                                  // Checkbox
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                      value: isSelected,
                                      onChanged: (_) {
                                        final newIds = Set<int>.from(
                                          widget.selectedIds,
                                        );
                                        if (isSelected) {
                                          newIds.remove(groupId);
                                        } else {
                                          newIds.add(groupId);
                                        }
                                        widget.onChanged(newIds);
                                        setOverlayState(() {});
                                      },
                                      activeColor: AppColors.blue005AA9,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      side: const BorderSide(
                                        color: AppColors.greyE2E8F0,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Name
                                  Expanded(
                                    child: Text(
                                      group.name ?? '',
                                      style: AppTypography.style(
                                        14,
                                        color: AppColors.black,
                                        fontWeight: level == 0
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
    setState(() => _isOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedGroups = widget.groups
        .where((g) => g.id != null && widget.selectedIds.contains(g.id))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: InkWell(
            onTap: _toggleDropdown,
            child: Container(
              constraints: const BoxConstraints(minHeight: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.hasError
                      ? AppColors.redFF0004
                      : _isOpen
                      ? AppColors.primary
                      : AppColors.greyE2E8F0,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: selectedGroups.isEmpty
                        ? Text(
                            'Chọn nhóm đối tượng',
                            style: AppTypography.style(
                              14,
                              color: AppColors.grey94A3B8,
                            ),
                          )
                        : ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 64),
                            child: SingleChildScrollView(
                              child: Wrap(
                                spacing: 6,
                                runSpacing: 4,
                                children: selectedGroups.map((g) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.greyF2F4FA,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          g.name ?? '',
                                          style: AppTypography.style(
                                            12,
                                            color: AppColors.grey334155,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        InkWell(
                                          onTap: () {
                                            final newIds = Set<int>.from(
                                              widget.selectedIds,
                                            );
                                            newIds.remove(g.id);
                                            widget.onChanged(newIds);
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 14,
                                            color: AppColors.grey64748B,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
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
