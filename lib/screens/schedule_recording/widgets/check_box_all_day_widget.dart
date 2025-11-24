import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';

class CheckBoxAllDayWidget extends StatelessWidget {
  const CheckBoxAllDayWidget({
    super.key,
    required this.updateCheckBox,
    required this.listCheckAllDay,
  });

  final Function(int) updateCheckBox;
  final List<bool> listCheckAllDay;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 18),
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
                  side: BorderSide(color: AppColors.greyE2E8F0, width: 1.0),
                  activeColor: AppColors.blue005AA9,
                  value: listCheckAllDay[index],
                  onChanged: (_) {
                    updateCheckBox(index);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              );
            },
            itemCount: ScheduleTimeDay.values.length,
            separatorBuilder: (context, index) => SizedBox(height: 13),
            // height của sizedbox cũng phải resize
          ),
        ),
      ],
    );
  }
}
