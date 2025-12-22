import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class MonitorAlerts extends StatefulWidget {
  const MonitorAlerts({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<MonitorAlerts> createState() => _MonitorAlertsState();
}

class _MonitorAlertsState extends State<MonitorAlerts> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyFBFBFB,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.greyDFDFDF)),
            ),
            child: _CustomTabBar(controller: tabController),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) => _EventItem(), itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class _EventItem extends StatefulWidget {
  @override
  State<_EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<_EventItem> {
  bool hasRead = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hasRead ? AppColors.white : AppColors.greyF2F4FA.withOpacity(0.5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showDetailDialog(context),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 72,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.network(
                            'https://assets.nintendo.com/image/upload/q_auto/f_auto/store/software/switch2/70010000105851/8787627be7f26ae7984456ffd9af17bea845032cebbf59fe6eeb596dea6bb20e',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 4,
                        child: SvgPicture.asset(AppAssets.icAlertIntrution, height: 19),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 198,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phát hiện xâm nhập',
                        style: AppTypography.style(12, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      CustomTable(
                        columnSpacing: 10,
                        data: CustomTableData(
                          columnFlexes: [0, 1],
                          data: [
                            [
                              SvgPicture.asset(AppAssets.icTimeCircle, height: 18),
                              Text(
                                '20:30 20/12/2025',
                                style: AppTypography.style(12, fontWeight: FontWeight.w500),
                              ),
                            ],
                            [
                              SvgPicture.asset(AppAssets.icVideoOn, height: 18),
                              Text(
                                'Camera cổng 1',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.style(12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ],
                        ),
                        rowSpacing: 2,
                        verticalAlignments: [CrossAxisAlignment.center, CrossAxisAlignment.center],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDetailDialog(BuildContext context) {
    setState(() => hasRead = true);
    showDialog(context: context, builder: (context) => EventDetailDialog());
  }
}

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
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Ink(
          child: InkWell(
            onTap: () => widget.controller.animateTo(0),
            hoverColor: widget.controller.index == 0
                ? AppColors.secondary.withOpacity(0.9)
                : AppColors.greyF2F4FA.withOpacity(0.5),
            splashColor: widget.controller.index == 0
                ? Colors.white.withOpacity(0.2)
                : AppColors.grey64748B.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                border: widget.controller.index == 0
                    ? Border(bottom: BorderSide(color: AppColors.secondary, width: 2))
                    : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tất cả',
                    style: AppTypography.style(
                      14,
                      color: widget.controller.index == 0
                          ? AppColors.secondary
                          : AppColors.grey64748B,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Ink(
          child: InkWell(
            onTap: () => widget.controller.animateTo(1),
            hoverColor: widget.controller.index == 1
                ? AppColors.secondary.withOpacity(0.9)
                : AppColors.greyF2F4FA.withOpacity(0.5),
            splashColor: widget.controller.index == 1
                ? Colors.white.withOpacity(0.2)
                : AppColors.grey64748B.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                border: widget.controller.index == 1
                    ? Border(bottom: BorderSide(color: AppColors.secondary, width: 2))
                    : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Cam đang xem',
                    style: AppTypography.style(
                      14,
                      color: widget.controller.index == 1
                          ? AppColors.secondary
                          : AppColors.grey64748B,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
