import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

import '../bloc/camera_live/camera_live_bloc.dart';

class VolumeWithSlide extends StatefulWidget {
  const VolumeWithSlide({super.key});

  @override
  State<VolumeWithSlide> createState() => _VolumeWithSlideState();
}

class _VolumeWithSlideState extends State<VolumeWithSlide> {
  bool showSlider = false;
  bool isMuted = false;

  double _volumeBeforeMuted = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => setState(() => showSlider = true),
      onExit: (event) => setState(() => showSlider = false),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocSelector<CameraLiveBloc, CameraLiveState, double>(
          selector: (state) => state.volume,
          builder: (context, volume) {
            return Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    isMuted = !isMuted;
                    if (isMuted) _volumeBeforeMuted = volume;
                    context.read<CameraLiveBloc>().add(
                      ChangeVolume(isMuted ? 0 : _volumeBeforeMuted),
                    );
                  },
                  child: SvgPicture.asset(
                    volume == 100
                        ? AppAssets.icVolumeFull
                        : volume == 0
                        ? AppAssets.icVolumeMuted
                        : AppAssets.icVolumeHalf,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
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
                            ),
                            child: Slider(
                              padding: EdgeInsets.zero,
                              min: 0,
                              max: 100,
                              activeColor: Colors.black,
                              inactiveColor: Colors.grey,
                              value: volume,
                              onChanged: (value) {
                                context.read<CameraLiveBloc>().add(ChangeVolume(value));
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
