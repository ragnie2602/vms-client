import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import '../bloc/control_camera_bloc.dart';

enum CameraDialogMode { add, edit }

/// Entry point to show the dialog
Future<T?> showAddCameraRtspDialog<T>(
  BuildContext context, {
  CameraDialogMode mode = CameraDialogMode.add,
  CameraEntity? cameraData,
  Future<void> Function(AddCameraPayload value)? onSubmit,
  Future<void> Function(AddCameraPayload value)? onEdit,
  VoidCallback? onBack,
  final Function(String xaddrs, String userName, String password, List<int>? boxId)? onCheck,
}) {
  final controlCameraBloc = context.read<ControlCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: _AddCameraDialog(mode: mode, cameraData: cameraData, onSubmit: onSubmit, onEdit: onEdit, onBack: onBack, onCheck: onCheck),
    ),
  );
}

/// Data model to return from the dialog
class AddCameraPayload {
  final String name;
  final String method; // 'RTSP' hoặc 'ONVIF'
  final String rtsp;
  final String onifDeviceIp;
  final String username;
  final String password;
  final String subStream;
  final CameraMap location;
  final String xaddr;
  // final List<int> boxId;
  // final List<int> groupId;
  final List<String> subStreamUrls;
  // final String urn;
  // final String serialNumber;

  const AddCameraPayload({
    required this.name,
    required this.method,
    required this.rtsp,
    required this.onifDeviceIp,
    required this.username,
    required this.password,
    required this.subStream,
    required this.location,
    required this.xaddr,
    // required this.boxId,
    // required this.groupId,
    required this.subStreamUrls,
    // required this.urn,
    // required this.serialNumber,
  });
}

class _AddCameraDialog extends StatefulWidget {
  const _AddCameraDialog({required this.mode, this.cameraData, this.onSubmit, this.onEdit, this.onBack, this.onCheck});
  final CameraDialogMode mode;
  final CameraEntity? cameraData;
  final Future<void> Function(AddCameraPayload value)? onSubmit;
  final Future<void> Function(AddCameraPayload value)? onEdit;
  final VoidCallback? onBack;
  final Function(String xaddrs, String userName, String password, List<int>? boxId)? onCheck;

  @override
  State<_AddCameraDialog> createState() => _AddCameraDialogState();
}

