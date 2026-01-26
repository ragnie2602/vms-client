import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/event/components/event_date_range_picker.dart';
import 'package:vms_flutter_client/screens/event/components/event_item.dart';
import 'package:vms_flutter_client/screens/event/components/pagination_bar.dart';
import 'package:vms_flutter_client/screens/event/components/setup_info_field_dialog.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late final ControlCameraBloc controlCameraBloc;
  late final MonitorBloc monitorBloc;

  int presetHour = 0;

  @override
  void initState() {
    super.initState();

    controlCameraBloc = context.read<ControlCameraBloc>()..add(GetAllTagsEvent());
    monitorBloc = MonitorBloc(context.read(), context.read(), context.read(), context.read())
      ..add(GetAllCamera());
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
              children: [
                Expanded(
                  child: EventDateRangePicker(
                    isDense: true,
                    label: 'Thời gian',
                    hintText: 'Từ ngày - đến ngày',
                    onChanged: (_) {},
                    padding: EdgeInsets.only(bottom: 12, left: 16, right: 12, top: 12),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String?>(
                    isDense: true,
                    itemBuilder: (item) => Text(
                      item ?? 'Tất cả',
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    items: [
                      null,
                      'Phát hiện chuyển động',
                      'Phát hiện xâm nhập',
                      'Phân biệt đối tượng',
                      'Vượt hàng rào ảo',
                      'Phát hiện vật bị bỏ quên',
                      'Phát hiện vật nguy hiểm',
                    ],
                    label: 'Sự kiện',
                    onChanged: (_) {},
                    padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
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
                          color: AppColors.black,
                        ),
                      ),
                      items: state is GetAllGroupCameraSuccessState
                          ? [null, ...recursionDeviceGroup(state.groups ?? [])]
                          : [],
                      label: 'Nhóm camera',
                      onChanged: (value) {
                        monitorBloc.add(GetAllCameraInGroup(value?.groupId ?? []));
                      },
                      padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BlocBuilder<MonitorBloc, MonitorState>(
                    bloc: monitorBloc,
                    builder: (context, state) {
                      return EventFilterDropdown<CameraEntity?>(
                        isDense: true,
                        itemBuilder: (item) => Text(
                          item?.name ?? 'Tất cả',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        items: state is MonitorSuccess ? [null, ...state.cameras] : [],
                        label: 'Tên camera',
                        onChanged: (_) {},
                        padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                EventCustomButton(
                  backgroundColor: AppColors.blue005AA9,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Tìm kiếm',
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 12),
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
                    builder: (context, setState) => Row(
                      children: [
                        EventCustomButton(
                          backgroundColor: presetHour == 1 ? AppColors.blue005AA9 : AppColors.white,
                          borderColor: AppColors.blue005AA9,
                          borderRadius: 3,
                          label: '1 giờ trước',
                          onPressed: () => setState(() => presetHour = 1),
                          padding: const EdgeInsets.all(8),
                          textStyle: AppTypography.style(
                            14,
                            color: presetHour == 1 ? AppColors.white : AppColors.blue005AA9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        EventCustomButton(
                          backgroundColor: presetHour == 24
                              ? AppColors.blue005AA9
                              : AppColors.white,
                          borderColor: AppColors.blue005AA9,
                          borderRadius: 3,
                          label: 'Hôm nay',
                          onPressed: () => setState(() => presetHour = 24),
                          padding: const EdgeInsets.all(8),
                          textStyle: AppTypography.style(
                            14,
                            color: presetHour == 24 ? AppColors.white : AppColors.blue005AA9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        EventCustomButton(
                          backgroundColor: presetHour == 168
                              ? AppColors.blue005AA9
                              : AppColors.white,
                          borderColor: AppColors.blue005AA9,
                          borderRadius: 3,
                          label: '7 ngày trước',
                          onPressed: () => setState(() => presetHour = 168),
                          padding: const EdgeInsets.all(8),
                          textStyle: AppTypography.style(
                            14,
                            color: presetHour == 168 ? AppColors.white : AppColors.blue005AA9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        EventCustomButton(
                          backgroundColor: presetHour == 720
                              ? AppColors.blue005AA9
                              : AppColors.white,
                          borderColor: AppColors.blue005AA9,
                          borderRadius: 3,
                          label: '30 ngày trước',
                          onPressed: () => setState(() => presetHour = 720),
                          padding: const EdgeInsets.all(8),
                          textStyle: AppTypography.style(
                            14,
                            color: presetHour == 720 ? AppColors.white : AppColors.blue005AA9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        EventCustomButton(
                          borderColor: AppColors.greyE5E7EB,
                          borderRadius: 3,
                          label: 'Làm mới',
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
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
                          label: 'Tải về danh sách',
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
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
                          label: 'Cấu hình',
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => SetupInfoFieldDialog(),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                          prefix: SvgPicture.asset(AppAssets.icConfigure, height: 20),
                          prefixGap: 8,
                          textStyle: AppTypography.style(
                            14,
                            color: AppColors.blue374151,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: AppColors.greyE2E8F0),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 324.5 / 306,
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => EventItem(),
                      itemCount: 50,
                    ),
                  ),
                  const SizedBox(height: 30),
                  PaginationBar(totalEvents: 50),
                  const SizedBox(height: 7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  recursionDeviceGroup(List<DeviceGroup> groups) {
    List<DeviceGroup> result = [];
    for (var group in groups) {
      result.add(group);
      result.addAll(recursionDeviceGroup(group.groups));
    }
    return result;
  }
}
