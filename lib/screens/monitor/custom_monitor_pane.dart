import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/camera_live/camera_live_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/camera_list_popup.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

class CustomMonitorPane extends StatelessWidget {
  const CustomMonitorPane({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomViewBloc, CustomViewState>(
      builder: (context, state) {
        if (state is CustomViewSuccess) {
          return Column(
            children: List.generate(state.customView.base.rows, (row) {
              return Expanded(
                child: Row(
                  children: List.generate(state.customView.base.columns, (column) {
                    final camera = state
                        .customView
                        .positions[row * state.customView.base.columns + column]
                        .camera;

                    return Expanded(
                      child: Container(
                        child: (camera == null)
                            ? _buildEmptyCell(context)
                            : Padding(
                                padding: EdgeInsets.all(AppConfig.MONITOR_GRID_SPACING),
                                child: CameraPlayer(
                                  builder: (player, status) =>
                                      _buildCameraView(context, player, camera),
                                  mode: PlayerMode.monitoring,
                                  name: camera.name,
                                  source: camera.subStreamUri.toString(),
                                ),
                              ),
                      ),
                    );
                  }),
                ),
              );
            }),
          );
        }

        return Container();
      },
    );
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

  Widget _buildEmptyCell(BuildContext context) {
    return Container(
      color: AppColors.blackOrWhiteReverse,
      margin: EdgeInsets.all(AppConfig.MONITOR_GRID_SPACING),
      child: InkWell(
        onTapDown: (TapDownDetails details) {
          showCameraListPopup(context, details.globalPosition);
        },
        splashColor: AppColors.blackOrWhite.withValues(alpha: 0.1),
        highlightColor: AppColors.blackOrWhite.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(4),
        child: Container(
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
    );
  }

  showCameraListPopup(BuildContext context, Offset position) {
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
            child: Material(color: Colors.transparent, child: CameraListPopup()),
          ),
        ],
      ),
    );
  }
}
