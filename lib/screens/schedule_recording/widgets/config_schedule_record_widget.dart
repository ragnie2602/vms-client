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
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 24,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    // childAspectRatio: 0.35, // adjust height
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
