import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dialog.dart';

class ControlCameraScreen extends StatefulWidget {
  const ControlCameraScreen({super.key});

  @override
  State<ControlCameraScreen> createState() => _ControlCameraScreenState();
}

class _ControlCameraScreenState extends State<ControlCameraScreen> {
  void _onValidateCamera() {
    context.read<ControlCameraBloc>().add(ValidateCameraEvent(message: ''));
  }

  void _onGetListCamera({List<int>? cameraId, int? status, int? ivaType}) {
    context.read<ControlCameraBloc>().add(
      GetListCameraEvent(cameraId: cameraId, status: status, ivaType: ivaType),
    );
  }

  @override
  void initState() {
    _onGetListCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quản lý danh sách camera',
                style: TextStyle(
                  color: AppColors.black171725,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  showAddCameraRtspDialog(context);
                },
                splashColor: Colors.transparent,

                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 1, color: AppColors.secondary),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Nhập tên camera',
                        hintStyle: TextStyle(
                          color: AppColors.grey64748B,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguồn kết nối',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                            color: AppColors.greyE2E8F0,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thời gian thêm',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
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
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // BlocConsumer<ControlCameraBloc, ControlCameraState>(
    //   builder: (context, newState) {
    //     return Center(
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 100),
    //         child: Row(
    //           children: [
    //             InkWell(
    //               onTap: () async {
    //                 await showAddCameraRtspDialog(
    //                 context,
    //                 title: 'Thêm camera RTSP',
    //                 onCheck: () {
    //                   _onValidateCamera() ;
    //                 }
    //               ,
    //                 onSubmit: (payload) {
    //                   },
    //                 );},
    //               child: Container(
    //                 color: Colors.blue,
    //                 child: Text('Thêm camera RTSP'),
    //               ),
    //             ),
    //             const SizedBox(width: 100),
    //             InkWell(
    //               onTap: () async {
    //                 await showAddCameraRtspDialog(
    //                   context,
    //                   title: 'Thêm camera OnVIF',
    //                   onCheck: () {
    //                     _onValidateCamera();
    //                   },
    //                   onSubmit: (payload) {},
    //                 );
    //               },
    //               child: Container(
    //                 color: Colors.blue,
    //                 child: Text('Thêm camera OnVIF'),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    //   listener: (context, state) {

    //   },
    // );
  }
}
