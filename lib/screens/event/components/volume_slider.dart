import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

class VolumeSlider extends StatefulWidget {
  final Function(double)? onVolumeChanged;

  const VolumeSlider({super.key, this.onVolumeChanged});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  bool showSlider = false;
  double volume = 300;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => setState(() => showSlider = true),
      onExit: (event) => setState(() => showSlider = false),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (volume > 0) {
                    volume = 0;
                  } else {
                    volume = AppConfig.PLAYER_MAX_VOLUME_PERCENT;
                  }
                });
                widget.onVolumeChanged?.call(volume / AppConfig.PLAYER_MAX_VOLUME_PERCENT);
              },
              child: SvgPicture.asset(
                height: 28,
                volume == AppConfig.PLAYER_MAX_VOLUME_PERCENT
                    ? AppAssets.icVolumeFull
                    : volume == 0
                    ? AppAssets.icVolumeMuted
                    : AppAssets.icVolumeHalf,
                width: 28,
              ),
            ),
            if (showSlider) SizedBox(width: 8),
            AnimatedContainer(
              duration: Durations.short4,
              width: showSlider ? 88 : 0,
              child: showSlider
                  ? SizedBox(
                      height: 10,
                      width: double.infinity,
                      child: SliderTheme(
                        data: SliderTheme.of(
                          context,
                        ).copyWith(thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6)),
                        child: Slider(
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          max: AppConfig.PLAYER_MAX_VOLUME_PERCENT,
                          min: 0,
                          onChanged: (value) {
                            setState(() => volume = value);
                            widget.onVolumeChanged?.call(
                              value / AppConfig.PLAYER_MAX_VOLUME_PERCENT,
                            );
                          },
                          padding: EdgeInsets.zero,
                          value: volume,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
