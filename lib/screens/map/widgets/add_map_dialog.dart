import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';
import 'package:vms_flutter_client/screens/map/widgets/convert.dart';
import 'package:vms_flutter_client/screens/map/widgets/dash_border_widget.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

/// Data model cho dialog thêm bản đồ
class AddMapPayload {
  final String name;
  final File? imageFile;
  // case edit
  final String? imgPath;
  final Uint8List? imgBytes;

  const AddMapPayload({
    required this.name,
    this.imageFile,
    this.imgBytes,
    this.imgPath,
  });
}

/// Entry point để hiển thị dialog thêm bản đồ
Future<T?> showAddMapDialog<T>(
  BuildContext context, {
  Future<void> Function(AddMapPayload value)? onSubmit,
  // dùng cho case edit
  final String? emapName,
  final String? backgroundPath,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _AddMapDialog(
      onSubmit: onSubmit,
      backgroundPath: backgroundPath,
      emapName: emapName,
    ),
  );
}

class _AddMapDialog extends StatefulWidget {
  const _AddMapDialog({this.onSubmit, this.backgroundPath, this.emapName});
  final Future<void> Function(AddMapPayload value)? onSubmit;
  // dùng cho case edit
  final String? emapName;
  final String? backgroundPath;

  @override
  State<_AddMapDialog> createState() => _AddMapDialogState();
}

class _AddMapDialogState extends State<_AddMapDialog> {
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  bool _isValidateImage = false;
  String _errorImageMessage = ''; // check lỗi inline
  File? _selectedImage;

  // case edit emap
  String? _backgroundPath;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.emapName ?? '';
    _backgroundPath = widget.backgroundPath;
  }

  bool isEditEmap() {
    return (widget.emapName != null && widget.backgroundPath != null);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      _isValidateImage = false;
      _validateImage();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp'],
      );
      if (result != null) {
        final file = File(result.files.single.path!);
        setState(() {
          _selectedImage = file;
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
    });
  }

  void _validateImage() async {
    if (_isValidateImage == true) {
      // case add new emap
      if (!isEditEmap()) {
        // ảnh rỗng
        if (_selectedImage == null) {
          _errorImageMessage = 'Hình ảnh không được để trống';
        } else {
          // check dung lượng ảnh
          _errorImageMessage = await _checkSizeImage();
          if (_errorImageMessage.isEmpty) {
            // check kích thước ảnh
            _errorImageMessage = await _checkDimensionImage();
          }
        }
      } else {
        // case edit image
        if (_selectedImage == null) {
          // case giữ nguyên ảnh gốc, ko thay ảnh
          _errorImageMessage = '';
        } else {
          // check dung lượng ảnh
          _errorImageMessage = await _checkSizeImage();
          //
          if (_errorImageMessage.isEmpty) {
            // check kích thước ảnh
            _errorImageMessage = await _checkDimensionImage();
          }
        }
      }
    } else {
      _errorImageMessage = '';
    }
    setState(() {});
  }

  Future<String> _checkSizeImage() async {
    if (_selectedImage == null) {
      return '';
    }
    // Kiểm tra dung lượng file
    final size = await _selectedImage!.length();
    if (size > 20 * 1024 * 1024) {
      return 'Dung lượng tối đa: 20 MB';
    }
    return '';
  }

  Future<String> _checkDimensionImage() async {
    if (_selectedImage == null) {
      return '';
    }
    // Lấy kích thước ảnh
    final imageSize = ImageSizeGetter.getSize(FileInput(_selectedImage!));
    if (imageSize.width.toInt() < 500 || imageSize.height.toInt() < 500) {
      return 'Kích thước tối thiểu 500x500 px';
    }
    return '';
  }

  Future<void> _handleSubmit() async {
    setState(() {
      _isValidateImage = true;
    });
    _validateImage();
    if ((_form.currentState?.validate() ?? false) &&
        _errorImageMessage.isEmpty) {
      AddMapPayload payload;
      if ((_selectedImage == null && isEditEmap())) {
        Uint8List _tmp = await networkImageToBytes(_backgroundPath ?? '');
        payload = AddMapPayload(
          name: _nameController.text.trim(),
          imgPath: _backgroundPath,
          imgBytes: _tmp,
        );
      } else {
        payload = AddMapPayload(
          name: _nameController.text.trim(),
          imageFile: _selectedImage!,
        );
      }

      try {
        await widget.onSubmit?.call(payload);
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomPaint(
                        painter: DashedBorderPainter(
                          isError: _errorImageMessage.isNotEmpty,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_selectedImage == null)
                              if (isEditEmap())
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 24,
                                    left: 10,
                                    right: 10,
                                  ),
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                        0.35,
                                  ),
                                  child: Image.network(
                                    _backgroundPath ?? '',
                                    loadingBuilder:
                                        (context, child, loadingProgress) =>
                                            loadingProgress == null
                                            ? child
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                  ),
                                )
                              else
                                SizedBox(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () => _pickImage(),
                                        child: SvgPicture.asset(
                                          AppAssets.icAddImage,
                                        ),
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
                                          MediaQuery.of(context).size.height *
                                          0.35,
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
                                        InkWell(
                                          onTap: _removeImage,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(
                                                0.6,
                                              ),
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
                            if (_selectedImage != null ||
                                (_selectedImage == null &&
                                    _backgroundPath != null)) ...[
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
                      (_errorImageMessage.isNotEmpty)
                          ? Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      _errorImageMessage,
                                      style: AppTypography.style(
                                        12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.redFF0004,
                                        lineHeight: 1.3,
                                        textOverflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
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
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: AppButton.filled(
                onPressed: () {
                  _handleSubmit();
                },
                label: 'Xác nhận',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
