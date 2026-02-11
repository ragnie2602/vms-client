import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

class EventLiveViewItem extends StatelessWidget {
  const EventLiveViewItem({super.key, required this.event});
  final ReceiveEventEntity event;

  @override
  Widget build(BuildContext context) {
    final eventData = event.eventDataEntity;
    final configData = eventData.configData ?? [];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // check ko có eventId -> không mở được detail
          if (eventData.eventId == null) {
            return;
          } else {
            // open detail qua eventId
            showDialog(
              context: context,
              builder: (c) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<EventBloc>()),
                  BlocProvider.value(value: context.read<HomeBloc>()),
                  BlocProvider(
                    create: (context) =>
                        PlaybackBloc(context.read(), context.read()),
                  ),
                  BlocProvider.value(value: context.read<StorageFolderBloc>()),
                ],
                child: EventDetailDialog(id: eventData.eventId ?? 0),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ảnh bên trái
              Container(
                width: 71,
                height: 71,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.greyDFDFDF,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: eventData.imageUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.greyDFDFDF,
                      child: Icon(
                        Icons.image_not_supported,
                        color: AppColors.grey4B5563,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Thông tin bên phải
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phần tử đầu tiên của configData - chỉ hiển thị data (tiêu đề)
                    if (configData.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          configData[0].data ?? '_',
                          style: AppTypography.style(
                            12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    const SizedBox(height: 5),
                    // Các phần tử tiếp theo - hiển thị icon + data
                    ...configData.skip(1).map((config) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            if (config.icon != null && config.icon!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: _buildIcon(config.icon!),
                              ),
                            Expanded(
                              child: Text(
                                config.data ?? '_',
                                style: AppTypography.style(
                                  12,
                                  color: AppColors.grey4B5563,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String iconUrl) {
    final isSvg = iconUrl.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.network(
        iconUrl,
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(AppColors.grey4B5563, BlendMode.srcIn),
        placeholderBuilder: (context) => SizedBox(
          width: 18,
          height: 18,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
              color: AppColors.grey4B5563,
            ),
          ),
        ),
      );
    }

    // nếu là ảnh thường
    return Image.network(
      iconUrl,
      width: 18,
      height: 18,
      color: AppColors.grey4B5563,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.broken_image, color: AppColors.grey4B5563, size: 18);
      },
    );
  }
}
