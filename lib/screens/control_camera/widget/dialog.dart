import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_type.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import '../../home/components/components_src.dart';
import '../bloc/control_camera_bloc.dart';
import '../bloc/control_camera_event.dart';

enum CameraDialogMode { add, edit }

/// Entry point to show the dialog
Future<T?> showAddCameraRtspDialog<T>(
  BuildContext context, {
  CameraDialogMode mode = CameraDialogMode.add,
  CameraEntity? cameraData,
  Future<void> Function(AddCameraPayload value)? onSubmit,
  Future<void> Function(AddCameraPayload value)? onEdit,
  VoidCallback? onBack,
  final Function(
    String xaddrs,
    String userName,
    String password,
    List<int>? boxId,
  )?
  onCheck,
}) {
  final controlCameraBloc = context.read<ControlCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: _AddCameraDialog(
        mode: mode,
        cameraData: cameraData,
        onSubmit: onSubmit,
        onEdit: onEdit,
        onBack: onBack,
        onCheck: onCheck,
      ),
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
  const _AddCameraDialog({
    required this.mode,
    this.cameraData,
    this.onSubmit,
    this.onEdit,
    this.onBack,
    this.onCheck,
  });
  final CameraDialogMode mode;
  final CameraEntity? cameraData;
  final Future<void> Function(AddCameraPayload value)? onSubmit;
  final Future<void> Function(AddCameraPayload value)? onEdit;
  final VoidCallback? onBack;
  final Function(
    String xaddrs,
    String userName,
    String password,
    List<int>? boxId,
  )?
  onCheck;

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
      _rtsp.text = camera.stream.userOriginAddedUrl;
      _onvifUserName.text = camera.username;
      _onvifPassword.text = camera.password;
      _onvifXaddrs.text = camera.onvif.xaddr;

      // Parse sub stream URL nếu có
      final subStreamUrl =
          camera.stream.streamLinks
              .firstWhereOrNull((e) => e.isMainStream == false)
              ?.originStream ??
          '';
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
    return camera.type == CameraType.onvif ? 'ONVIF' : 'RTSP';
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
          curr is CheckOnvifSuccessState ||
          curr is CheckOnvifFailState ||
          curr is AddCameraSuccessState ||
          curr is AddCameraFailState ||
          curr is UpdateCameraSuccessState,
      listener: (context, state) {
        if (state is CheckOnvifSuccessState) {
          setState(() => _isChecking = false);
          _rtsp.text = state.cameraOnvif.rtspUrl;
          _sub.text = state.cameraOnvif.subStreamUrl.isNotEmpty
              ? state.cameraOnvif.subStreamUrl.first
              : '';
        } else if (state is CheckOnvifFailState) {
          setState(() => _isChecking = false);
          showAppMessageDialog(
            context,
            type: AppMessageType.error,
            message: state.message,
          );
        } else if (state is AddCameraSuccessState) {
          setState(() => _isSubmitting = false);
          // Lưu reference đến bloc trước khi pop
          final bloc = context.read<ControlCameraBloc>();
          // Pop dialog khi thành công
          if (mounted) {
            Navigator.pop(context);
            // Hiển thị dialog thành công và reload danh sách
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAppMessageDialog(
                context,
                message: 'Thêm camera thành công!',
                type: AppMessageType.success,
                onOk: () {
                  // Reload danh sách camera
                  bloc.add(const GetListCameraEvent());
                },
              );
            });
          }
        } else if (state is AddCameraFailState) {
          setState(() => _isSubmitting = false);
          // Hiển thị dialog lỗi trước khi pop
          showAppMessageDialog(
            context,
            type: AppMessageType.error,
            message: state.errorMsg,
          );
        } else if (state is UpdateCameraSuccessState) {
          setState(() => _isSubmitting = false);
          // Lưu reference đến bloc trước khi pop
          final bloc = context.read<ControlCameraBloc>();
          if (mounted) {
            Navigator.pop(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAppMessageDialog(
                context,
                message: 'Cập nhật camera thành công!',
                type: AppMessageType.success,
                onOk: () {
                  bloc.add(const GetListCameraEvent());
                },
              );
            });
          }
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
                widget.mode == CameraDialogMode.add
                    ? 'Thêm camera'
                    : 'Sửa camera',
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
                  SizedBox(height: 24),
                  // Phương thức selection
                  _buildMethodCamera(),
                  _buildAccountCamera(),
                  SizedBox(height: 24),
                  AppField(
                    controller: _rtsp,
                    hintText: 'Nhập địa chỉ RTSP',
                    keyboardType: TextInputType.url,
                    label: 'Địa chỉ RTSP',
                    requiredField: true,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'Bắt buộc' : null,
                  ),
                  SizedBox(height: 24),
                  AppField(
                    controller: _sub,
                    hintText: 'Nhập địa chỉ luồng phụ',
                    label: 'Địa chỉ luồng phụ',
                    requiredField: true,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'Bắt buộc' : null,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Tọa độ vị trí',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: AppField(
                          controller: _lon,
                          label: 'Kinh độ',
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
                          label: 'Vĩ độ',
                          hintText: 'Nhập vĩ độ',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                            signed: true,
                          ),
                          trailingButton: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: AppColors.blue15ABFF,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(AppAssets.icLocation),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppField(
                    controller: _desc,
                    hintText: 'Nhập địa chỉ khu vực',
                    label: "Địa chỉ khu vực",
                    maxLength: 50,
                  ),
                  const SizedBox(height: 24),
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
                Expanded(
                  child: AppButton.outline(
                    label: 'HỦY',
                    onPressed: (_isChecking || _isSubmitting)
                        ? null
                        : () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton.filled(
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
                                  lat:
                                      double.tryParse(
                                        _lat.text.replaceAll(',', '.'),
                                      ) ??
                                      0,
                                  log:
                                      double.tryParse(
                                        _lon.text.replaceAll(',', '.'),
                                      ) ??
                                      0,
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
          child: AppField(
            controller: _onvifXaddrs,
            hintText: 'Nhập địa chỉ ONVIF',
            label: 'Địa chỉ ONVIF',
            requiredField: true,
            validator: (v) {
              if (_method != 'RTSP' && (v == null || v.trim().isEmpty)) {
                return 'Bắt buộc';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: AppField(
                controller: _onvifUserName,
                hintText: 'Nhập tài khoản camera',
                label: 'Tài khoản camera',
                requiredField: true,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Bắt buộc' : null,
              ),
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
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Bắt buộc' : null,
                suffix: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
                trailingButton: Visibility(
                  visible: _method != 'RTSP',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ElevatedButton(
                      onPressed: _isChecking
                          ? null
                          : () {
                              setState(() => _isChecking = true);
                              widget.onCheck?.call(
                                _onvifXaddrs.text.trim(),
                                _onvifUserName.text.trim(),
                                _onvifPassword.text.trim(),
                                [],
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue005AA9,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        elevation: 0,
                      ),
                      child: _isChecking
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              'Kiểm tra',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
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
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
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
            CustomRadioButton(
              title: 'RTSP',
              value: 'RTSP',
              groupValue: _method,
              onChanged: (value) {
                if (value == null) return;
                setState(() => _method = value);
              },
            ),
            const SizedBox(width: 24),
            CustomRadioButton(
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
