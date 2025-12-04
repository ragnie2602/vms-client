import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    _initState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initState() {
    context.read<MultiPlaybackBloc>().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // thanh menu: date + back
          _MenuAction(),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.scaffoldBg,
          ),
          // gridview camera
          Flexible(
            child:
                BlocSelector<
                  MultiPlaybackBloc,
                  MultiPlaybackState,
                  MultiPlaybackStatus
                >(
                  selector: (state) => state.multiPlaybackStatus,
                  builder: (context, multiPlaybackStatus) => Stack(
                    children: [
                      GridviewPlaybackView(),
                      if (multiPlaybackStatus == MultiPlaybackStatus.loading)
                        Positioned.fill(
                          child: Container(
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
          // time shift
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 100,
              vertical: 10,
            ),
            child: MultiPlaybackTimeshiftWidget(
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
              playbackColor: Color.fromRGBO(21, 171, 255, 0.4),
              centralLineColor: Color.fromRGBO(33, 204, 195, 1),
            ),
          ),
          // thanh điều khiển (pause, tua)
          MultiPlayerControls(),
        ],
      ),
    );
  }
}

class _MenuAction extends StatelessWidget {
  const _MenuAction({super.key});

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
            icon: AppAssets.icMenu,
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
