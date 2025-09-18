import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/screens/common/platform_widget.dart';

import '../common/state_builder_mixin.dart';
import 'bloc/list_camera_bloc.dart';
import 'widgets/camera_view.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key, this.rows = 6, this.columns = 6, this.spacing = 3.0});

  final int rows;
  final int columns;
  final double spacing;

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> with StateBuilderMixin {
  Size _initPlayerSize(BoxConstraints constraints) {
    final width = (constraints.maxWidth - widget.spacing * (widget.columns - 1)) / widget.columns;
    final height = (constraints.maxHeight - widget.spacing * (widget.rows - 1)) / widget.rows;
    return Size(width, height);
  }

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
          onWindows: (context) => LayoutBuilder(
            builder: (context, constraints) {
              final size = _initPlayerSize(constraints);

              return Wrap(
                spacing: widget.spacing,
                runSpacing: widget.spacing,
                children: state.cameras.mapIndexed((index, camera) {
                  return SizedBox.fromSize(
                    size: size,
                    child: CameraView(
                      index: index,
                      data: camera,
                      key: ValueKey("player($index)___${camera.camId}"),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
