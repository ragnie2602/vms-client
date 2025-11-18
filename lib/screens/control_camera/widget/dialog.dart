import 'dart:async';

import 'package:collection/collection.dart';
import 'package:easy_onvif/probe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_type.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import '../../home/components/components_src.dart';
import '../bloc/control_camera_bloc.dart';
import '../bloc/control_camera_event.dart';

enum CameraDialogMode { add, edit }

/// Các bước trong flow thêm camera
enum AddCameraStep {
  selectMode, // Chọn cách thêm: thủ công / dò tìm / file
  manualForm, // Form thêm thủ công (giữ nguyên logic hiện tại)
  discovery, // Dò tìm camera trong mạng
  importFile, // Thêm bằng file cấu hình
}

/// Entry point to show the dialog
Future<T?> showAddCameraDialog<T>(
  BuildContext context, {
  CameraDialogMode mode = CameraDialogMode.add,
  CameraEntity? cameraData,
  Future<void> Function(AddCameraPayload value)? onSubmit,
  Future<void> Function(AddCameraPayload value)? onEdit,
  Future<List<ProbeMatch>> Function()? onCheckDiscovery,
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
        onCheckDiscovery: onCheckDiscovery,
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
    this.onCheckDiscovery,
  });
  final CameraDialogMode mode;
  final CameraEntity? cameraData;
  final Future<void> Function(AddCameraPayload value)? onSubmit;
  final Future<void> Function(AddCameraPayload value)? onEdit;
  final Future<List<ProbeMatch>> Function()? onCheckDiscovery;
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

  List<ProbeMatch>? _deviceMatches;
  AddCameraStep _step = AddCameraStep.selectMode;
  AddCameraStep? _selectedAddStep;
  int? _expandedDiscoveryIndex;
  bool _isChecking = false;
  bool _isSubmitting = false;

  bool _isCheckingDiscovery = false;
  Timer? _passwordVisibilityTimer;

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
      // Khi sửa camera thì vào thẳng form thủ công
      _step = AddCameraStep.manualForm;
    } else {
      // Khi thêm mới thì bắt đầu từ màn chọn cách thêm
      _step = AddCameraStep.selectMode;
      _selectedAddStep = null;
    }
  }

  String _determineCameraMethod(CameraEntity camera) {
    // Logic để xác định method dựa trên camera data
    return camera.type == CameraType.onvif ? 'ONVIF' : 'RTSP';
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscure = !_obscure;
    });

    // Nếu đang hiển thị mật khẩu, hủy timer cũ và tạo timer mới
    if (!_obscure) {
      _passwordVisibilityTimer?.cancel();
      _passwordVisibilityTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            _obscure = true;
          });
        }
      });
    } else {
      // Nếu đang ẩn mật khẩu, hủy timer
      _passwordVisibilityTimer?.cancel();
    }
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
    _passwordVisibilityTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            if (bloc.currentGroupId.isEmpty) {
              // Reload danh sách camera
              bloc.add(const GetListCameraEvent());
            } else {
              bloc.add(
                GetListCameraInGroupEvent(
                  groupId: List.from(bloc.currentGroupId),
                ),
              );
            }
            // Hiển thị dialog thành công và reload danh sách
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAppMessageDialog(
                context,
                message: 'Thêm camera thành công!',
                type: AppMessageType.success,
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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
              final index = context
                  .read<ControlCameraBloc>()
                  .listCamera
                  .indexWhere((element) => element.id == state.cameraEntity.id);
              if (index != -1) {
                context.read<ControlCameraBloc>().listCamera[index] =
                    state.cameraEntity;
              }
              bloc.add(const GetListCameraEvent());
              showAppMessageDialog(
                context,
                message: 'Cập nhật camera thành công!',
                type: AppMessageType.success,
              );
            });
          }
        }
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
        actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        title: Row(
          children: [
            Expanded(
              child: Text(
                _buildDialogTitle(),
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
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(child: _buildStepContent()),
          ),
        ),
        actions: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: AppButton.outline(
                      label: 'Hủy',
                      onPressed: (_isChecking || _isSubmitting)
                          ? null
                          : () => Navigator.pop(context),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: AppButton.filled(
                      label: _isSubmitting
                          ? ''
                          : _step == AddCameraStep.manualForm
                          ? 'Xác nhận'
                          : 'Tiếp tục',
                      onPressed:
                          _isSubmitting ||
                              (_step == AddCameraStep.selectMode &&
                                  _selectedAddStep == null)
                          ? null
                          : () async {
                              // Bước chọn phương thức -> chuyển sang bước tương ứng
                              if (_step == AddCameraStep.selectMode) {
                                if (_selectedAddStep == null) return;
                                setState(() {
                                  _step = _selectedAddStep!;
                                });
                                return;
                              }

                              // Các bước không phải form thủ công hiện tại: placeholder, chỉ đóng dialog
                              if (_step != AddCameraStep.manualForm) {
                                Navigator.pop(context);
                                return;
                              }

                              // Bước form thủ công: giữ nguyên logic submit cũ
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
                                  subStreamUrls: _sub.text.isEmpty
                                      ? []
                                      : _sub.text.trim().split(','),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCheckPassword() {
    setState(() => _isChecking = true);
    widget.onCheck?.call(
      _onvifXaddrs.text.trim(),
      _onvifUserName.text.trim(),
      _onvifPassword.text.trim(),
      [],
    );
  }

  /// Đổi title dialog theo mode/bước hiện tại
  String _buildDialogTitle() {
    if (widget.mode == CameraDialogMode.edit) {
      return 'Sửa camera';
    }

    switch (_step) {
      case AddCameraStep.selectMode:
        return 'Thêm camera';
      case AddCameraStep.manualForm:
        return 'Thêm camera thủ công';
      case AddCameraStep.discovery:
        return 'Dò tìm camera';
      case AddCameraStep.importFile:
        return 'Thêm camera bằng file';
    }
  }

  /// Build nội dung theo từng bước của flow thêm camera
  Widget _buildStepContent() {
    switch (_step) {
      case AddCameraStep.selectMode:
        return _buildSelectMode();
      case AddCameraStep.manualForm:
        return _buildManualForm();
      case AddCameraStep.discovery:
        return _buildDiscoveryContent();
      case AddCameraStep.importFile:
        return _buildImportFileContent();
    }
  }

  Widget _buildManualForm() {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          AppField(
            controller: _name,
            hintText: 'Nhập tên camera',
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Tên camera không được để trống';
              }
              return null;
            },
            label: 'Tên camera',
            requiredField: true,
            maxLength: 50,
          ),
          const SizedBox(height: 24),
          // Phương thức selection
          _buildMethodCamera(),
          _buildAccountCamera(),
          const SizedBox(height: 24),
          AppField(
            controller: _rtsp,
            hintText: 'Nhập địa chỉ RTSP',
            keyboardType: TextInputType.url,
            label: 'Địa chỉ RTSP',
            requiredField: true,
            validator: (v) => v == null || v.trim().isEmpty
                ? 'Địa chỉ RTSP không được để trống'
                : null,
          ),
          const SizedBox(height: 24),
          AppField(
            controller: _sub,
            hintText: 'Nhập địa chỉ luồng phụ',
            label: 'Địa chỉ luồng phụ',
            // validator: (v) => v == null || v.trim().isEmpty
            //     ? 'Địa chỉ luồng phụ không được để trống'
            //     : null,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Bước 1: chọn cách thêm camera
  Widget _buildSelectMode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        Text(
          'Chọn phương thức thêm camera',
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 12),
        _buildSelectModeOption(
          label: 'Thêm thủ công',
          value: AddCameraStep.manualForm,
        ),
        _buildSelectModeOption(
          label: 'Dò tìm camera',
          value: AddCameraStep.discovery,
        ),
        _buildSelectModeOption(
          label: 'Thêm bằng file',
          value: AddCameraStep.importFile,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSelectModeOption({
    required String label,
    required AddCameraStep value,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedAddStep = value;
        });
      },
      child: Row(
        children: [
          Radio<AddCameraStep>(
            value: value,
            groupValue: _selectedAddStep,
            onChanged: (v) {
              if (v == null) return;
              setState(() {
                _selectedAddStep = v;
              });
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Bước dò tìm camera (hiện tại để placeholder, sẽ gắn logic dò tìm sau)
  Widget _buildDiscoveryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          'Dò tìm camera',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Nhấn để tìm camera ONVIF trong cùng mạng và thêm vào hệ thống. Vui lòng đảm bảo đã bật camera',
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w400,
            isItalic: true,
            color: AppColors.grey64748B,
          ),
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            InkWell(
              onTap: () async {
                setState(() {
                  _isCheckingDiscovery = true;
                  _expandedDiscoveryIndex = null;
                });
                _deviceMatches = await widget.onCheckDiscovery?.call();
                setState(() {
                  _isCheckingDiscovery = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.blue005AA9),
                ),
                child: Text(
                  'Tìm kiếm',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blue005AA9,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isCheckingDiscovery,
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.blue005AA9,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (_deviceMatches != null)
          _deviceMatches!.isEmpty
              ? Text(
                  'Không tìm thấy camera nào trong mạng.',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey64748B,
                  ),
                )
              : Column(
                  children: [
                    const Divider(height: 1, color: AppColors.greyE2E8F0),
                    ..._deviceMatches!.asMap().entries.map(
                      (entry) => _buildDiscoveryItem(
                        match: entry.value,
                        index: entry.key,
                      ),
                    ),
                  ],
                ),
      ],
    );
  }

  Widget _buildDiscoveryItem({required ProbeMatch match, required int index}) {
    final isExpanded = _expandedDiscoveryIndex == index;

    final uri = Uri.tryParse(match.xAddr);
    final ip = uri?.host.isNotEmpty == true ? uri!.host : match.xAddr;
    final model = match.hardware.isNotEmpty ? match.hardware : 'Không rõ';

    Widget buildHeader(TextStyle textStyle) {
      return Row(
        children: [
          const Icon(Icons.videocam_outlined, size: 18, color: AppColors.black),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$ip - Model: $model',
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    if (!isExpanded) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expandedDiscoveryIndex = index;
                _onvifXaddrs.text = match.xAddr;
                if (_onvifUserName.text.isEmpty) {
                  _onvifUserName.text = 'Admin';
                }
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: buildHeader(
                AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.greyE2E8F0),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.greyF2F4FA,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _expandedDiscoveryIndex = null;
                  });
                },
                child: buildHeader(
                  AppTypography.style(
                    14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tài khoản camera',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              AppField(
                controller: _onvifUserName,
                hintText: 'Admin',
                label: '',
              ),
              const SizedBox(height: 16),
              Text(
                'Mật khẩu camera',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              AppField(
                controller: _onvifPassword,
                hintText: '********',
                label: '',
                obscureText: _obscure,
                suffix: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 36,
                    child: AppButton.outline(
                      label: 'Thêm và Sửa',
                      onPressed: () {
                        setState(() {
                          _step = AddCameraStep.manualForm;
                          _method = 'ONVIF';
                          _name.text = match.name;
                        });
                        if (_onvifUserName.text.isNotEmpty &&
                            _onvifPassword.text.isNotEmpty) {
                          _onCheckPassword();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 36,
                    child: AppButton.filled(
                      label: 'Thêm',
                      onPressed: () {
                        // TODO: Gắn logic "thêm nhanh" cho camera dò được
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Divider(height: 1, color: AppColors.greyE2E8F0),
      ],
    );
  }

  /// Bước thêm bằng file (placeholder – sẽ gắn import file sau)
  Widget _buildImportFileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        Text(
          'Thêm camera bằng file',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Khu vực này sẽ cho phép bạn chọn file (ví dụ: CSV / Excel) để import danh sách camera.',
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w400,
            color: AppColors.grey64748B,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.greyE2E8F0),
          ),
          child: Text(
            'TODO: Gắn UI chọn file và logic import camera từ file tại đây.',
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.grey64748B,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildAccountCamera() {
    return Column(
      children: [
        Visibility(
          visible: _method != 'RTSP',
          child: Column(
            children: [
              const SizedBox(height: 12),
              AppField(
                controller: _onvifXaddrs,
                hintText: 'Nhập địa chỉ ONVIF',
                label: 'Địa chỉ ONVIF',
                requiredField: true,
                readOnly: widget.mode == CameraDialogMode.edit,
                validator: (v) {
                  if (_method != 'RTSP' && (v == null || v.trim().isEmpty)) {
                    return 'Địa chỉ ONVIF không được để trống';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: AppField(
                controller: _onvifUserName,
                hintText: 'Nhập tài khoản camera',
                label: 'Tài khoản camera',
                requiredField: true,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Tài khoản camera không được để trống'
                    : null,
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
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Mật khẩu camera không được để trống'
                    : null,
                suffix: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                trailingButton: Visibility(
                  visible: _method != 'RTSP',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ElevatedButton(
                      onPressed: _isChecking
                          ? null
                          : () {
                              _onCheckPassword();
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
                          : Text(
                              'Kiểm tra',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
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
          text: TextSpan(
            text: 'Phương thức',
            style: AppTypography.style(
              14,
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
              title: 'ONVIF',
              value: 'ONVIF',
              readonly: widget.mode == CameraDialogMode.edit,
              groupValue: _method,
              onChanged: (value) {
                if (value == null) return;
                setState(() => _method = value);
              },
            ),
            const SizedBox(width: 24),
            CustomRadioButton(
              title: 'RTSP',
              value: 'RTSP',
              readonly: widget.mode == CameraDialogMode.edit,
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
