import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_type.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/control_camera/utils/custom_onvif_discovery.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import '../../home/components/components_src.dart';
import '../bloc/control_camera_bloc.dart';
import '../bloc/control_camera_event.dart';
import 'add_camera_dialog_types.dart';

part 'add_camera_dialog_discovery.dart';
part 'add_camera_dialog_form.dart';

/// Entry point to show the dialog
Future<T?> showAddCameraDialog<T>(
  BuildContext context, {
  CameraDialogMode mode = CameraDialogMode.add,
  CameraEntity? cameraData,
  Future<void> Function(AddCameraPayload value)? onSubmit,
  Future<void> Function(AddCameraPayload value)? onEdit,
  Future<List<DiscoveredDevice>> Function()? onCheckDiscovery,
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
  final Future<List<DiscoveredDevice>> Function()? onCheckDiscovery;
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

  List<DiscoveredDevice>? _deviceMatches;
  AddCameraStep _step = AddCameraStep.selectMode;
  AddCameraStep? _selectedAddStep;
  int? _expandedDiscoveryIndex;
  bool _isChecking = false;
  bool _isSubmitting = false;

  bool _isCheckingDiscovery = false;
  Timer? _passwordVisibilityTimer;

  bool _isAddingDiscoveryCamera = false;
  final _discoveryFormKey = GlobalKey<FormState>();

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
      listener: _handleBlocState,
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

  void _handleBlocState(BuildContext context, ControlCameraState state) {
    if (state is CheckOnvifSuccessState) {
      setState(() => _isChecking = false);
      _rtsp.text = state.cameraOnvif.rtspUrl;
      _sub.text = state.cameraOnvif.subStreamUrl.isNotEmpty
          ? state.cameraOnvif.subStreamUrl.first
          : '';

      if (_isAddingDiscoveryCamera) {
        if (_rtsp.text.isNotEmpty && _sub.text.isNotEmpty) {
          setState(() => _isSubmitting = true);
          final payload = AddCameraPayload(
            name: _name.text,
            method: 'ONVIF',
            rtsp: _rtsp.text,
            onifDeviceIp: _onvifXaddrs.text,
            username: _onvifUserName.text,
            password: _onvifPassword.text,
            subStream: _sub.text,
            location: CameraMap(lat: 0, log: 0, locationDes: ''),
            xaddr: _onvifXaddrs.text,
            subStreamUrls: _sub.text.isEmpty ? [] : _sub.text.split(','),
          );
          widget.onSubmit?.call(payload);
        } else {
          setState(() => _isAddingDiscoveryCamera = false);
          ToastUtil.toastFail(
            title: const Text('Không tìm thấy luồng RTSP/Substream'),
          );
        }
      }
    } else if (state is CheckOnvifFailState) {
      setState(() => _isChecking = false);
      if (_isAddingDiscoveryCamera) {
        setState(() => _isAddingDiscoveryCamera = false);
        ToastUtil.toastFail(title: Text(state.message));
      } else {
        showAppMessageDialog(
          context,
          type: AppMessageType.error,
          message: state.message,
        );
      }
    } else if (state is AddCameraSuccessState) {
      setState(() => _isSubmitting = false);
      final bloc = context.read<ControlCameraBloc>();
      if (mounted) {
        Navigator.pop(context);
        if (bloc.currentGroupId.isEmpty) {
          bloc.add(const GetListCameraEvent());
        } else {
          bloc.add(
            GetListCameraInGroupEvent(groupId: List.from(bloc.currentGroupId)),
          );
        }
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
      if (_isAddingDiscoveryCamera) {
        setState(() => _isAddingDiscoveryCamera = false);
        ToastUtil.toastFail(title: Text(state.errorMsg));
      } else {
        showAppMessageDialog(
          context,
          type: AppMessageType.error,
          message: state.errorMsg,
        );
      }
    } else if (state is UpdateCameraSuccessState) {
      setState(() => _isSubmitting = false);
      final bloc = context.read<ControlCameraBloc>();
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
          final index = context.read<ControlCameraBloc>().listCamera.indexWhere(
            (element) => element.id == state.cameraEntity.id,
          );
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
  }

  void updateState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }
}
