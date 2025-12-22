import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => showDialog(context: context, builder: (context) => EventDetailDialog()),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyE2E8F0),
            borderRadius: BorderRadius.circular(4),
            color: AppColors.greyF2F4FA,
          ),
          padding: const EdgeInsets.only(bottom: 15, left: 5, right: 5, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      'https://assets.nintendo.com/image/upload/q_auto/f_auto/store/software/switch2/70010000105851/8787627be7f26ae7984456ffd9af17bea845032cebbf59fe6eeb596dea6bb20e',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 17,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.white.withAlpha(205),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppAssets.icVideoOn),
                          const SizedBox(width: 4),
                          Text(
                            'Camera 1',
                            style: AppTypography.style(9, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                'Phát hiện xâm nhập',
                style: AppTypography.style(16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              CustomTable(
                columnSpacing: 10,
                data: CustomTableData(
                  columnFlexes: [0, 1],
                  data: [
                    [
                      SvgPicture.asset(AppAssets.icTimeCircle, height: 20),
                      Text(
                        '20:30 20/12/2025',
                        style: AppTypography.style(16, fontWeight: FontWeight.w500),
                      ),
                    ],
                    [
                      SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                      Text(
                        'Camera cổng 1',
                        style: AppTypography.style(16, fontWeight: FontWeight.w500),
                      ),
                    ],
                    [
                      SvgPicture.asset(AppAssets.icLocation2, height: 20),
                      Text('Cổng 1', style: AppTypography.style(16, fontWeight: FontWeight.w500)),
                    ],
                  ],
                ),
                rowSpacing: 8,
                verticalAlignments: [
                  CrossAxisAlignment.center,
                  CrossAxisAlignment.center,
                  CrossAxisAlignment.center,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
