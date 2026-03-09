import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';

class ControlVolume extends StatefulWidget {
  const ControlVolume({super.key, required this.disabled});
  final bool disabled;

  @override
  State<ControlVolume> createState() => _ControlVolumeState();
}

class _ControlVolumeState extends State<ControlVolume> {
  bool showSlider = false;
  bool isMuted = false;

  double _volumeBeforeMuted = 0;

  void _wrapper(VoidCallback callback) {
    if (widget.disabled) return;
    callback.call();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => _wrapper(() => setState(() => showSlider = true)),
      onExit: (event) => _wrapper(() => setState(() => showSlider = false)),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocSelector<CameraDetailBloc, CameraDetailState, double>(
          selector: (state) => state.volume,
          builder: (context, volume) {
            return Row(
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: widget.disabled
                      ? null
                      : () => _wrapper(() {
                          isMuted = !isMuted;
                          if (isMuted) _volumeBeforeMuted = volume;
                          context.read<CameraDetailBloc>().add(
                            ChangeVolume(isMuted ? 0 : _volumeBeforeMuted),
                          );
                        }),
                  child: SvgPicture.asset(
                    volume == AppConfig.PLAYER_MAX_VOLUME_PERCENT
                        ? AppAssets.icVolumeFull
                        : volume == 0
                        ? AppAssets.icVolumeMuted
                        : AppAssets.icVolumeHalf,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(
                      widget.disabled ? AppColors.grey64748B : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ).let(
                  (it) => widget.disabled
                      ? it
                      : Tooltip(
                          textStyle: AppTypography.style(
                            12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                          message: isMuted ? 'Bật tiếng' : 'Tắt tiếng',
                          child: it,
                        ),
                ),

                if (showSlider) SizedBox(width: 8),
                AnimatedContainer(
                  duration: Durations.short4,
                  width: showSlider ? 88 : 0,
                  child: showSlider
                      ? SizedBox(
                          width: double.infinity,
                          height: 10,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                              showValueIndicator: ShowValueIndicator.onDrag,
                              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                            ),
                            child: Slider(
                              allowedInteraction: SliderInteraction.tapAndSlide,
                              label: volume.toInt().toString(),
                              padding: EdgeInsets.zero,
                              min: 0,
                              max: AppConfig.PLAYER_MAX_VOLUME_PERCENT,
                              activeColor: Colors.black,
                              inactiveColor: Colors.grey,
                              value: volume,
                              onChanged: (value) {
                                context.read<CameraDetailBloc>().add(ChangeVolume(value));
                              },
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
