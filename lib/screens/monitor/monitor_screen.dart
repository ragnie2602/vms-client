import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/common/platform_widget.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_live_view.dart';

import '../common/state_builder_mixin.dart';
import 'bloc/list_camera_bloc.dart';
import 'widgets/camera_view.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> with StateBuilderMixin {
  CameraEntity? liveViewCamera;

  // Getters
  int get rows => AppConfig.OVERRIDE_MONITOR_GRID_ROWS ?? 6;
  int get columns => AppConfig.OVERRIDE_MONITOR_GRID_COLUMNS ?? 6;
  double get spacing => AppConfig.MONITOR_GRID_SPACING;

  Size _initPlayerSize(BoxConstraints constraints) {
    final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
    final height = (constraints.maxHeight - spacing * (rows - 1)) / rows;

    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    if (liveViewCamera != null) {
      return MonitorLiveView(
        data: liveViewCamera!,
        onBack: () => setState(() => liveViewCamera = null),
      );
    }

    return BlocBuilder<ListCameraBloc, ListCameraState>(
      builder: (context, blocState) => stateBuilder<ListCameraSuccess>(
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
                spacing: spacing,
                runSpacing: spacing,
                children: state.cameras.mapIndexed((index, camera) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => setState(() => liveViewCamera = camera),
                      child: SizedBox.fromSize(
                        size: size,
                        child: CameraView(
                          index: index,
                          data: camera,
                          key: ValueKey("player($index)___${camera.camId}"),
                        ),
                      ),
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
