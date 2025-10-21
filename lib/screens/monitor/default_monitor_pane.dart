import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/camera_live/camera_live_screen.dart';
import 'package:vms_flutter_client/screens/home/components/table_paginator.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';
import 'package:vms_flutter_client/screens/shared/platform_widget.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';

class DefaultMonitorPane extends StatelessWidget with StateBuilderMixin {
  const DefaultMonitorPane({super.key});

  double get spacing => AppConfig.MONITOR_GRID_SPACING;

  void onChangePage(BuildContext context, int page) {
    context.read<MonitorBloc>().add(GetCameraAtPage(page + 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, blocState) => stateBuilder<MonitorSuccess>(
        blocState,
        onReload: () => context.read<MonitorBloc>().add(GetAllCamera()),
        child: (state) => PlatformWidget.groupBuilder(
          onMobile: (context) => Container(),
          onDesktop: (context) => LayoutBuilder(
            builder: (context, constraints) {
              final size = _initPlayerSize(constraints, state.mode.rows, state.mode.columns);

              print("Sized Box $size");

              return Column(
                children: [
                  Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: state.paginatedCameras.mapIndexed((index, camera) {
                      return SizedBox.fromSize(
                        size: size,
                        child: CameraPlayer(
                          size: state.mode.total == 1 ? null : size,
                          source: camera.subStreamUri.toString(),
                          name: camera.name,
                          key: ValueKey("player($index)___${camera.camId}"),
                          mode: PlayerMode.monitoring,
                          builder: (player, status) => _buildCameraView(context, player, camera),
                        ),
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hiển thị ${state.paginatedCameras.length} trên ${state.cameras.length} camera"),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 280, maxHeight: 32),
                          child: TablePaginator(
                            (state.cameras.length / state.mode.total).ceil(), 
                            (page) => onChangePage(context, page))
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Getters

  Size _initPlayerSize(BoxConstraints constraints, [int rows = 6, int columns = 6]) {
    rows = AppConfig.OVERRIDE_MONITOR_GRID_ROWS ?? rows;
    columns = AppConfig.OVERRIDE_MONITOR_GRID_COLUMNS ?? columns;

    final availableWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
    final availableHeight = ((constraints.maxHeight - spacing * (rows - 1)) / rows) - (48 / rows);

    // Maintain 16:9 aspect ratio - use the constraining dimension
    final aspectRatio = 16 / 9;
    double width, height;

    if (availableWidth / availableHeight > aspectRatio) {
      // Height is the constraint
      height = availableHeight;
      width = height * aspectRatio;
    } else {
      // Width is the constraint
      width = availableWidth;
      height = width / aspectRatio;
    }

    print("WIDTH AND HEIGHT $width $height");
    return Size(width, height);
  }

  Widget _buildCameraView(BuildContext context, Widget player, CameraEntity data) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.livecamera.name, extra: CameraLiveScreenArgs(data: data));
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
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.icVideoOn, width: 16, height: 16),
                  SizedBox(width: 4),
                  Text(
                    data.name,
                    style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
