import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

class VolumeWithSlide extends StatefulWidget {
  const VolumeWithSlide({super.key});

  @override
  State<VolumeWithSlide> createState() => _VolumeWithSlideState();
}

class _VolumeWithSlideState extends State<VolumeWithSlide> {
  bool showSlider = false;
  double volume = 50;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => setState(() => showSlider = true),
      onExit: (event) => setState(() => showSlider = false),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(AppAssets.icVolume, width: 28, height: 28),

            if (showSlider) SizedBox(width: 8),
            AnimatedContainer(
              duration: Durations.short4,
              width: showSlider ? 88 : 0,
              child: showSlider
                  ? StatefulBuilder(
                      builder: (context, setState) {
                        return SizedBox(
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
                              // divisions: 10,
                              activeColor: Colors.black,
                              inactiveColor: Colors.grey,
                              value: volume,
                              onChanged: (value) => setState(() => volume = value),
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
