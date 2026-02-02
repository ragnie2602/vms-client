import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/screens/home/components/components_src.dart';

/// Entry point to show the add AI Box dialog
Future<T?> showAddAiBoxDialog<T>(
  BuildContext context, {
  Future<void> Function(AiBoxEntity value)? onConfirm,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _AddAiBoxDialog(onConfirm: onConfirm),
  );
}

Future<T?> showConfirmRemoveAiBoxDialog<T>(
  BuildContext context, {
  required Function() onConfirm,
  String? name,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => RemoveAiBoxDialog(onConfirm: onConfirm, aiBoxName: name),
  );
}

class _AddAiBoxDialog extends StatefulWidget {
  const _AddAiBoxDialog({this.onConfirm});

  final Future<void> Function(AiBoxEntity value)? onConfirm;

  @override
  State<_AddAiBoxDialog> createState() => _AddAiBoxDialogState();
}

class _AddAiBoxDialogState extends State<_AddAiBoxDialog> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _ipAddress = TextEditingController();
  final _port = TextEditingController();
  final _manufacturer = TextEditingController();
  final _model = TextEditingController();
  final _maxCameras = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _note = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _name.dispose();
    _ipAddress.dispose();
    _port.dispose();
    _manufacturer.dispose();
    _model.dispose();
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      contentPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(24),
      title: Row(
        children: [
          Expanded(
            child: Text(
              'Thêm AI Box',
              style: AppTypography.style(
                20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppAssets.icClose),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: AppColors.greyF2F4FA, width: 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: MediaQuery.of(context).size.width * 0.35,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Tên thiết bị
                AppField(
                  controller: _name,
                  hintText: 'Nhập tên AI box',
                  label: 'Tên AI box',
                  requiredField: true,
                  validator: (v) => v!.trim().isEmpty
                      ? 'Tên AI box không được để trống'
                      : null,
                ),
                const SizedBox(height: 20),
                // hãng
                AppField(
                  controller: _manufacturer,
                  hintText: 'Nhập hãng sản xuất',
                  label: 'Hãng AI box',
                ),
                const SizedBox(height: 20),
                // model
                AppField(
                  controller: _model,
                  hintText: 'Nhập model thiết bị',
                  label: 'Model',
                ),
                const SizedBox(height: 20),
                // IP Address và Port
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppField(
                        controller: _ipAddress,
                        hintText: 'Nhập địa chỉ IP',
                        label: 'Địa chỉ IP',
                        requiredField: true,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Địa chỉ IP không được để trống';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: AppField(
                        controller: _port,
                        hintText: 'Nhập cổng',
                        label: 'Port',
                        keyboardType: TextInputType.number,
                        requiredField: true,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Port không được để trống';
                          }
                          final value = int.tryParse(v);
                          if (value == null || value <= 0) {
                            return 'Port phải là số nguyên dương';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // số cam
                AppField(
                  controller: _maxCameras,
                  hintText: 'Nhập số lượng',
                  label: 'Số camera tối đa',
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v != null && v.isNotEmpty) {
                      final value = int.tryParse(v);
                      if (value == null || value <= 0) {
                        return 'Chỉ nhập số nguyên dương';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppField(
                        controller: _username,
                        hintText: 'Nhập tài khoản',
                        label: 'Tài khoản',
                        requiredField: true,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Tài khoản không được để trống';
                          }
                          // Kiểm tra khoảng trắng
                          if (v.contains(' ')) {
                            return 'Tài khoản không được chứa khoảng trắng';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: AppField(
                        controller: _password,
                        hintText: 'Nhập mật khẩu',
                        label: 'Mật khẩu',
                        keyboardType: TextInputType.number,
                        requiredField: true,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Mật khẩu không được để trống';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Mô tả
                AppField(
                  controller: _note,
                  hintText: 'Nhập ghi chú hoặc mô tả thêm...',
                  label: 'Ghi chú',
                  maxLines: 5,
                  maxLength: 200,
                ),
                const SizedBox(height: 16),
              ],
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
                onPressed: _isSubmitting ? null : () => Navigator.pop(context),
              ),
              const SizedBox(width: 12),
              AppButton.filled(
                label: 'Xác nhận',
                onPressed: _isSubmitting ? null : _handleSubmit,
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
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (_isSubmitting) return;

    if (!(_form.currentState?.validate() ?? false)) {
      return;
    }

    setState(() => _isSubmitting = true);

    final payload = AiBoxEntity(
      name: _name.text.trim(),
      ip: _ipAddress.text.trim(),
      port: _port.text.trim(),
      manufacturer: _manufacturer.text.trim(),
      model: _model.text.trim(),
      note: _note.text.trim(),
      userame: _username.text.trim(),
      password: _password.text.trim(),
      maxCamera: _maxCameras.text.isNotEmpty
          ? int.tryParse(_maxCameras.text.trim())
          : null,
    );

    bool isSuccess = true;
    try {
      final result = widget.onConfirm?.call(payload);
      if (result is Future) {
        await result;
      }
    } catch (_) {
      isSuccess = false;
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
    if (isSuccess && mounted) {
      Navigator.pop(context);
    }
  }
}

// dialog confirm xoa ai box
class RemoveAiBoxDialog extends StatelessWidget {
  const RemoveAiBoxDialog({super.key, this.onConfirm, this.aiBoxName});
  final Function()? onConfirm;
  final String? aiBoxName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.icRemoveAiBox,
                  height: 88,
                  width: 88,
                ),
                const SizedBox(height: 16),
                Text(
                  'Xóa thiết bị AI Box',
                  style: AppTypography.style(
                    18,
                    color: AppColors.grey34404b,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bạn có chắc chắn muốn xóa thiết bị \n',
                        style: AppTypography.style(
                          16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: aiBoxName ?? 'AI Box',
                        style: AppTypography.style(
                          16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ?',
                        style: AppTypography.style(
                          16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 130.5 / 1600,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          side: BorderSide(
                            color: AppColors.greyE2E8F0,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Hủy',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackOrWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 130.5 / 1600,
                      child: ElevatedButton(
                        onPressed: () {
                          //
                          Navigator.pop(context);
                          onConfirm?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        child: Text(
                          'Đồng ý',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackOrWhiteReverse,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
