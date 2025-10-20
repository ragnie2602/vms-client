import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/screens/camera_live/camera_live_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/camera_list_popup.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

class CustomMonitorPane extends StatefulWidget {
  final bool addMode;

  const CustomMonitorPane({super.key, this.addMode = false});

  @override
  State<CustomMonitorPane> createState() => _CustomMonitorPaneState();
}

class _CustomMonitorPaneState extends State<CustomMonitorPane> {
  CustomLiveView? customView;

  ViewMode get mode => customView?.base ?? ViewMode.v2x2;

  @override
  initState() {
    super.initState();

    // Init customView from state when being navigated from before screen (addMode is false)
    if (!widget.addMode) {
      final bloc = context.read<CustomViewBloc>();
      if (bloc.state is ShowCustomViewSuccess) {
        customView = (bloc.state as ShowCustomViewSuccess).customView;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomViewBloc, CustomViewState>(
      listener: (context, state) {
        if (state is ShowCustomViewSuccess) {
          setState(() => customView = state.customView);
        } else if (state is CreateCustomViewSuccess) {
          context.read<CustomViewBloc>().add(
            UpdateCustomView(
              customView: state.customView.copyWith(positions: customView?.positions ?? []),
            ),
          );
        }
      },
      child: Column(
        children: List.generate(
          mode.rows,
          (row) => Expanded(
            child: Row(
              children: List.generate(
                mode.columns,
                (column) => Expanded(child: buildItem(context, column, row)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, int column, int row) {
    final index = row * mode.columns + column;

    return BlocBuilder<CustomViewBloc, CustomViewState>(
      buildWhen: (previous, current) =>
          current is AddingCameraToCustomViewSuccess && current.index == index,
      builder: (context, state) {
        var camera = customView?.positions.elementAtOrNull(index)?.camera;
        if (state is AddingCameraToCustomViewSuccess) {
          camera = state.camera;
          if (customView?.positions != null && index < customView!.positions.length) {
            customView!.positions[index] = LiveViewPosition(
              index: index,
              cameraId: camera.id,
              camera: camera,
            );
          }
        }

        return camera == null ? _buildEmptyCell(context, index) : _buildCameraView(context, camera);
      },
    );
  }

  Widget _buildCameraView(BuildContext context, CameraEntity camera) {
    return Padding(
      padding: const EdgeInsets.all(AppConfig.MONITOR_GRID_SPACING),
      child: CameraPlayer(
        mode: PlayerMode.monitoring,
        name: camera.name,
        source: camera.subStreamUri.toString(),
        builder: (player, status) => GestureDetector(
          onTap: () =>
              context.pushNamed(Routes.livecamera.name, extra: CameraLiveScreenArgs(data: camera)),
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
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Colors.white.withValues(alpha: 0.6)),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.icVideoOn, width: 16, height: 16),
                      SizedBox(width: 4),
                      Text(
                        camera.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyCell(BuildContext context, int index) {
    return Container(
      color: AppColors.blackOrWhiteReverse,
      margin: EdgeInsets.all(AppConfig.MONITOR_GRID_SPACING),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: InkWell(
          onTapDown: (TapDownDetails details) =>
              showCameraListPopup(context, details.globalPosition, index),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SvgPicture.asset(
                AppAssets.iconAddSlim,
                colorFilter: ColorFilter.mode(AppColors.blackOrWhite, BlendMode.srcIn),
                width: 72,
                height: 72,
              ),
            ),
          ),
        ),
      ),
    );
  }

  showCameraListPopup(BuildContext context, Offset position, int index) {
    final monitorBloc = context.read<MonitorBloc>();
    final customViewBloc = context.read<CustomViewBloc>();

    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Material(
              color: Colors.transparent,
              child: CameraListPopup(
                bloc: monitorBloc,
                onCameraSelected: (camera) {
                  customViewBloc.add(AddingCameraToCustomView(camera, index));
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
