import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../../shared/panel.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../components/camera_detail_actions.dart';
import '../components/player_controls.dart';
import '../components/player_timeline.dart';

class CameraDetailDesktopLayout extends StatefulWidget {
  const CameraDetailDesktopLayout({
    super.key,
    required this.content,
    this.leftPanelWidth = 281,
    this.rightPanelWidth = 280,
    required this.mode,
    this.openCamerasPanelImmediately = false,
  });
  final Widget? content;
  final double leftPanelWidth;
  final double rightPanelWidth;
  final CameraDetailMode mode;
  final bool openCamerasPanelImmediately;

  @override
  State<CameraDetailDesktopLayout> createState() => _CameraDetailDesktopLayoutState();
}

class _CameraDetailDesktopLayoutState extends State<CameraDetailDesktopLayout> {
  late final PanelController _leftController = PanelController();
  late final PanelController _rightController = PanelController();

  @override
  void didUpdateWidget(covariant CameraDetailDesktopLayout oldWidget) {
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
        CameraDetailActions(
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
              Panel(
                expandedWidth: widget.leftPanelWidth,
                controller: _leftController,
                icCloseOnContent: false,
              ),
              Expanded(
                child: widget.content == null
                    ? Container(
                        color: Colors.black,
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          "Vui lòng chọn Camera từ danh sách để xem lại.",
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Expanded(child: widget.content!),
                            if (widget.mode == CameraDetailMode.playback)
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
              Panel(
                expandedWidth: widget.rightPanelWidth,
                controller: _rightController,
                icCloseOnContent: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
