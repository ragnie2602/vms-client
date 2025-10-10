import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.onToggle, required this.isExpanded});

  final VoidCallback onToggle;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfig.APP_BAR_HEIGHT,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(child: SvgPicture.asset(isExpanded ? AppAssets.logoFull : AppAssets.logoOnly)),
          InkWell(
            onTap: onToggle,
            child: SvgPicture.asset(
              isExpanded ? AppAssets.icArrowSquareLeft : AppAssets.icArrowSquareRight,
            ),
          ),
        ],
      ),
    );
  }
}
