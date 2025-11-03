import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';

import '../monitor/bloc/monitor/monitor_bloc.dart';
import '../shared/state_builder_mixin.dart';

class PlaybackScreen extends StatefulWidget {
  const PlaybackScreen({super.key});

  @override
  State<PlaybackScreen> createState() => _PlaybackScreenState();
}

class _PlaybackScreenState extends State<PlaybackScreen> with StateBuilderMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: BlocBuilder<MonitorBloc, MonitorState>(
        builder: (context, state) => stateBuilder<MonitorSuccess>(
          state,
          child: (state) => ListView.builder(
            itemCount: state.cameras.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => context.pushNamed(
                Routes.cameraDetail.name,
                extra: CameraDetailScreenArgs(
                  data: state.cameras[index],
                  isPlayback: true,
                  title: 'Playback ${state.cameras[index].name}',
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
                child: Text(state.cameras[index].name),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
