import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toastification/toastification.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/event_constants.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/event/components/event_date_range_picker.dart';
import 'package:vms_flutter_client/screens/event/components/event_item.dart';
import 'package:vms_flutter_client/screens/event/components/event_multi_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/event/components/pagination_bar.dart';
import 'package:vms_flutter_client/screens/event/components/setup_info_field_dialog.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late final EventBloc eventBloc;
  late final MonitorBloc monitorBloc;
  late final SetupEventDisplayBloc setupInfoFieldBloc;

  GlobalKey<EventDateRangePickerState> dateRangeKey = GlobalKey<EventDateRangePickerState>();
  int? presetHour = 720;
  TextEditingController searchController = TextEditingController();

  List<String>? cameraIds;
  List<String>? eventType;
  DateTime startTime = DateTime.now().subtract(Duration(days: 30));
  DateTime endTime = DateTime.now();

  String cameraGroupName = 'Tất cả';
  List<CameraEntity> cameras = [];

  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      eventBloc = context.read<EventBloc>()..add(GetAllEventType());
      monitorBloc = MonitorBloc(context.read(), context.read(), context.read(), context.read())
        ..add(GetAllCamera());
      context.read<GroupCameraBloc>().add(GetAllGroupCameraEvent());
      setupInfoFieldBloc = SetupEventDisplayBloc(context.read(), context.read(), context.read());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 16,
              children: [
                Expanded(
                  flex: 269,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Tìm kiếm',
                        style: AppTypography.style(
                          13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide(color: AppColors.greyE2E8F0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide(color: AppColors.greyE2E8F0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide(color: AppColors.greyE2E8F0),
                          ),
                          hintText: 'Tìm kiếm tên đối tượng',
                          hintStyle: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey64748B,
                          ),
                          isDense: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: SvgPicture.asset(
                              AppAssets.icSearch,
                              color: AppColors.black,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(),
                        ),
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 230,
                  child: EventDateRangePicker(
                    key: dateRangeKey,
                    hintText: 'Từ ngày - đến ngày',
                    initialDateRange: DateTimeRange(start: startTime, end: endTime),
                    isDense: true,
                    label: 'Thời gian',
                    labelStyle: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    onChanged: (dateRange) => setState(() {
                      if (dateRange != null) {
                        startTime = dateRange.start.startOfDay;
                        endTime = dateRange.end.endOfDay;

                        presetHour = null;
                      }
                    }),
                    padding: EdgeInsets.only(bottom: 16, left: 16, right: 12, top: 16),
                    style: AppTypography.style(
                      14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      lineHeight: 17 / 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 200,
                  child: BlocBuilder<EventBloc, EventState>(
                    buildWhen: (previous, current) => current is GetAllEventTypeSuccess,
                    builder: (context, state) => EventMultiFilterDropdown<EventType>(
                      allMode: true,
                      isDense: true,
                      itemBuilder: (item) => Text(
                        item.name,
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      items: state is GetAllEventTypeSuccess ? state.eventTypes : [],
                      label: 'Sự kiện',
                      labelStyle: AppTypography.style(
                        13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      onChanged: (et) => eventType = et?.map((e) => e.eventKey).toList(),
                      padding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                Expanded(
                  flex: 200,
                  child: BlocBuilder<GroupCameraBloc, GroupCameraState>(
                    buildWhen: (previous, current) =>
                        current is GetAllGroupCameraSuccessState ||
                        current is GetAllGroupCameraFailState,
                    builder: (context, state) => EventFilterDropdown<DeviceGroup?>(
                      isDense: true,
                      itemBuilder: (item) => Text(
                        item?.name ?? 'Tất cả',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey64748B,
                        ),
                      ),
                      items: state is GetAllGroupCameraSuccessState
                          ? [null, ..._recursionDeviceGroup(state.groups ?? [])]
                          : [],
                      label: 'Nhóm camera',
                      labelStyle: AppTypography.style(
                        13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      onChanged: (value) {
                        if (value == null) {
                          cameraGroupName = 'Tất cả';
                          monitorBloc.add(GetAllCamera());
                        } else {
                          cameraGroupName = value.name;
                          monitorBloc.add(GetAllCameraInGroup(value.groupId));
                        }
                      },
                      padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey64748B,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 200,
                  child: BlocConsumer<MonitorBloc, MonitorState>(
                    bloc: monitorBloc,
                    builder: (context, state) {
                      if (state is MonitorSuccess) cameras = state.cameras;

                      return EventMultiFilterDropdown<CameraEntity>(
                        allMode: true,
                        isDense: true,
                        itemBuilder: (item) => Text(
                          item.name,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        items: state is MonitorSuccess ? state.cameras : [],
                        label: 'Tên camera',
                        labelStyle: AppTypography.style(
                          13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                        onChanged: (cams) => cameraIds = cams?.map((e) => e.camId).toList(),
                        padding: EdgeInsets.all(12),
                      );
                    },
                    listener: (context, state) {
                      if (state is MonitorSuccess && _isInitializing) {
                        _isInitializing = false;
                        cameras = state.cameras;
                        _onFilter();
                      }
                    },
                  ),
                ),
                EventCustomButton(
                  backgroundColor: AppColors.blue005AA9,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Tìm kiếm',
                  onPressed: () => _onFilter(page: 1),
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 12),
                  prefix: SvgPicture.asset(
                    AppAssets.icSearch,
                    color: AppColors.white,
                    height: 16,
                    width: 16,
                  ),
                  prefixGap: 8,
                  textStyle: AppTypography.style(
                    14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.white),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) {
                      void changePresetHour(int hour, {bool inHour = true}) {
                        startTime = DateTime.now().subtract(Duration(hours: hour));
                        if (inHour) startTime = startTime.startOfHour;

                        dateRangeKey.currentState?.changeDateRange(
                          DateTimeRange(start: startTime, end: DateTime.now()),
                        );
                        setState(() => presetHour = hour);
                        _onFilter(page: 1);
                      }

                      return Row(
                        children: [
                          presetTimeBtn(changePresetHour, 1, '1 giờ trước', inHour: false),
                          const SizedBox(width: 10),
                          presetTimeBtn(changePresetHour, DateTime.now().hour, 'Hôm nay'),
                          const SizedBox(width: 10),
                          presetTimeBtn(changePresetHour, 168, '7 ngày trước'),
                          const SizedBox(width: 10),
                          presetTimeBtn(changePresetHour, 720, '30 ngày trước'),
                          const Spacer(),
                          EventCustomButton(
                            borderColor: AppColors.greyE5E7EB,
                            borderRadius: 3,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: AppColors.black.withAlpha(13),
                                offset: const Offset(0, 1),
                              ),
                            ],
                            label: 'Làm mới',
                            onPressed: () => _onFilter(page: 1),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            prefix: SvgPicture.asset(AppAssets.icRefresh, height: 20),
                            prefixGap: 8,
                            textStyle: AppTypography.style(
                              14,
                              color: AppColors.blue374151,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          EventCustomButton(
                            borderColor: AppColors.greyE5E7EB,
                            borderRadius: 3,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: AppColors.black.withAlpha(13),
                                offset: const Offset(0, 1),
                              ),
                            ],
                            label: 'Tải về danh sách',
                            onPressed: () => eventBloc.add(
                              ExportEventList(
                                cameraIds: cameraIds,
                                cameraGroupName: cameraGroupName,
                                cameras: cameras,
                                endTime: endTime,
                                eventTypes: eventType,
                                startTime: startTime,
                                subjectName: searchController.text,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            prefix: SvgPicture.asset(AppAssets.icDownload2, height: 20),
                            prefixGap: 8,
                            textStyle: AppTypography.style(
                              14,
                              color: AppColors.blue374151,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          EventCustomButton(
                            backgroundColor: AppColors.greyF2F4F6,
                            borderColor: AppColors.greyE5E7EB,
                            borderRadius: 3,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: AppColors.black.withAlpha(13),
                                offset: const Offset(0, 1),
                              ),
                            ],
                            label: 'Cấu hình',
                            onPressed: _config,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            prefix: SvgPicture.asset(AppAssets.icConfigure, height: 20),
                            prefixGap: 8,
                            textStyle: AppTypography.style(
                              14,
                              color: AppColors.blue374151,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: AppColors.greyE2E8F0),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocListener<EventBloc, EventState>(
                      listener: (context, state) {
                        if (state is ExportEventLoading) {
                          Toastification().show(
                            context: context,
                            title: Text('Đang xuất file...'),
                            autoCloseDuration: const Duration(seconds: 3),
                            type: ToastificationType.info,
                          );
                        } else if (state is ExportEventSuccess) {
                          ToastUtil.toastSuccess(
                            context: context,
                            title: Text('Xuất file thành công ${state.fileName}'),
                          );
                        } else if (state is ExportEventFailure) {
                          ToastUtil.toastFail(context: context, title: Text(state.message));
                        }
                      },
                      child: BlocBuilder<EventBloc, EventState>(
                        buildWhen: (previous, current) =>
                            current is SearchEventSuccess ||
                            current is SearchEventFailure ||
                            current is SearchingEvent,
                        builder: (context, state) {
                          if (state is SearchingEvent) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is SearchEventFailure) {
                            return Center(child: Text(state.message));
                          } else if (state is SearchEventSuccess) {
                            if (state.events.isEmpty) {
                              return Center(child: Text('Không có dữ liệu'));
                            }
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: (state.events.length / 4).ceil(),
                                    itemBuilder: (context, rowIndex) {
                                      final int startIndex = rowIndex * 4;
                                      final int endIndex = min(startIndex + 4, state.events.length);
                                      final int emptySlots = 4 - (endIndex - startIndex);

                                      return IntrinsicHeight(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            for (int i = startIndex; i < endIndex; i++) ...[
                                              Expanded(
                                                child: EventItem(
                                                  state.events[i],
                                                  sedBloc: setupInfoFieldBloc,
                                                ),
                                              ),
                                              if (i < endIndex - 1) const SizedBox(width: 16),
                                            ],
                                            for (int i = 0; i < emptySlots; i++) ...[
                                              if (i > 0 || (endIndex - startIndex) > 0)
                                                const SizedBox(width: 16),
                                              const Expanded(child: SizedBox()),
                                            ],
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 15),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                PaginationBar(
                                  totalEvents: state.totalCount,
                                  currentPage: state.page,
                                  pageSize: state.pageSize,
                                  onPageChanged: (page) => _onFilter(page: page),
                                ),
                                const SizedBox(height: 7),
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _config() => showDialog(
    context: context,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EventBloc(
            context.read(),
            context.read(),
            context.read(),
            context.read(),
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
        BlocProvider.value(value: setupInfoFieldBloc),
      ],
      child: SetupInfoFieldDialog(typeConfig: EventTypeConfig.EVENT_MANAGEMENT),
    ),
  );

  void _onFilter({int page = 1}) {
    if (presetHour == 1) {
      endTime = DateTime.now();
      startTime = endTime.subtract(Duration(hours: 1));
    }

    eventBloc.add(
      SearchEvent(
        page: page,
        startTime: startTime,
        endTime: endTime,
        eventTypes: eventType,
        cameraIds: cameraIds,
        cameras: cameras,
        subjectName: searchController.text,
      ),
    );
  }

  Widget presetTimeBtn(
    Function(int, {bool inHour}) onPressed,
    int hour,
    String label, {
    bool inHour = true,
  }) {
    return EventCustomButton(
      backgroundColor: presetHour == hour ? AppColors.blue005AA9 : AppColors.white,
      borderColor: AppColors.blue005AA9,
      borderRadius: 3,
      label: label,
      onPressed: () => onPressed(hour, inHour: inHour),
      padding: const EdgeInsets.all(8),
      textStyle: AppTypography.style(
        14,
        color: presetHour == hour ? AppColors.white : AppColors.blue005AA9,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  _recursionDeviceGroup(List<DeviceGroup> groups) {
    List<DeviceGroup> result = [];
    for (var group in groups) {
      result.add(group);
      result.addAll(_recursionDeviceGroup(group.groups));
    }
    return result;
  }
}
