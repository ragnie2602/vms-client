import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/alert_filter_btn.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/custom_tab_bar.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/event_item.dart';

class MonitorAlerts extends StatefulWidget {
  const MonitorAlerts({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<MonitorAlerts> createState() => _MonitorAlertsState();
}

class _MonitorAlertsState extends State<MonitorAlerts>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRect(
          child: OverflowBox(
            alignment: Alignment.topLeft,
            minWidth: widget.maxWidth - 20,
            maxWidth: widget.maxWidth - 20,
            minHeight: constraints.maxHeight,
            maxHeight: constraints.maxHeight,
            child: Container(
              width: widget.maxWidth - 20,
              height: constraints.maxHeight,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Danh sách Cảnh báo',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const AlertFilterBtn(),
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
                  SizedBox(
                    height: 1,
                    child: const Divider(color: AppColors.greyDFDFDF),
                  ),
                  Expanded(
                    child:
                        BlocSelector<
                          DetectBloc,
                          DetectState,
                          List<ReceiveEventEntity>
                        >(
                          selector: (state) => state.receiveEvents,
                          builder: (context, receiveEvents) {
                            if (receiveEvents.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final event = receiveEvents[index];
                                return EventItem(event: event);
                              },
                              itemCount: receiveEvents.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    height: 1,
                                    color: AppColors.greyF2F2F2,
                                  ),
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
