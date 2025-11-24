import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';

class ScheduleTimeDayWidget extends StatelessWidget {
  const ScheduleTimeDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 31),
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
    );
  }
}
