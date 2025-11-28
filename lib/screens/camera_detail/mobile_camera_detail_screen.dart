import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/camera_detail/camera_detail_bloc.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/shared/player/monitor_player.dart';
import 'package:vms_flutter_client/screens/shared/player/player_controller.dart';

class MobileCameraDetailScreen extends StatefulWidget {
  final CameraDetailScreenArgs args;

  const MobileCameraDetailScreen({super.key, required this.args});

  @override
  State<MobileCameraDetailScreen> createState() => _MobileCameraDetailScreenState();
}

class _MobileCameraDetailScreenState extends State<MobileCameraDetailScreen> {
  late final CameraDetailBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CameraDetailBloc(mode: CameraDetailMode.live, camera: widget.args.data);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final path = await thumbnail();

        if (context.mounted) context.pop(path);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () async {
              final path = await thumbnail();

              // ignore: use_build_context_synchronously
              context.pop(path);
            },
            icon: Icon(Icons.chevron_left),
          ),
          scrolledUnderElevation: 0,
          title: Text('${widget.args.data?.name}', style: AppTypography.style(15, fontWeight: FontWeight.w600)),
          titleSpacing: 0,
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BlocBuilder<CameraDetailBloc, CameraDetailState>(
                bloc: bloc,
                builder: (context, state) {
                  return MonitorPlayer(
                    enableZoom: true,
                    mode: MonitorMode.liveview,
                    source: state.stream?.urlOfStream ?? state.camera!.mainStreamUri.toString(),
                    name: state.camera!.name,
                    controller: state.playerController,
                    labelBuilder: (name) => Container(),
                    onStatusChanged: (status) {
                      context.read<CameraDetailBloc>().add(ChangePlayerStatus(status));
                    },
                    onInitializedValues: ({required double volume, required double speed}) {
                      context.read<CameraDetailBloc>().add(ChangeVolume(volume));
                      context.read<CameraDetailBloc>().add(ChangeSpeed(speed));
                      context.read<CameraDetailBloc>().add(OnRecording(cancelStatus: 0));
                    },
                    onLostConnection: () {
                      final bloc = context.read<CameraDetailBloc>();
                      if (bloc.state.recordingStatus != 0) bloc.add(OnRecording(cancelStatus: -1));
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppAssets.icPauseMobile),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () => thumbnail(),
                    icon: SvgPicture.asset(AppAssets.icCamera01),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppAssets.icVolume),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppAssets.icFullAltRight),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                ),
              ],
            ),
            const Divider(color: AppColors.greyE5E5E5, height: 1),
          ],
        ),
      ),
    );
  }

  Future<String?> thumbnail() async {
    final path = '${(await getTemporaryDirectory()).path}/${widget.args.data?.camId}';
    await bloc.state.playerController.snapshot?.call(path);

    return path;
  }
}
