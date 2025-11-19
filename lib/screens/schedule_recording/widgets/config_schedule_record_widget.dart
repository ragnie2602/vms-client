import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ConfigScheduleRecordWidget extends StatelessWidget {
  const ConfigScheduleRecordWidget({super.key});

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
                final day = DaysOfWeek.values[index];
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
              itemCount: DaysOfWeek.values.length,
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
                child: SizedBox(
                  height: 14,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final timeSlot = TimeSlots.values[index];
                      return Text(
                        timeSlot.displayName,
                        style: AppTypography.style(
                          12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.redFF0000,
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(width: 20),
                    itemCount: TimeSlots.values.length,
                  ),
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
                  itemCount: DaysOfWeek.values.length * 24,
                  itemBuilder: (context, column) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue005AA9,
                        borderRadius: BorderRadius.circular(2),
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
                  itemCount: DaysOfWeek.values.length,
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

enum DaysOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DaysOfWeekExt on DaysOfWeek {
  String get displayName {
    switch (this) {
      case DaysOfWeek.monday:
        return 'Thứ 2';
      case DaysOfWeek.tuesday:
        return 'Thứ 3';
      case DaysOfWeek.wednesday:
        return 'Thứ 4';
      case DaysOfWeek.thursday:
        return 'Thứ 5';
      case DaysOfWeek.friday:
        return 'Thứ 6';
      case DaysOfWeek.saturday:
        return 'Thứ 7';
      case DaysOfWeek.sunday:
        return 'Chủ nhật';
    }
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
