import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

import '../../monitor/widgets/camera_player.dart';

class PlayerControls extends StatelessWidget {
  final GlobalKey<CameraPlayerState> ref;

  const PlayerControls({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.contentBg,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            spreadRadius: 2,
            blurRadius: 30,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icPauseCircle),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icRecord),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icCamera),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icVolume),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icStream),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icZoomIn),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icZoomOut),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: SvgPicture.asset(AppAssets.icFullscreen),
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Color(0xFFF8F9FE))),
                ),
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(AppAssets.icSort),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
