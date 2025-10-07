import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<ControlCameraBloc, ControlCameraState>(
      builder: (context, newState) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    await showAddCameraRtspDialog(
                    context,
                    title: 'Thêm camera RTSP',
                    onCheck: () {
                      _onValidateCamera() ;
                    }
                  ,                   
                    onSubmit: (payload) {
                      },
                    );},
                  child: Container(
                    color: Colors.blue,
                    child: Text('Thêm camera RTSP'),
                  ),
                ),
                const SizedBox(width: 100),
                InkWell(
                  onTap: () async {
                    await showAddCameraRtspDialog(
                      context,
                      title: 'Thêm camera OnVIF',
                      onCheck: () {
                        _onValidateCamera();
                      },
                      onSubmit: (payload) {},
                    );
                  },
                  child: Container(
                    color: Colors.blue,
                    child: Text('Thêm camera OnVIF'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
       
      },
    );
  }
}
