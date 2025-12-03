import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/camera_list_popup.dart';
import 'package:vms_flutter_client/screens/shared/utils.dart';

import '../shared/player/sources.dart';

enum CustomMonitorPaneMode { add, edit, view }

class CustomMonitorPane extends StatefulWidget {
  final CustomMonitorPaneMode mode;

  const CustomMonitorPane({super.key, required this.mode});

  @override
  State<CustomMonitorPane> createState() => _CustomMonitorPaneState();
}

class _CustomMonitorPaneState extends State<CustomMonitorPane> {
  late final CustomViewBloc bloc;

  CustomLiveView? customView;

  ViewMode get _viewMode => customView?.base ?? ViewMode.v2x2;

  @override
  initState() {
    super.initState();
    bloc = context.read<CustomViewBloc>();

    if (bloc.state is ShowCustomViewSuccess) {
      customView = (bloc.state as ShowCustomViewSuccess).customView;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: context.read<AppBloc>().state.displayFullScreenLiveView,
      child: BlocListener<CustomViewBloc, CustomViewState>(
        listener: (context, state) {
          if (state is ShowCustomViewSuccess) {
            setState(() => customView = state.customView);
          } else if (state is UpdateCustomViewSuccess) {
            if (Utils.isEqual(state.customView.id, customView?.id ?? [])) {
              customView = state.customView;
            }
          } else if (state is DeleteCustomViewSuccess) {
            if (Utils.isEqual(state.id, customView?.id ?? [])) {
              setState(() => customView = null);
            }
          }
        },
        child: customView != null
            ? Column(
                children: List.generate(
                  _viewMode.rows,
                  (row) => Flexible(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final mH = constraints.maxHeight;
                        final mW = constraints.maxWidth;

                        double itemHeight = 0, itemWidth = 0;
                        if (mW >= mH * 16 / 9 * _viewMode.columns) {
                          itemHeight = mH;
                          itemWidth = mH * 16 / 9;
                        } else {
                          itemWidth = mW / _viewMode.columns;
                          itemHeight = itemWidth * 9 / 16;
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            _viewMode.columns,
                            (column) => SizedBox(
                              height: itemHeight,
                              width: itemWidth,
                              child: buildItem(context, column, row, Size(itemWidth, itemHeight)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }

  Widget buildItem(BuildContext context, int column, int row, Size size) {
    final index = row * _viewMode.columns + column;

    return BlocBuilder<CustomViewBloc, CustomViewState>(
      buildWhen: (previous, current) =>
          current is ShowCustomViewSuccess ||
          (current is AddingCameraToCustomViewSuccess && current.index == index) ||
          (current is RemovingCameraFromCustomViewSuccess && current.index == index) ||
          (current is UpdatingCustomView && current.index == index) ||
          (current is UpdateCustomViewSuccess && current.index == index),
      builder: (context, state) {
        CameraEntity? camera;

        if (state is AddingCameraToCustomViewSuccess && state.index == index) {
          if (customView?.positions != null && index < customView!.positions.length) {
            customView!.positions[index] = LiveViewPosition(
              index: index,
              cameraId: state.camera.id,
              camera: state.camera,
            );
          }
        } else if (state is UpdateCustomViewSuccess && state.index == index) {
          camera = state.customView.positions.elementAtOrNull(index)?.camera;
        } else if (state is RemovingCameraFromCustomViewSuccess && state.index == index) {
          if (customView?.positions != null && index < customView!.positions.length) {
            customView!.positions[index] = LiveViewPosition(
              index: index,
              cameraId: [],
              camera: null,
            );
          }
        } else if (state is UpdatingCustomView && state.index == index) {
          return _buildEmptyCell(context, index, isUpdating: true);
        }

        camera = customView?.positions.elementAtOrNull(index)?.camera;
        return camera == null
            ? _buildEmptyCell(context, index)
            : _buildCameraView(context, camera, index, size);
      },
    );
  }

  Widget _buildCameraView(BuildContext context, CameraEntity camera, int index, Size size) {
    return Padding(
      padding: const EdgeInsets.all(AppConfig.MONITOR_GRID_SPACING),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => context.goNamed(
                Routes.cameraDetail.name,
                extra: CameraDetailScreenArgs(
                  data: camera,
                  onBack: () => AppRouter.rootNavigatorKey.currentContext?.goNamed(
                    Routes.custom_live_view.name,
                  ),
                ),
              ),
              child: MonitorPlayer(
                size: size,
                mode: MonitorMode.monitoring,
                name: camera.name,
                source: camera.subStreamUri.toString(),
                labelBuilder: (name) => Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width - 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Colors.white.withValues(alpha: 0.6)),
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
                            camera.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.mode == CustomMonitorPaneMode.edit)
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 20),
                onPressed: () => removeCamera(index),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  maximumSize: Size(20, 20),
                  minimumSize: Size(20, 20),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyCell(BuildContext context, int index, {bool isUpdating = false}) {
    return Container(
      color: AppColors.blackOrWhiteReverse,
      margin: EdgeInsets.all(AppConfig.MONITOR_GRID_SPACING),
      child: isUpdating
          ? Center(child: CircularProgressIndicator.adaptive())
          : Material(
              borderRadius: BorderRadius.circular(4),
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: IgnorePointer(
                ignoring: widget.mode == CustomMonitorPaneMode.view,
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
            ),
    );
  }

  showCameraListPopup(BuildContext context, Offset position, int index) {
    final monitorBloc = MonitorBloc(context.read(), context.read(), context.read());

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
            left: min(position.dx, MediaQuery.widthOf(context) * (1600 - 281) / 1600),
            top: min(position.dy, MediaQuery.heightOf(context) * (900 - 515) / 900),
            child: Material(
              color: Colors.transparent,
              child: CameraListPopup(
                bloc: monitorBloc,
                onCameraSelected: (camera) {
                  // if (widget.mode != CustomMonitorPaneMode.view) {
                  bloc.add(AddingCameraToCustomView(camera, index));
                  // } else {
                  // final cv = customView!.copyWith();
                  // cv.positions[index] = LiveViewPosition(
                  //   // index: index,
                  // cameraId: camera.id,
                  // camera: camera,
                  // );
                  //
                  // // bloc.add(UpdateCustomView(customView: cv, index: index));
                  // }

                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  removeCamera(int index) {
    // if (widget.mode != CustomMonitorPaneMode.view) {
    bloc.add(RemovingCameraFromCustomView(index));
    // } else {
    //   final cv = customView!.copyWith();
    //   cv.positions[index] = LiveViewPosition(index: index, cameraId: [], camera: null);
    //   bloc.add(UpdateCustomView(customView: cv, index: index));
    // }
  }
}
