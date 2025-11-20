import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_entity.dart';

class ConfigScheduleRecordWidget extends StatefulWidget {
  const ConfigScheduleRecordWidget({super.key, required this.camera});
  final CameraEntity camera;
  @override
  State<ConfigScheduleRecordWidget> createState() =>
      _ConfigScheduleRecordWidgetState();
}

class _ConfigScheduleRecordWidgetState
    extends State<ConfigScheduleRecordWidget> {
  // init list schedule time
  List<ScheduleTimeEntity>? scheduleTimeSelected;
  // check box cả ngày
  List<bool> listCheckAllDay = List.generate(
    ScheduleTimeDay.values.length,
    (index) => false,
  );
  int gridItemCount = ScheduleTimeDay.values.length * 24;

  @override
  void initState() {
    super.initState();
    scheduleTimeSelected =
        widget.camera.cameraConfig?.recording?.schedules ?? [];
    _initCheckAllDay();
  }

  void _initCheckAllDay() {
    for (int i = 0; i < ScheduleTimeDay.values.length; i++) {
      // get day
      final day = ScheduleTimeDay.values[i];
      // check all day
      listCheckAllDay[i] =
          widget.camera.cameraConfig?.recording?.checkAllDay(day) ?? false;
    }
  }

  int getRowIndex(int gridItem) {
    return gridItem ~/ 24;
  }

  int getColumnIndex(int gridItem) {
    return gridItem % 24;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // column chứa thứ
        Expanded(
          flex: 77,
          child: Padding(
            padding: EdgeInsetsGeometry.only(top: 29),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final day = ScheduleTimeDay.values[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    day.displayName,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black0D0D0D,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 15),
              itemCount: ScheduleTimeDay.values.length,
            ),
          ),
        ),
        Container(width: 12),
        // colum chưa giờ + gridview
        Expanded(
          flex: 648,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // width available for the grid area
                    final gridWidth = constraints.maxWidth;

                    // lấy khoảng cách giữa các mốc/2 (tránh mốc cuối bị overflow)
                    final cellWidth =
                        gridWidth / ((TimeSlots.values.length - 1) * 2);
                    return SizedBox(
                      height: 14,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final timeSlot = TimeSlots.values[index];
                          return Container(
                            width: index < TimeSlots.values.length - 2
                                ? 2 * cellWidth
                                : cellWidth,
                            alignment: index < TimeSlots.values.length - 1
                                ? Alignment.centerLeft
                                : Alignment.centerRight,

                            child: Text(
                              timeSlot.displayName,
                              style: AppTypography.style(
                                12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.redFF0000,
                              ),
                            ),
                          );
                        },
                        itemCount: TimeSlots.values.length,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 24,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1, // adjust height
                  ),
                  itemCount: gridItemCount,
                  itemBuilder: (context, index) {
                    // Calculate row (i) and column (j)
                    int rowIndex = index ~/ 24;
                    int columnIndex = index % 24;
                    return Tooltip(
                      message:
                          '${columnIndex < 9 ? '0' : ''}${columnIndex}h:00',
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.greyE2E8F0,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 13),
        // check box cả ngày
        Expanded(
          flex: 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cả ngày',
                style: AppTypography.style(
                  12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.redFF0000,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        side: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1.0,
                        ),
                        activeColor: AppColors.blue005AA9,
                        value: listCheckAllDay[index],
                        onChanged: (_) {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  },
                  itemCount: ScheduleTimeDay.values.length,
                  separatorBuilder: (context, index) => SizedBox(height: 13),
                ),
              ),
            ],
          ),
        ),
        // padding right
        const SizedBox(width: 5),
      ],
    );
  }
}

enum TimeSlots { t0, t6, t12, t18, t24 }

extension TimeSlotsExt on TimeSlots {
  String get displayName {
    switch (this) {
      case TimeSlots.t0:
        return '0h00';
      case TimeSlots.t6:
        return '6h00';
      case TimeSlots.t12:
        return '12h00';
      case TimeSlots.t18:
        return '18h00';
      case TimeSlots.t24:
        return '24h00';
    }
  }
}