class _AddCameraDialogState extends State<_AddCameraDialog> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _rtsp = TextEditingController();
  final _sub = TextEditingController();
  final _lon = TextEditingController();
  final _lat = TextEditingController();
  final _desc = TextEditingController();
  final _onvifXaddrs = TextEditingController();
  final _onvifUserName = TextEditingController();
  final _onvifPassword = TextEditingController();
  bool _obscure = true;
  String _method = 'RTSP'; // 'RTSP' hoặc 'ONVIF'
  bool _isChecking = false;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    if (widget.mode == CameraDialogMode.edit && widget.cameraData != null) {
      final camera = widget.cameraData!;
      _name.text = camera.name;
      _rtsp.text = camera.stream.streamOriginUrl;
      _onvifUserName.text = camera.username;
      _onvifPassword.text = camera.password;
      _onvifXaddrs.text = camera.onvif.xaddr;

      // Parse sub stream URL nếu có
      final subStreamUrl = camera.stream.streamLinks.firstWhereOrNull((e) => e.nameOfStream == "SUB STREAM")?.urlOfStream ?? '';
      _sub.text = subStreamUrl;

      // Parse location data nếu có (có thể cần thêm vào CameraEntity)
      // _lat.text = camera.location?.lat.toString() ?? '';
      // _lon.text = camera.location?.log.toString() ?? '';
      // _desc.text = camera.location?.locationDes ?? '';

      // Xác định method dựa trên camera type hoặc URL
      _method = _determineCameraMethod(camera);
    }
  }

  String _determineCameraMethod(CameraEntity camera) {
    // Logic để xác định method dựa trên camera data
    // Có thể dựa vào type hoặc URL pattern
    return 'RTSP'; // Default, có thể cải thiện logic này
  }

  @override
  void dispose() {
    _name.dispose();
    _rtsp.dispose();
    _sub.dispose();
    _lon.dispose();
    _lat.dispose();
    _desc.dispose();
    _onvifXaddrs.dispose();
    _onvifUserName.dispose();
    _onvifPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<ControlCameraBloc, ControlCameraState>(
      listenWhen: (prev, curr) =>
          curr is CheckOnvifSuccessState || curr is CheckOnvifFailState || curr is AddCameraSuccessState || curr is AddCameraFailState,
      listener: (context, state) {
        if (state is CheckOnvifSuccessState) {
          setState(() => _isChecking = false);
          _rtsp.text = state.cameraOnvif.rtspUrl;
          _sub.text = state.cameraOnvif.subStreamUrl.isNotEmpty ? state.cameraOnvif.subStreamUrl.first : '';
          setState(() => _method = 'ONVIF');
        } else if (state is CheckOnvifFailState) {
          setState(() => _isChecking = false);
          showAppMessageDialog(context, type: AppMessageType.error, message: state.message);
        } else if (state is AddCameraSuccessState) {
          setState(() => _isSubmitting = false);
          // Pop dialog khi thành công
          if (mounted) {
            Navigator.pop(context);
          }
        } else if (state is AddCameraFailState) {
          setState(() => _isSubmitting = false);
          // Hiển thị dialog lỗi khi thất bại, không pop dialog chính
          showAppMessageDialog(context, type: AppMessageType.error, message: state.errorMsg);
        }
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
        actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.mode == CameraDialogMode.add ? 'Thêm camera' : 'Sửa camera',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
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
                  _buildAccountCamera(),
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
                AppButton.outline(label: 'HỦY', onPressed: (_isChecking || _isSubmitting) ? null : () => Navigator.pop(context)),
                const SizedBox(width: 12),
                AppButton.filled(
                  label: _isSubmitting ? '' : 'XÁC NHẬN',
                  onPressed: _isSubmitting
                      ? null
                      : () async {
                          if (_form.currentState?.validate() ?? false) {
                            setState(() => _isSubmitting = true);

                            final payload = AddCameraPayload(
                              name: _name.text.trim(),
                              method: _method,
                              rtsp: _rtsp.text.trim(),
                              onifDeviceIp: _onvifXaddrs.text.trim(),
                              username: _onvifUserName.text.trim(),
                              password: _onvifPassword.text.trim(),
                              subStream: _sub.text.trim(),
                              location: CameraMap(
                                lat: double.tryParse(_lat.text.replaceAll(',', '.')) ?? 0,
                                log: double.tryParse(_lon.text.replaceAll(',', '.')) ?? 0,
                                locationDes: _desc.text.trim(),
                              ),
                              xaddr: _onvifXaddrs.text.trim(),
                              // boxId: _boxId.text.trim(),
                              // groupId: _groupId.text.trim(),
                              subStreamUrls: _sub.text.trim().split(','),
                              // urn: _urn.text.trim(),
                              // serialNumber: _serialNumber.text.trim(),
                            );

                            // Gọi callback tương ứng với mode
                            if (widget.mode == CameraDialogMode.add) {
                              await widget.onSubmit?.call(payload);
                            } else {
                              await widget.onEdit?.call(payload);
                            }
                            // Không pop ở đây, sẽ pop trong BlocListener khi API hoàn thành
                          }
                        },
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCamera() {
    return Column(
      children: [
        Visibility(
          visible: _method != 'RTSP',
          child: AppField(controller: _onvifXaddrs, hintText: 'Nhập địa chỉ ONVIF', label: 'Địa chỉ ONVIF', requiredField: true),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: AppField(controller: _onvifUserName, hintText: 'Nhập tài khoản camera', label: 'Tài khoản camera', requiredField: true),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: _method != 'RTSP' ? 3 : 2,
              child: AppField(
                controller: _onvifPassword,
                hintText: 'Nhập mật khẩu',
                label: 'Mật khẩu camera',
                requiredField: true,
                maxLength: 50,
                obscureText: _obscure,
                suffix: IconButton(
                  icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
                trailingButton: Visibility(
                  visible: _method != 'RTSP',
                  child: ElevatedButton(
                    onPressed: _isChecking
                        ? null
                        : () {
                            setState(() => _isChecking = true);
                            widget.onCheck?.call(_onvifXaddrs.text.trim(), _onvifUserName.text.trim(), _onvifPassword.text.trim(), []);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue005AA9,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      elevation: 0,
                    ),
                    child: _isChecking
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                          )
                        : const Text('Kiểm tra', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ],
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
            _CustomRadioButton(
              title: 'RTSP',
              value: 'RTSP',
              groupValue: _method,
              onChanged: (value) {
                if (value == null) return;
                setState(() => _method = value);
              },
            ),
            const SizedBox(width: 24),
            _CustomRadioButton(
              title: 'ONVIF',
              value: 'ONVIF',
              groupValue: _method,
              onChanged: (value) {
                if (value == null) return;
                setState(() => _method = value);
              },
            ),
          ],
        ),
      ],
    );
  }
}

/// Custom Radio Button Widget
class _CustomRadioButton<T> extends StatelessWidget {
  const _CustomRadioButton({required this.title, required this.value, required this.groupValue, required this.onChanged});

  final String title;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.black : Colors.transparent,
              border: Border.all(color: AppColors.black, width: 1.5),
            ),
            child: Icon(Icons.check_rounded, size: 14, color: isSelected ? Colors.white : Colors.transparent),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF000000)),
          ),
        ],
      ),
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
  const AppButton._(this.label, this.onPressed, this.filled, {super.key, this.child});
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  final Widget? child;

  factory AppButton.filled({Key? key, required String label, VoidCallback? onPressed, Widget? child}) =>
      AppButton._(label, onPressed, true, key: key, child: child);
  factory AppButton.outline({Key? key, required String label, VoidCallback? onPressed}) => AppButton._(label, onPressed, false, key: key);

  @override
  Widget build(BuildContext context) {
    final buttonChild = child ?? Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));

    if (filled) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue005AA9,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(150, 48),
          elevation: 0,
        ),
        child: buttonChild,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(color: AppColors.greyC3D3D9, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(150, 48),
          backgroundColor: Colors.white,
        ),
        child: buttonChild,
      );
    }
  }
}
