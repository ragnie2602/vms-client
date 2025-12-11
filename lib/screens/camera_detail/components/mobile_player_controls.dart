import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';

import '../../shared/player/player_controller.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../widgets/mobile_control_speed.dart';

class MobilePlayerControls extends StatelessWidget {
  const MobilePlayerControls({super.key});

  PlayerController? controller(BuildContext context) =>
      context.read<CameraDetailBloc>().state.playerController;

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
                () {
                  if (controller(context)?.getPlayerState?.call() == PlayerState.initialized) {
                    controller(context)?.togglePlay?.call();
                  }
                },
              ),
            ),

            /* Speed */
            BlocSelector<CameraDetailBloc, CameraDetailState, double>(
              selector: (state) => state.speed,
              builder: (context, speed) => Expanded(
                child: MobileControlSpeed(
                  speed: speed,
                  canChangeSpeed: () =>
                      controller(context)?.getPlayerState?.call() == PlayerState.initialized,
                  onSpeedChanged: (spd) => context.read<CameraDetailBloc>().add(ChangeSpeed(spd)),
                ),
              ),
            ),

            /* Screenshot */
            _controlItem(
              AppAssets.icCamera01,
              () => context.read<CameraDetailBloc>().add(
                TakeSnapshot(
                  onSuccess: () => ToastUtil.toastSuccess(
                    title: Text(
                      "Đã lưu ảnh chụp",
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /* Volume */
            BlocSelector<CameraDetailBloc, CameraDetailState, double>(
              selector: (state) => state.volume,
              builder: (context, volume) => _controlItem(
                volume == 0 ? AppAssets.icVolumeMuted : AppAssets.icVolume,
                () => context.read<CameraDetailBloc>().add(ToggleMute()),
              ),
            ),

            /* Fullscreen */
            _controlItem(
              AppAssets.icFullAltRight,
              () => controller(context)?.toggleFullscreen?.call(),
            ),
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
