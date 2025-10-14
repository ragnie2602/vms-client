import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dialog.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dropdown_widget.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/item_camera_widget.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/title_widget.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

class ControlCameraScreen extends StatefulWidget {
  const ControlCameraScreen({super.key});

  @override
  State<ControlCameraScreen> createState() => _ControlCameraScreenState();
}

class _ControlCameraScreenState extends State<ControlCameraScreen> {
  final TextEditingController cameraNameController = TextEditingController();
  CameraStatus? cameraStatus;

  void _onGetListCamera({List<int>? cameraId, int? status, int? ivaType}) {
    context.read<ControlCameraBloc>().add(GetListCameraEvent(cameraId: cameraId, status: status, ivaType: ivaType));
  }

  void _onCheckOnvif({required String xaddrs, required String userName, required String password, List<int>? boxId}) {
    context.read<ControlCameraBloc>().add(CheckOnvifEvent(xaddrs: xaddrs, userName: userName, password: password, boxId: boxId));
  }

  void _onSearch() {
    context.read<ControlCameraBloc>().add(FilterCameraEvent(cameraName: cameraNameController.text, cameraStatus: cameraStatus));
  }

  void _onAddCameraRTSP({
    required String name,
    required String username,
    required String password,
    required String rtspUrl,
    required CameraMap location,
    required List<int> boxId,
    required List<int> groupId,
    required List<String> subStreamUrls,
  }) {
    context.read<ControlCameraBloc>().add(
      AddCameraRTSPEvent(
        name: name,
        username: username,
        password: password,
        rtspUrl: rtspUrl,
        location: location,
        boxId: boxId,
        groupId: groupId,
        subStreamUrls: subStreamUrls,
      ),
    );
  }

  void _onAddCameraOnvif({
    required String name,
    required String username,
    required String password,
    required String onvifDeviceIp,
    required String rtspUrl,
    required String serialNumber,
    required CameraMap location,
    required List<int> boxId,
    required List<int> groupId,
    required String urn,
    required List<String> subStreamUrls,
  }) {
    context.read<ControlCameraBloc>().add(
      AddCameraOnvifEvent(
        name: name,
        username: username,
        password: password,
        onvifDeviceIp: onvifDeviceIp,
        rtspUrl: rtspUrl,
        serialNumber: serialNumber,
        location: location,
        boxId: boxId,
        groupId: groupId,
        urn: urn,
        subStreamUrls: subStreamUrls,
      ),
    );
  }

  @override
  void initState() {
    _onGetListCamera();
    super.initState();
  }

  void _handleAddCameraSuccess() {
    showAppMessageDialog(
      context,
      message: 'Thêm camera thành công!',
      type: AppMessageType.success,
      onOk: () {
        _onGetListCamera(); // Reload danh sách camera
      },
    );
  }

  void _handleAddCameraError(String errorMessage) {
    showAppMessageDialog(context, message: 'Lỗi khi thêm camera: $errorMessage', type: AppMessageType.error);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tên nhóm camera', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 10),
                      TextField(
                        controller: cameraNameController,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            child: SvgPicture.asset(AppAssets.icSearch),
                          ),
                          hintText: 'Nhập tên camera',
                          hintStyle: TextStyle(color: AppColors.grey64748B, fontSize: 14, fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1)),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trạng thái', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 10),
                      CustomCommonDropdown<CameraStatus>(
                        items: CameraStatus.values,
                        value: cameraStatus,
                        onChanged: (p0) {
                          setState(() {
                            cameraStatus = p0;
                          });
                        },
                        itemAsString: (p0) => p0.getName(),
                        contentTextStyle: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.grey64748B),
                        hint: Text(
                          'Tất cả',
                          style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.grey64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _onSearch();
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: AppColors.secondary),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    margin: EdgeInsets.only(left: 15),
                    child: Center(child: SvgPicture.asset(AppAssets.icSearch, color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 25),
                InkWell(
                  onTap: () {
                    showAddCameraRtspDialog(
                      context,
                      onSubmit: (payload) async {
                        if (payload.method == 'RTSP') {
                          _onAddCameraRTSP(
                            name: payload.name,
                            username: payload.username,
                            password: payload.password,
                            rtspUrl: payload.rtsp,
                            location: payload.location,
                            boxId: const [],
                            groupId: const [],
                            subStreamUrls: payload.subStreamUrls,
                          );
                        } else {
                          _onAddCameraOnvif(
                            name: payload.name,
                            username: payload.username,
                            password: payload.password,
                            onvifDeviceIp: payload.onifDeviceIp,
                            rtspUrl: payload.rtsp,
                            serialNumber: '',
                            location: payload.location,
                            boxId: const [],
                            groupId: const [],
                            urn: '',
                            subStreamUrls: payload.subStreamUrls,
                          );
                        }
                      },
                      onCheck: (xaddrs, userName, password, boxId) {
                        _onCheckOnvif(xaddrs: xaddrs, userName: userName, password: password, boxId: boxId);
                      },
                    );
                  },
                  splashColor: Colors.transparent,

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: AppColors.secondary),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppAssets.icAdd),
                          const SizedBox(width: 8),
                          Text(
                            'Thêm camera',
                            style: TextStyle(color: AppColors.secondary, fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocListener<ControlCameraBloc, ControlCameraState>(
            listener: (context, state) {
              if (state is AddCameraSuccessState) {
                _handleAddCameraSuccess();
              } else if (state is AddCameraFailState) {
                _handleAddCameraError(state.errorMsg);
              }
            },
            child: BlocBuilder<ControlCameraBloc, ControlCameraState>(
              builder: (context, state) => Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(),
                    Builder(
                      builder: (context) {
                        final cameras = state is ListCameraSuccessState ? state.cameras : context.read<ControlCameraBloc>().listCamera;
                        if (cameras.isEmpty) return const SizedBox();
                        return Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cameras.length,
                            itemBuilder: (context, index) => ItemCameraWidget(itemCamera: cameras[index], index: index + 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
