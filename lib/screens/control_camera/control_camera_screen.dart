import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_colors.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
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
                    border: Border.all(width: 1, color: AppColors.blue005AA9),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Thêm camera',
                        style: TextStyle(
                          color: AppColors.blue005AA9,
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
