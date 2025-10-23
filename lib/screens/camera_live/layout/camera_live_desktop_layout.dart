import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

import '../../shared/panel.dart';
import '../bloc/camera_live/camera_live_bloc.dart';
import '../components/live_view_actions.dart';
import '../components/player_controls.dart';
import '../components/player_timeline.dart';

class CameraLiveDesktopLayout extends StatefulWidget {
  const CameraLiveDesktopLayout({
    super.key,
    required this.content,
    this.leftPanelWidth = 281,
    this.rightPanelWidth = 280,
    required this.mode,
    this.openCamerasPanelImmediately = false,
  });
  final Widget content;
  final double leftPanelWidth;
  final double rightPanelWidth;
  final LiveViewMode mode;
  final bool openCamerasPanelImmediately;

  @override
  State<CameraLiveDesktopLayout> createState() => _CameraLiveDesktopLayoutState();
}

class _CameraLiveDesktopLayoutState extends State<CameraLiveDesktopLayout> {
  late final PanelController _leftController = PanelController();
  late final PanelController _rightController = PanelController();

  @override
  void didUpdateWidget(covariant CameraLiveDesktopLayout oldWidget) {
    if (oldWidget.mode != widget.mode) {
      _leftController.closePanel();
      _rightController.closePanel();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LiveViewActions(
          leftController: _leftController,
          rightController: _rightController,
          mode: widget.mode,
          openCamerasPanelImmediately: widget.openCamerasPanelImmediately,
        ),
        Container(width: double.infinity, height: 1, color: AppColors.scaffoldBg),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Panel(expandedWidth: widget.leftPanelWidth, controller: _leftController),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Expanded(child: widget.content),
                      if (widget.mode == LiveViewMode.playback)
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: PlayerTimeline(
                            size: Size(double.infinity, 60),
                            normalStyle: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                            highlightStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                            playbackColor: Color.fromRGBO(21, 171, 255, 0.4),
                            centralLineColor: Color.fromRGBO(33, 204, 195, 1),
                          ),
                        ),
                      PlayerControls(mode: widget.mode),
                    ],
                  ),
                ),
              ),

              Panel(expandedWidth: widget.rightPanelWidth, controller: _rightController),
            ],
          ),
        ),
      ],
    );
  }
}
