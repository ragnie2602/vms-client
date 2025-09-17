import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/common/platform_widget.dart';

import '../common/state_builder_mixin.dart';
import 'bloc/list_camera_bloc.dart';
import 'widgets/camera_view.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> with StateBuilderMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCameraBloc, ListCameraState>(
      builder: (context, blocState) => stateBuilder<ListCameraSuccess>(
        context,
        blocState,
        onReload: () => context.read<ListCameraBloc>().add(GetAllCamera()),
        child: (state) => PlatformWidget.builder(
          onAndroid: (context) => Container(),
          onIOS: (context) => Container(),
          onMacOS: (context) => Container(),
          onWindows: (context) => Scrollbar(
            thumbVisibility: true,
            child: GridView.count(
              cacheExtent: double.maxFinite, // build hết 36 camera
              primary: true, // true thì scrollbar bên ngoài ms có thể handle đc
              crossAxisCount: 6,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: List.generate(state.cameras.length, (index) {
                return CameraView(index: index, data: state.cameras[index]);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
