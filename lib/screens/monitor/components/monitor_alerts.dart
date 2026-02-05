import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/alert_filter_btn.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/custom_tab_bar.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/event_item.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  'Danh sách Cảnh báo',
                  style: AppTypography.style(14, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                // const AlertFilterBtn(),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.greyAthens,
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(4),
            child: CustomTabBar(controller: tabController),
          ),
          SizedBox(height: 1, child: const Divider(color: AppColors.greyDFDFDF)),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const EventItem(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
