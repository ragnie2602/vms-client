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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => setState(() => showSlider = true),
      onExit: (event) => setState(() => showSlider = false),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocSelector<CameraLiveBloc, CameraLiveState, double>(
          selector: (state) => state.volume,
          builder: (context, volume) {
            return Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    isMuted = !isMuted;
                    context.read<CameraLiveBloc>().add(ChangeVolume(volume, mute: isMuted));
                  },
                  child: SvgPicture.asset(AppAssets.icVolume, width: 28, height: 28),
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
