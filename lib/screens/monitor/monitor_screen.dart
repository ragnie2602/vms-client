import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/screens/shared/platform_widget.dart';

import '../camera_live/camera_live_screen.dart';
import '../shared/state_builder_mixin.dart';
import 'bloc/list_camera_bloc.dart';
import 'widgets/camera_player.dart';

class MonitorScreen extends StatelessWidget with StateBuilderMixin {
  const MonitorScreen({super.key});

  // Getters
  double get spacing => AppConfig.MONITOR_GRID_SPACING;

  Size _initPlayerSize(BoxConstraints constraints, [int rows = 6, int columns = 6]) {
    rows = AppConfig.OVERRIDE_MONITOR_GRID_ROWS ?? rows;
    columns = AppConfig.OVERRIDE_MONITOR_GRID_COLUMNS ?? columns;

    final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
    final height = (constraints.maxHeight - spacing * (rows - 1)) / rows;

    return Size(width, height);
  }

  // ignore: unused_element
  void _onChangeGridMode(BuildContext context, BaseView mode) {
    context.read<ListCameraBloc>().add(ChangeGridMode(mode));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFFF8F9FE),
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<ListCameraBloc, ListCameraState>(
        builder: (context, blocState) => stateBuilder<ListCameraSuccess>(
          blocState,
          onReload: () => context.read<ListCameraBloc>().add(GetAllCamera()),
          child: (state) => PlatformWidget.groupBuilder(
            onMobile: (context) => Container(),
            onDesktop: (context) => LayoutBuilder(
              builder: (context, constraints) {
                final size = _initPlayerSize(constraints, state.mode.rows, state.mode.columns);

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: state.paginatedCameras.mapIndexed((index, camera) {
                    return SizedBox.fromSize(
                      size: size,
                      child: CameraPlayer(
                        size: state.mode.total == 1 ? null : size,
                        data: camera,
                        key: ValueKey("player($index)___${camera.camId}"),
                        builder: _buildCameraView,
                        borderRadius: 10,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCameraView(BuildContext context, Widget player, CameraEntity data) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          Routes.livecamera.name,
          extra: CameraLiveScreenArgs(data: data, previous: Routes.monitoring),
        );
      },
      child: Stack(
        children: [
          player,

          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.white.withValues(alpha: 0.6))],
              ),
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                data.name,
                style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
