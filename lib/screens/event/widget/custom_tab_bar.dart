part of '../components/event_detail_dialog.dart';

class _CustomTabBar extends StatefulWidget {
  final TabController controller;

  const _CustomTabBar({required this.controller});

  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.greyAthens,
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getTab(icon: AppAssets.icImage, index: 0, title: 'Ảnh sự kiện'),
          _getTab(icon: AppAssets.icVideoOn, index: 1, title: 'Video ghi hình'),
        ],
      ),
    );
  }

  _getTab({required String icon, required int index, required String title}) {
    return Ink(
      child: InkWell(
        onTap: () => widget.controller.animateTo(index),
        borderRadius: BorderRadius.circular(4),
        hoverColor: widget.controller.index == index
            ? AppColors.secondary.withOpacity(0.9)
            : AppColors.greyF2F4FA.withOpacity(0.5),
        splashColor: widget.controller.index == index
            ? Colors.white.withOpacity(0.2)
            : AppColors.grey64748B.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: widget.controller.index == index ? AppColors.white : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              SvgPicture.asset(
                icon,
                color: widget.controller.index == index
                    ? AppColors.blue005EB8
                    : AppColors.blue64748B,
                height: 20,
              ),
              Text(
                title,
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: widget.controller.index == index
                      ? AppColors.blue005EB8
                      : AppColors.blue64748B,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
