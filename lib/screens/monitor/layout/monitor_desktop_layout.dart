import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

import '../../shared/panel.dart';
import '../components/monitor_actions.dart';

class MonitorDesktopLayout extends StatefulWidget {
  const MonitorDesktopLayout({
    super.key,
    required this.content,
    this.leftPanelWidth = 281,
    this.rightPanelWidth = 280,
  });
  final Widget content;
  final double leftPanelWidth;
  final double rightPanelWidth;

  @override
  State<MonitorDesktopLayout> createState() => _MonitorDesktopLayoutState();
}

class _MonitorDesktopLayoutState extends State<MonitorDesktopLayout> {
  late final PanelController _leftController = PanelController();
  late final PanelController _rightController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
          final appBloc = context.read<AppBloc>();
          if (appBloc.state.displayFullScreenLiveView) {
            appBloc.add(ToggleMonitorDisplayMode());
            defaultExitNativeFullscreen();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: BlocSelector<AppBloc, AppState, bool>(
        selector: (state) => state.displayFullScreenLiveView,
        builder: (BuildContext context, shouldDisplayFullScreen) {
          return Column(
            children: <Widget>[
              Visibility(
                visible: !shouldDisplayFullScreen,
                child: MonitorActions(
                  leftController: _leftController,
                  rightController: _rightController,
                ),
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
                      child: !shouldDisplayFullScreen
                          ? Container(
                              color: AppColors.greyF2F4FA,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: widget.content,
                              ),
                            )
                          : widget.content,
                    ),
                    Panel(expandedWidth: widget.rightPanelWidth, controller: _rightController),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
