import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/event/components/event_item.dart';
import 'package:vms_flutter_client/screens/event/components/setup_info_field_dialog.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late final ControlCameraBloc controlCameraBloc;

  int presetHour = 0;

  @override
  void initState() {
    super.initState();

    controlCameraBloc = context.read<ControlCameraBloc>()..add(GetAllTagsEvent());
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
                  child: EventFilterDropdown<DateTime>(
                    isDense: true,
                    items: [],
                    label: 'Từ ngày',
                    onChanged: (_) {},
                    padding: EdgeInsets.only(bottom: 12, left: 16, right: 12, top: 12),
                    type: EventFilterDropdownType.date,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<DateTime>(
                    isDense: true,
                    items: [],
                    label: 'Đến ngày',
                    onChanged: (_) {},
                    padding: EdgeInsets.only(bottom: 12, left: 16, right: 12, top: 12),
                    type: EventFilterDropdownType.date,
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
                  child: BlocBuilder<MonitorBloc, MonitorState>(
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
                        label: 'Thiết bị',
                        onChanged: (_) {},
                        padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BlocBuilder<ControlCameraBloc, ControlCameraState>(
                    buildWhen: (previous, current) =>
                        current is GetAllTagsSuccessState ||
                        current is GetAllTagsLoadingState ||
                        current is GetAllTagsFailState,
                    builder: (context, state) => EventFilterDropdown<TagEntity?>(
                      isDense: true,
                      itemBuilder: (item) => Text(
                        item?.name ?? 'Tất cả',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      items: state is GetAllTagsSuccessState ? [null, ...state.tags] : [],
                      label: 'Tag',
                      onChanged: (_) {},
                      padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                EventCustomButton(
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Tìm kiếm',
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                  textStyle: AppTypography.style(
                    14,
                    color: AppColors.blue005AA9,
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
                        Text(
                          'Danh sách sự kiện',
                          style: AppTypography.style(16, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
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
                        const SizedBox(width: 10),
                        EventCustomButton(
                          backgroundColor: AppColors.white,
                          borderColor: AppColors.blue005AA9,
                          borderRadius: 3,
                          label: '',
                          prefix: SvgPicture.asset(
                            AppAssets.tabSettings,
                            color: AppColors.blue005AA9,
                            height: 20,
                          ),
                          onPressed: () => showSetupInfoFieldsDialog(context),
                          padding: const EdgeInsets.all(5),
                          textStyle: AppTypography.style(
                            14,
                            color: AppColors.blue005AA9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: AppColors.greyF2F4FA),
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
                      itemCount: 12,
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

  showSetupInfoFieldsDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => SetupInfoFieldDialog());
  }
}
