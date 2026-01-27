import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool hasRead = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hasRead ? AppColors.white : Color(0xFFF2F3F5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showDetailDialog(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 63,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        'https://static.wikia.nocookie.net/p__/images/7/71/Sherma.png/revision/latest?cb=20250924113412&path-prefix=protagonist',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  flex: 198,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phát hiện xâm nhập',
                        style: AppTypography.style(12, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      CustomTable(
                        columnSpacing: 10,
                        data: CustomTableData(
                          columnFlexes: [0, 1],
                          data: [
                            [
                              Tooltip(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                message: 'Thời gian',
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                preferBelow: false,
                                textStyle: AppTypography.style(
                                  11,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                verticalOffset: 8,
                                child: SvgPicture.asset(AppAssets.icTimeCircle, height: 18),
                              ),
                              Text(
                                '20:30 20/12/2025',
                                style: AppTypography.style(
                                  12,
                                  color: AppColors.grey4B5563,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                            [
                              SvgPicture.asset(AppAssets.icVideoOn, height: 18),
                              Text(
                                'Camera cổng 1',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.style(
                                  12,
                                  color: AppColors.grey4B5563,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                        rowSpacing: 2,
                        verticalAlignments: [CrossAxisAlignment.center, CrossAxisAlignment.center],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDetailDialog(BuildContext context) {
    setState(() => hasRead = true);
    showDialog(context: context, builder: (context) => EventDetailDialog());
  }
}
