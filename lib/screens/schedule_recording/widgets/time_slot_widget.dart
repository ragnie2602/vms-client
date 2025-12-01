import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/config_schedule_record_widget.dart';

class TimeSlotWidget extends StatelessWidget {
  const TimeSlotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // width available for the grid area
        final gridWidth = constraints.maxWidth;
        // lấy khoảng cách giữa các mốc/2 (tránh mốc cuối bị overflow)
        final cellWidth = gridWidth / ((TimeSlots.values.length - 1) * 2);
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
    );
  }
}
