import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

import 'package:intl/intl.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

class EventItem extends StatelessWidget {
  final EventEntity event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (c) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<EventBloc>()),
            BlocProvider.value(value: context.read<HomeBloc>()),
            BlocProvider(create: (context) => PlaybackBloc(context.read(), context.read())),
            BlocProvider.value(value: context.read<StorageFolderBloc>()),
          ],
          child: EventDetailDialog(event: event),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    event.imageUrl ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
                  ),
                ),
                Positioned(
                  bottom: 16,
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
                          event.camera?.name ?? '',
                          style: AppTypography.style(9, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyE2E8F0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: AppColors.black.withAlpha(34),
                    offset: const Offset(0, 4),
                  ),
                ],
                color: AppColors.greyF2F4FA,
              ),
              padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName ?? 'Phát hiện xâm nhập',
                    style: AppTypography.style(14, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  CustomTable(
                    columnSpacing: 10,
                    data: CustomTableData(
                      columnFlexes: [0, 1],
                      data: [
                        [
                          SvgPicture.asset(AppAssets.icTimeCircle, height: 20),
                          Text(
                            DateFormat(
                              'HH:mm dd/MM/yyyy',
                            ).format(DateTime.fromMillisecondsSinceEpoch(event.timeEvent * 1000)),
                            style: AppTypography.style(14, fontWeight: FontWeight.w500),
                          ),
                        ],
                        [
                          SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                          Text(
                            event.camera?.name ?? '',
                            style: AppTypography.style(14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ],
                    ),
                    rowSpacing: 5,
                    verticalAlignments: [CrossAxisAlignment.center, CrossAxisAlignment.center],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
