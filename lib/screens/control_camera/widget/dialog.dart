import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

/// Entry point to show the dialog
Future<T?> showAddCameraRtspDialog<T>(
  BuildContext context, {
  void Function(AddCameraPayload value)? onSubmit,
  VoidCallback? onBack,
  VoidCallback? onCheck,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _AddCameraDialog(onSubmit: onSubmit, onBack: onBack, onCheck: onCheck),
  );
}

/// Data model to return from the dialog
class AddCameraPayload {
  final String name;
  final String method; // 'RTSP' hoặc 'ONVIF'
  final String rtsp;
  final String username;
  final String password;
  final String subStream;
  final double? lon;
  final double? lat;
  final String description;

  const AddCameraPayload({
    required this.name,
    required this.method,
    required this.rtsp,
    required this.username,
    required this.password,
    required this.subStream,
    this.lon,
    this.lat,
    required this.description,
  });
}

class _AddCameraDialog extends StatefulWidget {
  const _AddCameraDialog({this.onSubmit, this.onBack, this.onCheck});
  final void Function(AddCameraPayload value)? onSubmit;
  final VoidCallback? onBack;
  final VoidCallback? onCheck;

  @override
  State<_AddCameraDialog> createState() => _AddCameraDialogState();
}

class _AddCameraDialogState extends State<_AddCameraDialog> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _rtsp = TextEditingController();
  final _user = TextEditingController();
  final _pass = TextEditingController();
  final _sub = TextEditingController();
  final _lon = TextEditingController();
  final _lat = TextEditingController();
  final _desc = TextEditingController();
  bool _obscure = true;
  String _method = 'RTSP'; // 'RTSP' hoặc 'ONVIF'

  @override
  void dispose() {
    _name.dispose();
    _rtsp.dispose();
    _user.dispose();
    _pass.dispose();
    _sub.dispose();
    _lon.dispose();
    _lat.dispose();
    _desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          Expanded(
            child: Text('Thêm camera', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ),
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close), tooltip: 'Đóng'),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                AppField(
                  controller: _name,
                  hintText: 'Nhập tên camera',
                  validator: (v) => v!.isEmpty ? 'Bắt buộc' : null,
                  label: 'Tên camera',
                  requiredField: true,
                  maxLength: 50,
                ),
                // Phương thức selection
                _buildMethodCamera(),
                AppField(controller: _user, hintText: 'Nhập tài khoản camera', label: 'Tài khoản camera', requiredField: true),
                AppField(
                  controller: _pass,
                  hintText: 'Nhập mật khẩu',
                  label: 'Mật khẩu camera',
                  requiredField: true,
                  maxLength: 50,
                  obscureText: _obscure,
                  suffix: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  trailingButton: ElevatedButton(
                    onPressed: () {
                      // TODO: Thêm logic kiểm tra mật khẩu
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      minimumSize: const Size(0, 48), // Chiều cao bằng TextField (14*2 + 20 = 48)
                      fixedSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      elevation: 0,
                    ),
                    child: const Text('Kiểm tra', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ),
                AppField(
                  controller: _rtsp,
                  hintText: 'Nhập địa chỉ RTSP',
                  keyboardType: TextInputType.url,
                  label: 'Địa chỉ RTSP',
                  requiredField: true,
                ),
                AppField(controller: _sub, hintText: 'Nhập địa chỉ luồng phụ', label: 'Địa chỉ luồng phụ', requiredField: true),
                const SizedBox(height: 4),
                Text(
                  'Tọa độ vị trí',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF000000)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: AppField(
                        controller: _lon,
                        label: 'Kinh độ',
                        hintText: 'Nhập kinh độ',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppField(
                        controller: _lat,
                        label: 'Vĩ độ',
                        hintText: 'Nhập vĩ độ',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        trailingButton: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: AppColors.green21CCC3),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(Icons.location_on, size: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 8),
                AppField(controller: _desc, hintText: 'Nhập địa chỉ khu vực', label: "Địa chỉ khu vực", maxLength: 50),
                const SizedBox(height: 6),
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
              AppButton.outline(label: 'HỦY', onPressed: () => Navigator.pop(context)),
              const SizedBox(width: 12),
              AppButton.filled(
                label: 'XÁC NHẬN',
                onPressed: () {
                  if (_form.currentState?.validate() ?? false) {
                    final payload = AddCameraPayload(
                      name: _name.text.trim(),
                      method: _method,
                      rtsp: _rtsp.text.trim(),
                      username: _user.text.trim(),
                      password: _pass.text,
                      subStream: _sub.text.trim(),
                      lon: double.tryParse(_lon.text.replaceAll(',', '.')),
                      lat: double.tryParse(_lat.text.replaceAll(',', '.')),
                      description: _desc.text.trim(),
                    );
                    widget.onSubmit?.call(payload);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMethodCamera() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Phương thức',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF000000)),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: 'RTSP',
                    groupValue: _method,
                    onChanged: (value) => setState(() => _method = value!),
                    activeColor: Colors.black,
                  ),
                  const Text(
                    'RTSP',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF000000)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: 'ONVIF',
                    groupValue: _method,
                    onChanged: (value) => setState(() => _method = value!),
                    activeColor: Colors.black,
                  ),
                  const Text(
                    'ONVIF',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF000000)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// --- Reusable UI atoms ----------------------------------------------------
class AppField extends StatelessWidget {
  const AppField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.label,
    this.requiredField = false,
    this.trailingButton,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String? label;
  final bool requiredField;
  final Widget? trailingButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelWidget = label == null
        ? null
        : RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF000000)),
              children: requiredField
                  ? const [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ]
                  : const [],
            ),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          final List<Widget> suffixChildren = [];
          if (suffix != null) suffixChildren.add(suffix!);
          if (maxLength != null) {
            suffixChildren.add(
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text('${value.text.length}/${maxLength}', style: theme.textTheme.bodySmall),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (labelWidget != null) ...[Padding(padding: const EdgeInsets.only(bottom: 6), child: labelWidget)],
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      obscureText: obscureText,
                      keyboardType: keyboardType,
                      maxLines: maxLines,
                      maxLength: maxLength,
                      validator: validator,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF92929D)),
                        // Ẩn counter mặc định (nằm dưới), thay bằng counter ở suffix
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
                        ),
                        suffixIcon: suffixChildren.isEmpty ? null : Row(mainAxisSize: MainAxisSize.min, children: suffixChildren),
                      ),
                    ),
                  ),
                  if (trailingButton != null) ...[const SizedBox(width: 8), trailingButton!],
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton._(this.label, this.onPressed, this.filled, {super.key});
  final String label;
  final VoidCallback? onPressed;
  final bool filled;

  factory AppButton.filled({Key? key, required String label, VoidCallback? onPressed}) => AppButton._(label, onPressed, true, key: key);
  factory AppButton.outline({Key? key, required String label, VoidCallback? onPressed}) => AppButton._(label, onPressed, false, key: key);

  @override
  Widget build(BuildContext context) {
    final child = Text(label, style: const TextStyle(fontSize: 16));

    if (filled) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
        ),
        child: child,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(color: AppColors.blue005AA9, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          backgroundColor: Colors.white,
        ),
        child: child,
      );
    }
  }
}
