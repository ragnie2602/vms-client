import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/alert_filter_btn.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/custom_tab_bar.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/event_item.dart';

class MonitorAlerts extends StatefulWidget {
  static int initialIndex = 0;

  final SetupEventDisplayBloc sedBloc;
  final double maxWidth;

  const MonitorAlerts({super.key, required this.maxWidth, required this.sedBloc});

  @override
  State<MonitorAlerts> createState() => _MonitorAlertsState();
}

class _MonitorAlertsState extends State<MonitorAlerts> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: MonitorAlerts.initialIndex);
    tabController.addListener(_onTabChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateFilterWithCurrentCameras());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MonitorBloc, MonitorState>(
      listenWhen: (previous, current) {
        // Listen when page changes or cameras list changes
        if (previous is MonitorSuccess && current is MonitorSuccess) {
          return previous.page != current.page ||
              !listEquals(
                previous.paginatedCameras.map((c) => c.id).toList(),
                current.paginatedCameras.map((c) => c.id).toList(),
              );
        }
        return false;
      },
      listener: (context, state) {
        // Auto-update filter when page changes and on "Cam đang xem" tab
        if (tabController.index == 1) _updateFilterWithCurrentCameras();
      },
      child: LayoutBuilder(
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
                              style: AppTypography.style(14, fontWeight: FontWeight.w700),
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
                    SizedBox(height: 1, child: const Divider(color: AppColors.greyDFDFDF)),
                    Expanded(child: _buildEventList()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    tabController.removeListener(_onTabChanged);
    tabController.dispose();
    super.dispose();
  }

  // WIDGETS
  Widget _buildEventList() {
    return BlocSelector<DetectBloc, DetectState, (List<ReceiveEventEntity>, bool, bool)>(
      selector: (state) => (
        state.shouldShowSelectedEvents ? state.selectedEvents : state.receiveEvents,
        state.shouldShowSelectedEvents,
        state.hasReachedMaxEvents,
      ),
      builder: (context, data) {
        final events = data.$1;
        final hasReachedMax = data.$3;

        if (events.isEmpty) {
          return Center(
            child: Text(
              'Chưa có dữ liệu phù hợp',
              style: AppTypography.style(14, color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    EventLiveViewItem(event: events[index], sedBloc: widget.sedBloc),
                itemCount: events.length,
                padding: EdgeInsets.zero,
              ),
            ),
            if (hasReachedMax) ...[
              const Divider(height: 1, color: AppColors.greyF2F2F2),
              InkWell(
                onTap: () {
                  final eventsTab = HomeTab.tabs.firstWhereOrNull(
                    (tab) => tab.route == Routes.events,
                  );
                  if (eventsTab == null) return;
                  // chuyển tab
                  context.read<HomeBloc>().add(ChangeTab(eventsTab));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Center(
                    child: Text(
                      'Xem tất cả',
                      style: AppTypography.style(
                        14,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  // FUNCTIONS
  void _onTabChanged() {
    if (tabController.indexIsChanging) return;
    _updateFilterWithCurrentCameras();
  }

  void _updateFilterWithCurrentCameras() {
    final monitorState = context.read<MonitorBloc>().state;
    List<List<int>>? viewingCameraIds;

    if (monitorState is MonitorSuccess) {
      if (tabController.index == 0) {
        viewingCameraIds = monitorState.allCameras.map((c) => c.id).toList();
      } else if (tabController.index == 1) {
        viewingCameraIds = monitorState.paginatedCameras.map((c) => c.id).toList();
      }
    }

    context.read<DetectBloc>().add(
      UpdateTabIndex(tabController.index, viewingCameraIds: viewingCameraIds),
    );
  }
}
