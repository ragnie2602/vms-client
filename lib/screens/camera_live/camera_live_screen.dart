import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../monitor/widgets/camera_player.dart';
import 'bloc/playback_bloc.dart';
import 'components/player_controls.dart';
import 'components/player_timeline.dart';

class CameraLiveScreenArgs extends BaseScreenArgs {
  final CameraEntity data;
  final bool isPlayback;

  CameraLiveScreenArgs({required this.data, this.isPlayback = false, super.onBack})
    : super(title: data.name, );
}

class CameraLiveScreen extends StatefulWidget {
  CameraLiveScreen({super.key, required CameraLiveScreenArgs args})
    : data = args.data,
      isPlayback = args.isPlayback;

  final CameraEntity data;
  final bool isPlayback;

  @override
  State<CameraLiveScreen> createState() => _CameraLiveScreenState();
}

class _CameraLiveScreenState extends State<CameraLiveScreen> {
  late final _ref = GlobalKey<CameraPlayerState>();

  @override
  void initState() {
    super.initState();
    if (widget.isPlayback) {
      context.read<PlaybackBloc>().add(GetVideoPlaybacks(widget.data.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaybackBloc(context.read()),
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFF8F9FE)),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          children: [
            Expanded(
              child: CameraPlayer(
                key: _ref,
                data: widget.data,
                isSubStream: false,
                borderRadius: 10,
                builder: (context, playerWidget, data) => widget.isPlayback
                    ? Stack(
                        children: [
                          playerWidget,

                          /* Timeline - padding right & left để hiển thị được vạch đầu/cuối cùng */
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: PlayerTimeline(
                              startDate: DateUtil.startOfDay,
                              endDate: DateUtil.startOfTomorrow,
                              majorTickHeight: 69,
                            ),
                          ),
                        ],
                      )
                    : playerWidget,
              ),
            ),

            /* Controls */
            SizedBox(height: 15),
            Center(child: PlayerControls(ref: _ref)),
          ],
        ),
      ),
    );
  }
}
