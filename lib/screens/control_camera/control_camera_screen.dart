import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dialog.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dropdown_widget.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/item_camera_widget.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/title_widget.dart';

class ControlCameraScreen extends StatefulWidget {
  const ControlCameraScreen({super.key});

  @override
  State<ControlCameraScreen> createState() => _ControlCameraScreenState();
}

class _ControlCameraScreenState extends State<ControlCameraScreen> {
  final TextEditingController cameraNameController = TextEditingController();
  CameraStatus? cameraStatus;

  void _onValidateCamera() {
    context.read<ControlCameraBloc>().add(ValidateCameraEvent(message: ''));
  }

  void _onGetListCamera({List<int>? cameraId, int? status, int? ivaType}) {
    context.read<ControlCameraBloc>().add(
      GetListCameraEvent(cameraId: cameraId, status: status, ivaType: ivaType),
    );
  }

  void _onSearch() {
    context.read<ControlCameraBloc>().add(
      FilterCameraEvent(
        cameraName: cameraNameController.text,
        cameraStatus: cameraStatus,
      ),
    );
  }

  @override
  void initState() {
    _onGetListCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
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
                      Text(
                        'Tên nhóm camera',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: cameraNameController,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                            child: SvgPicture.asset(AppAssets.icSearch),
                          ),
                          hintText: 'Nhập tên camera',
                          hintStyle: TextStyle(
                            color: AppColors.grey64748B,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyE2E8F0,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyE2E8F0,
                              width: 1,
                            ),
                          ),
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
                      Text(
                        'Trạng thái',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                        contentTextStyle: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey64748B,
                        ),
                        hint: Text(
                          'Tất cả',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey64748B,
                          ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.secondary,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    margin: EdgeInsets.only(left: 15),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.icSearch,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                InkWell(
                  onTap: () {
                    showAddCameraRtspDialog(context);
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
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ControlCameraBloc, ControlCameraState>(
            builder: (context, state) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(),
                  state is ListCameraSuccessState
                      ? Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.cameras.length,
                            itemBuilder: (context, index) => ItemCameraWidget(
                              itemCamera: state.cameras[index],
                              index: index + 1,
                            ),
                          ),
                        )
                      : Container(width: 10, height: 10, color: Colors.amber),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
