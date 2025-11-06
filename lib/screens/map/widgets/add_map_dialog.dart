import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';
import 'package:vms_flutter_client/screens/map/widgets/dash_border_widget.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

/// Data model cho dialog thêm bản đồ
class AddMapPayload {
  final String name;
  final File imageFile;

  const AddMapPayload({required this.name, required this.imageFile});
}

/// Entry point để hiển thị dialog thêm bản đồ
Future<T?> showAddMapDialog<T>(
  BuildContext context, {
  Future<void> Function(AddMapPayload value)? onSubmit,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _AddMapDialog(onSubmit: onSubmit),
  );
}

class _AddMapDialog extends StatefulWidget {
  const _AddMapDialog({this.onSubmit});
  final Future<void> Function(AddMapPayload value)? onSubmit;

  @override
  State<_AddMapDialog> createState() => _AddMapDialogState();
}

class _AddMapDialogState extends State<_AddMapDialog> {
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  bool _isSubmitting = false;
  File? _selectedImage;
  Size? _imageSize;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        // Kiểm tra kích thước file
        final size = await file.length();
        if (size > 20 * 1024 * 1024) {
          // 20MB
          if (mounted) {
            showAppMessageDialog(
              context,
              message: 'Kích thước file không được vượt quá 20MB',
              type: AppMessageType.error,
            );
          }
          return;
        }

        // Lấy kích thước ảnh
        final imageSize = ImageSizeGetter.getSize(FileInput(file));

        setState(() {
          _selectedImage = file;
          _imageSize = Size(imageSize.width.toInt(), imageSize.height.toInt());
        });
      }
    } catch (e) {
      if (mounted) {
        showAppMessageDialog(
          context,
          message: 'Có lỗi xảy ra khi chọn ảnh',
          type: AppMessageType.error,
        );
      }
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _imageSize = null;
    });
  }

  Future<void> _handleSubmit() async {
    if (_selectedImage == null) return;

    if (_form.currentState?.validate() ?? false) {
      setState(() => _isSubmitting = true);

      final payload = AddMapPayload(
        name: _nameController.text.trim(),
        imageFile: _selectedImage!,
      );

      try {
        await widget.onSubmit?.call(payload);
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isSubmitting = false);
          showAppMessageDialog(
            context,
            type: AppMessageType.error,
            message: e.toString(),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          const Expanded(
            child: Text(
              'Thêm bản đồ camera',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
        width: MediaQuery.of(context).size.width * 0.35,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                AppField(
                  paddingBottomLabel: 15,
                  controller: _nameController,
                  hintText: 'Nhập tên bản đồ',
                  label: 'Tên bản đồ',
                  requiredField: true,
                  validator: (v) => v!.trim().isEmpty
                      ? 'Tên bản đồ không được để trống'
                      : null,
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_selectedImage == null)
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => _pickImage(),
                                  child: SvgPicture.asset(AppAssets.icAddImage),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Click + để thêm hình ảnh bản đồ.',
                                  style: AppTypography.style(
                                    13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey64748B,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                    top: 4,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    'Hỗ trợ định dạng .JPG, .JPEG, .PNG, .BMP,\n kích thước tối thiểu 500×500px, dung lượng tối đa 20MB.',
                                    style: AppTypography.style(
                                      13,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey64748B,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: 24,
                                  left: 10,
                                  right: 10,
                                ),
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.35,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '${_imageSize?.width.toInt() ?? 0}x${_imageSize?.height.toInt() ?? 0}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: _removeImage,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        if (_selectedImage != null) ...[
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {
                              _pickImage();
                            },
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppAssets.icReplace),
                                    SizedBox(width: 10),
                                    const Text(
                                      'Thay thế ảnh này',
                                      style: TextStyle(
                                        color: AppColors.blue005AA9,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: AppButton.outline(
                label: "Hủy",
                onPressed: _isSubmitting ? null : () => Navigator.pop(context),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: AppButton.filled(
                onPressed: _selectedImage == null || _isSubmitting
                    ? null
                    : _handleSubmit,

                label: 'Xác nhận',
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
