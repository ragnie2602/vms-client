import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/playback/widgets/menu_select_date_playback.dart';
import 'package:vms_flutter_client/screens/shared/action_item.dart';

class MultiPlaybackScreen extends StatelessWidget {
  const MultiPlaybackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // thanh menu: date + back
          _MenuAction(),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.scaffoldBg,
          ),
          // gridview camera
          Flexible(child: GridviewPlaybackView()),
        ],
      ),
    );
  }
}

class _MenuAction extends StatelessWidget {
  const _MenuAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.contentBg,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuSelectDatePlayback(),
          ActionItem(
            title: 'Xem từng camera',
            icon: AppAssets.icMenu,
            isSelected: false,
            onTap: () {
              Navigator.pop(context);
              // context.pushNamed(Routes.multi_playback.name);
            },
          ),
        ],
      ),
    );
  }
}

class GridviewPlaybackView extends StatelessWidget {
  const GridviewPlaybackView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 5;
        const double padding = 100;
        final double availableWidth = constraints.maxWidth - (padding * 2);
        final double availableHeight = constraints.maxHeight - 20;

        final double itemWidth = (availableWidth - spacing) / 2;
        final double itemHeight = (availableHeight - spacing) / 2;

        final double aspectRatio = itemWidth / itemHeight;

        return Container(
          padding: EdgeInsets.only(left: padding, right: padding, top: 20),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: AppColors.white,
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.icAddCam,
                    colorFilter: ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class MultiPlaybackTimeline extends StatelessWidget {
  const MultiPlaybackTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
