import 'package:flutter/material.dart';

/// Entry point to show the dialog
Future<T?> showAddCameraRtspDialog<T>(
  BuildContext context, {
  void Function(AddCameraPayload value)? onSubmit,
  VoidCallback? onBack,
  VoidCallback? onCheck,
  String title = 'Thêm camera bằng RTSP',
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _AddCameraDialog(
      onSubmit: onSubmit,
      onBack: onBack,
      onCheck: onCheck,
      title: title,
    ),
  );
}

/// Data model to return from the dialog
class AddCameraPayload {
  final String name;
  final String rtsp;
  final String username;
  final String password;
  final String subStream;
  final double? lon;
  final double? lat;
  final String description;

  const AddCameraPayload({
    required this.name,
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
  const _AddCameraDialog({
    this.onSubmit,
    this.onBack,
    this.onCheck,
    required this.title,
  });
  final void Function(AddCameraPayload value)? onSubmit;
  final VoidCallback? onBack;
  final VoidCallback? onCheck;
  final String title;

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
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
      content: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Vui lòng nhập các thông tin',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AppField(
                controller: _name,
                hintText: 'Nhập tên camera',
                validator: (v) => v!.isEmpty ? 'Bắt buộc' : null,
              ),
              AppField(
                controller: _rtsp,
                hintText: 'Nhập địa chỉ RTSP',
                keyboardType: TextInputType.url,
                validator: _required,
              ),
              AppField(controller: _user, hintText: 'Nhập tài khoản camera'),
              AppField(
                controller: _pass,
                hintText: 'Nhập mật khẩu camera',
                obscureText: _obscure,
                suffix: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              AppField(controller: _sub, hintText: 'Địa chỉ luồng phụ'),
              const SizedBox(height: 4),
              Text(
                'Tọa độ vị trí (kinh độ và vĩ độ):',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: AppField(
                      controller: _lon,
                      hintText: 'Nhập kinh độ',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppField(
                      controller: _lat,
                      hintText: 'Nhập vĩ độ',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      /* TODO: pick location */
                    },
                    icon: const Icon(Icons.my_location),
                    tooltip: 'Lấy vị trí hiện tại',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AppField(
                controller: _desc,
                hintText: 'Mô tả (Tối đa 250 ký tự)',
                maxLength: 250,
                maxLines: 3,
              ),
              const SizedBox(height: 6),
              Text(
                'Lưu ý: Độ dài tối đa không quá 128 ký tự.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        AppButton.outline(
          label: 'QUAY LẠI',
          onPressed: widget.onBack ?? () => Navigator.of(context).maybePop(),
        ),
        AppButton.outline(
          label: 'HỦY',
          onPressed: () => Navigator.pop(context),
        ),
        AppButton.outline(label: 'KIỂM TRA', onPressed: widget.onCheck),
        AppButton.filled(
          label: 'XONG',
          onPressed: () {
            if (_form.currentState?.validate() ?? false) {
              final payload = AddCameraPayload(
                name: _name.text.trim(),
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
    );
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Bắt buộc' : null;
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
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: theme.dividerColor),
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton._(this.label, this.onPressed, this.filled, {super.key});
  final String label;
  final VoidCallback? onPressed;
  final bool filled;

  factory AppButton.filled({required String label, VoidCallback? onPressed}) =>
      AppButton._(label, onPressed, true);
  factory AppButton.outline({required String label, VoidCallback? onPressed}) =>
      AppButton._(label, onPressed, false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );

    return filled
        ? FilledButton(onPressed: onPressed, child: child)
        : OutlinedButton(onPressed: onPressed, child: child);
  }
}
