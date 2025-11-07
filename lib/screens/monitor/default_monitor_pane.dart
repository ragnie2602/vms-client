import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/home/components/table_paginator.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/custom_monitor_pane.dart';
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
    // Vì là stateless nên buộc phải viết vào đây, hy vọng nó không bị gọi lung tung :*(
    context.read<MonitorBloc>().add(GetAllCamera());
    context.read<CustomViewBloc>().add(
      ShowCustomView(
        CustomLiveView(id: [], base: ViewMode.v2x2, positions: [], name: ''),
        CustomMonitorPaneMode.view,
      ),
    );

    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, blocState) => stateBuilder<MonitorSuccess>(
        blocState,
        onReload: () => context.read<MonitorBloc>().add(GetAllCamera()),
        child: (state) => PlatformWidget.groupBuilder(
          onMobile: (context) => Container(),
          onDesktop: (context) => BlocSelector<AppBloc, AppState, bool>(
            selector: (state) => state.displayFullScreenLiveView,
            builder: (context, isFullScreen) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final paginatorHeight = isFullScreen ? 4 : 48;
                  final size = _initPlayerSize(
                    constraints,
                    paginatorHeight,
                    state.mode.rows,
                    state.mode.columns,
                  );
                  final wrapWidth =
                      (size.width * state.mode.columns) +
                      (spacing * (state.mode.columns - 1));
                  return Container(
                    color: AppColors.greyF2F4FA,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: wrapWidth,
                          child: Wrap(
                            spacing: spacing,
                            runSpacing: spacing,
                            children: List.generate(state.mode.total, (index) {
                              if (index < state.paginatedCameras.length) {
                                final camera = state.paginatedCameras[index];
                                return SizedBox.fromSize(
                                  size: size,
                                  child: InkWell(
                                    onTap: isFullScreen
                                        ? null
                                        : () {
                                            context.pushNamed(
                                              Routes.cameraDetail.name,
                                              extra: CameraDetailScreenArgs(
                                                data: camera,
                                              ),
                                            );
                                          },
                                    child: CameraPlayer(
                                      size: state.mode.total == 1 ? null : size,
                                      source: camera.subStreamUri.toString(),
                                      name: camera.name,
                                      key: ValueKey(
                                        "player($index)___${camera.camId}",
                                      ),
                                      mode: PlayerMode.monitoring,
                                      builder: (player, status) =>
                                          _buildCameraView(
                                            context,
                                            player,
                                            camera,
                                            size,
                                          ),
                                    ),
                                  ),
                                );
                              } else {
                                // Empty placeholder for missing cameras
                                return SizedBox.fromSize(
                                  size: size,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                );
                              }
                            }),
                          ),
                        ),
                        Spacer(),
                        Visibility(
                          visible: !isFullScreen,
                          child: SizedBox(
                            width: wrapWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hiển thị ${state.paginatedCameras.length} trong số ${state.cameras.length} camera",
                                  style: AppTypography.style(
                                    fontWeight: FontWeight.w400,
                                    13,
                                    color: Colors.black,
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 280,
                                    maxHeight: 32,
                                  ),
                                  child: TablePaginator(
                                    (state.cameras.length / state.mode.total)
                                        .ceil(),
                                    state.page - 1,
                                    (page) => onChangePage(context, page),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // Getters

  Size _initPlayerSize(
    BoxConstraints constraints,
    int paginatorHeight, [
    int rows = 6,
    int columns = 6,
  ]) {
    rows = AppConfig.OVERRIDE_MONITOR_GRID_ROWS ?? rows;
    columns = AppConfig.OVERRIDE_MONITOR_GRID_COLUMNS ?? columns;

    final availableWidth =
        (constraints.maxWidth - spacing * (columns - 1)) / columns;
    final availableHeight =
        ((constraints.maxHeight - spacing * (rows - 1)) / rows) -
        (paginatorHeight / rows);

    // Maintain 16:9 aspect ratio - always use width as the constraint
    // This ensures players grow/shrink when drawer opens/closes
    final aspectRatio = 16 / 9;
    final width = availableWidth;
    final height = width / aspectRatio;

    // If height exceeds available space, scale down based on height
    if (height > availableHeight) {
      final scaledHeight = availableHeight;
      final scaledWidth = scaledHeight * aspectRatio;
      return Size(scaledWidth, scaledHeight);
    }

    return Size(width, height);
  }

  Widget _buildCameraView(
    BuildContext context,
    Widget player,
    CameraEntity data,
    Size size,
  ) {
    return Stack(
      children: [
        player,
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            constraints: BoxConstraints(maxWidth: size.width - 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppAssets.icVideoOn, width: 16, height: 16),
                SizedBox(width: 4),
                Flexible(
                  child: Text(
                    data.name,
                    style: AppTypography.style(
                      color: Colors.black,
                      9,
                      fontWeight: FontWeight.w600,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
