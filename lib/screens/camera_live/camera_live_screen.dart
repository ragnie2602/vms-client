import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../monitor/widgets/camera_player.dart';
import 'components/player_controls.dart';
import 'components/player_timeline.dart';

class CameraLiveScreenArgs {
  final CameraEntity data;
  final Routes? previous;
  CameraLiveScreenArgs({required this.data, this.previous});
}

class CameraLiveScreen extends StatefulWidget {
  CameraLiveScreen({super.key, required CameraLiveScreenArgs args})
    : data = args.data,
      previous = args.previous;

  final CameraEntity data;
  final Routes? previous;

  @override
  State<CameraLiveScreen> createState() => _CameraLiveScreenState();
}

class _CameraLiveScreenState extends State<CameraLiveScreen> {
  late final _ref = GlobalKey<CameraPlayerState>();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
              width: MediaQuery.of(context).size.width * 0.7,
              child: CameraPlayer(key: _ref, data: widget.data, isSubStream: false),
            ),
          ),

          /* Timeline - padding right & left để hiển thị được vạch đầu/cuối cùng */
          Padding(
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: PlayerTimeline(
              startDate: DateUtil.startOfDay,
              endDate: DateUtil.startOfTomorrow,
            ),
          ),

          /* Controls */
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: PlayerControls(ref: _ref),
          ),
        ],
      ),
    );
  }
}
