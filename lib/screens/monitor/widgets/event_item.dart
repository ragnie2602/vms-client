import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/event_constants.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

class EventLiveViewItem extends StatelessWidget {
  final ReceiveEventEntity event;
  final SetupEventDisplayBloc sedBloc;

  EventLiveViewItem({super.key, required this.event, required this.sedBloc}) {
    sedBloc.add(
      GetEventDisplayConfig(
        event.eventType ?? '',
        EventTypeConfig.LIVEVIEW,
        subjectTypeId: subjectTypeId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (eventId != null) {
            showDialog(
              context: context,
              builder: (c) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<EventBloc>()),
                  BlocProvider.value(value: context.read<HomeBloc>()),
                  BlocProvider(create: (context) => PlaybackBloc(context.read(), context.read())),
                  BlocProvider.value(value: context.read<StorageFolderBloc>()),
                ],
                child: EventDetailDialog(id: eventId!),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: BlocBuilder<SetupEventDisplayBloc, SetupEventDisplayState>(
            bloc: sedBloc,
            buildWhen: (previous, current) =>
                current is SEDGetEventDisplayConfigSuccess || current is SEDSavingConfigsSuccess,
            builder: (context, state) {
              final config = sedBloc.configs[(event.eventType ?? '', subjectTypeId)];

              if (config == null) {
                return Row(
                  children: [
                    Container(
                      width: 71,
                      height: 71,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.greyDFDFDF,
                      ),
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                  ],
                );
              }

              return _buildContent(event.eventData ?? {}, config);
            },
          ),
        ),
      ),
    );
  }

  // GETTERS
  int? get eventId => event.eventData?['eventId'];
  int? get subjectTypeId => event.eventData?['subjectTypeId'];

  Widget _buildContent(Map<String, dynamic> eventData, EventDisplayConfig config) {
    final sortedFields = config.sortedFields();

    if (sortedFields.isEmpty) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildImage(eventData)]);
    }

    final titleKey = config.sorting.firstOrNull;
    final title = titleKey != null ? (eventData[titleKey]?.toString() ?? '_') : '_';

    final detailFields = sortedFields.length > 1
        ? sortedFields.sublist(1, min(5, sortedFields.length))
        : <Fields>[];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(eventData),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  title,
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
              ...detailFields.map((field) {
                final value = eventData[field.fieldKey]?.toString() ?? '_';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      if (field.icon != null && field.icon!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: _buildIcon(field.icon!),
                        ),
                      Expanded(
                        child: Text(
                          value,
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
    );
  }

  Widget _buildImage(Map<String, dynamic> eventData) => Container(
    width: 71,
    height: 71,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greyDFDFDF),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: eventData['imageUrl'] ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget: (context, url, error) => Container(
          color: AppColors.greyDFDFDF,
          child: Icon(Icons.image_not_supported, color: AppColors.grey4B5563, size: 40),
        ),
      ),
    ),
  );

  Widget _buildIcon(String iconUrl) {
    final isSvg = iconUrl.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.network(
        iconUrl,
        width: 18,
        height: 18,
        colorFilter: const ColorFilter.mode(AppColors.grey4B5563, BlendMode.srcIn),
        placeholderBuilder: (context) => const SizedBox(
          width: 18,
          height: 18,
          child: Center(
            child: CircularProgressIndicator(strokeWidth: 1, color: AppColors.grey4B5563),
          ),
        ),
      );
    }

    return Image.network(
      iconUrl,
      width: 18,
      height: 18,
      color: AppColors.grey4B5563,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image, color: AppColors.grey4B5563, size: 18),
    );
  }
}
