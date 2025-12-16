import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/playback/widgets/multi_player_controls.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/playback/widgets/gridview_playback_view.dart';
import 'package:vms_flutter_client/screens/playback/widgets/menu_select_date_playback.dart';
import 'package:vms_flutter_client/screens/playback/widgets/multi_playback_timeshift_widget.dart';
import 'package:vms_flutter_client/screens/shared/action_item.dart';

class MultiPlaybackScreen extends StatefulWidget {
  const MultiPlaybackScreen({super.key});

  @override
  State<MultiPlaybackScreen> createState() => _MultiPlaybackScreenState();
}

class _MultiPlaybackScreenState extends State<MultiPlaybackScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MultiPlaybackBloc(
        cameraRepository: context.read(),
        playbackRepository: context.read(),
      )..add(InitEvent()),
      child: Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.escape) {
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
          builder: (context, isFullscreen) => Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child:
                BlocSelector<
                  MultiPlaybackBloc,
                  MultiPlaybackState,
                  MultiPlaybackStatus
                >(
                  selector: (state) => state.multiPlaybackStatus,
                  builder: (context, multiPlaybackStatus) => Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // thanh menu: date + back
                          if (!isFullscreen) _MenuAction(),
                          if (!isFullscreen)
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.scaffoldBg,
                            ),
                          // gridview camera
                          Flexible(
                            child: GridviewPlaybackView(
                              isOpenFullscreen: isFullscreen,
                            ),
                          ),
                          // time shift
                          if (!isFullscreen)
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 100,
                                vertical: 10,
                              ),
                              child: MultiPlaybackTimeshiftWidget(
                                timer: context
                                    .read<MultiPlaybackBloc>()
                                    .timeGlobal,
                                size: Size(double.infinity, 55),
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
                                playbackColor: Color.fromRGBO(
                                  21,
                                  171,
                                  255,
                                  0.4,
                                ),
                                centralLineColor: Color.fromRGBO(
                                  33,
                                  204,
                                  195,
                                  1,
                                ),
                              ),
                            ),
                          // thanh điều khiển (pause, tua)
                          if (!isFullscreen) MultiPlayerControls(),
                        ],
                      ),
                      if (multiPlaybackStatus == MultiPlaybackStatus.loading)
                        Positioned.fill(
                          child: Container(
                            // khi đang loading (case lấy danh sách cam + case đổi ngày phải laoding lại list video)
                            color: Colors.transparent,
                            margin: EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 10,
                            ),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class _MenuAction extends StatelessWidget {
  const _MenuAction();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.contentBg,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuSelectDatePlayback(),
          ActionItem(
            title: 'Xem từng camera',
            icon: AppAssets.icMultiPlayback,
            isSelected: false,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
