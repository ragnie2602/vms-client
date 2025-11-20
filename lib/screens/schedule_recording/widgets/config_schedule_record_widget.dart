import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';

class ConfigScheduleRecordWidget extends StatefulWidget {
  const ConfigScheduleRecordWidget({super.key});

  @override
  State<ConfigScheduleRecordWidget> createState() =>
      _ConfigScheduleRecordWidgetState();
}

class _ConfigScheduleRecordWidgetState
    extends State<ConfigScheduleRecordWidget> {
  @override
  void initState() {
    super.initState();
    // init data đầu vào
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
                  itemCount: ScheduleTimeDay.values.length * 24,
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
                  itemBuilder: (_, __) {
                    return SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        side: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1.0,
                        ),
                        activeColor: AppColors.blue005AA9,
                        value: true,
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
