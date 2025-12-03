// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';

import '../../shared/player/player_controller.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../widgets/mobile_control_speed.dart';

class MobilePlayerControls extends StatefulWidget {
  const MobilePlayerControls({super.key});

  @override
  State<MobilePlayerControls> createState() => _MobilePlayerControlsState();
}

class _MobilePlayerControlsState extends State<MobilePlayerControls> {
  PlayerController? get controller => context.read<CameraDetailBloc>().state.playerController;

  Future<void> _takeSnapshot() async {
    if (controller?.isInitialized?.call() != true) return;

    bool granted = await Gal.hasAccess();
    if (!granted) granted = await Gal.requestAccess();
    if (!granted) return;

    final tempPath = Directory.systemTemp.path.joinPath(
      '${context.read<CameraDetailBloc>().state.camera?.name ?? 'camera'}_${DateTime.now().format("yyyyMMdd_HHmmss")}.jpg',
    );
    final res = await controller?.snapshot?.call(tempPath);
    if (res == true) {
      await Gal.putImage(tempPath);
      File(tempPath).delete();

      // TODO: Cập nhập kiểu thông báo theo figma
      ToastUtil.toastSuccess(
        title: Text(
          "Đã chụp hình",
          style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
        ),
      );
    }
  }

  double _volumeBeforeMuted = 0;
  void _toggleMute() {
    final isMuted = context.read<CameraDetailBloc>().state.volume <= 0;

    if (isMuted) {
      context.read<CameraDetailBloc>().add(
        ChangeVolume(_volumeBeforeMuted <= 0 ? 1 : _volumeBeforeMuted),
      );
    } else {
      _volumeBeforeMuted = context.read<CameraDetailBloc>().state.volume;
      context.read<CameraDetailBloc>().add(ChangeVolume(0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            /* Play/Pause */
            BlocSelector<CameraDetailBloc, CameraDetailState, PlayerStatus>(
              selector: (state) => state.status,
              builder: (context, status) => _controlItem(
                status == PlayerStatus.playing ? AppAssets.icPauseMobile : AppAssets.icPlayMobile,
                () => controller?.togglePlay?.call(),
              ),
            ),

            /* Speed */
            BlocSelector<CameraDetailBloc, CameraDetailState, double>(
              selector: (state) => state.speed,
              builder: (context, speed) => Expanded(
                child: MobileControlSpeed(
                  speed: speed,
                  onSpeedChanged: (spd) => context.read<CameraDetailBloc>().add(ChangeSpeed(spd)),
                ),
              ),
            ),

            /* Screenshot */
            _controlItem(AppAssets.icCamera01, _takeSnapshot),

            /* Volume */
            BlocSelector<CameraDetailBloc, CameraDetailState, double>(
              selector: (state) => state.volume,
              builder: (context, volume) => _controlItem(
                volume == 0 ? AppAssets.icVolumeMuted : AppAssets.icVolume,
                _toggleMute,
              ),
            ),

            /* Fullscreen */
            _controlItem(AppAssets.icFullAltRight, () => controller?.toggleFullscreen?.call()),
          ],
        ),
      ),
    );
  }

  Widget _controlItem(String icon, VoidCallback onTap, {bool disabled = false, Widget? child}) {
    return Expanded(
      child: InkWell(
        onTap: disabled ? null : onTap,
        child: Center(
          child:
              child ??
              SvgPicture.asset(
                icon,
                width: 28,
                height: 28,
                colorFilter: disabled
                    ? ColorFilter.mode(AppColors.grey64748B, BlendMode.srcIn)
                    : null,
              ),
        ),
      ),
    );
  }
}
