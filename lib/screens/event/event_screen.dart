import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/event/components/event_item.dart';
import 'package:vms_flutter_client/screens/event/components/setup_info_field_dialog.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late final ControlCameraBloc controlCameraBloc;

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
                  child: EventFilterDropdown<String>(
                    items: [],
                    label: 'Từ ngày',
                    onChanged: (_) {},
                    type: EventFilterDropdownType.date,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: [],
                    label: 'Đến ngày',
                    onChanged: (_) {},
                    type: EventFilterDropdownType.date,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: ['Intrusion detection', 'Object detection', 'Face detection'],
                    label: 'Sự kiện',
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: ['Camera 1', 'Camera 2', 'Camera 3'],
                    label: 'Thiết bị',
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(width: 16),
                BlocBuilder<ControlCameraBloc, ControlCameraState>(
                  buildWhen: (previous, current) =>
                      current is GetAllTagsSuccessState ||
                      current is GetAllTagsLoadingState ||
                      current is GetAllTagsFailState,
                  builder: (context, state) => Expanded(
                    child: EventFilterDropdown<TagEntity>(
                      items: state is GetAllTagsSuccessState ? state.tags : [],
                      label: 'Tag',
                      onChanged: (_) {},
                    ),
                  ),
                ),
                SizedBox(width: 32),
                EventCustomButton(
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Tìm kiếm',
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10, right: 10, top: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      EventCustomButton(
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.blue005AA9,
                        borderRadius: 3,
                        label: '1 giờ trước',
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        textStyle: AppTypography.style(
                          14,
                          color: AppColors.blue005AA9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      EventCustomButton(
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.blue005AA9,
                        borderRadius: 3,
                        label: 'Hôm nay',
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        textStyle: AppTypography.style(
                          14,
                          color: AppColors.blue005AA9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      EventCustomButton(
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.blue005AA9,
                        borderRadius: 3,
                        label: '7 ngày trước',
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        textStyle: AppTypography.style(
                          14,
                          color: AppColors.blue005AA9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      EventCustomButton(
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.blue005AA9,
                        borderRadius: 3,
                        label: '30 ngày trước',
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        textStyle: AppTypography.style(
                          14,
                          color: AppColors.blue005AA9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => showSetupInfoFieldsDialog(context),
                        icon: Icon(Icons.settings),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.greyF2F4FA),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 338 / 304,
                        crossAxisCount: 4,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 11,
                      ),
                      itemBuilder: (context, index) {
                        return EventItem();
                      },
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
