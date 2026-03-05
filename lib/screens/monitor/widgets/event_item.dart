import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

class EventLiveViewItem extends StatefulWidget {
  const EventLiveViewItem({super.key, required this.event});
  final ReceiveEventEntity event;

  @override
  State<EventLiveViewItem> createState() => _EventLiveViewItemState();
}

class _EventLiveViewItemState extends State<EventLiveViewItem> {
  SetupEventDisplayBloc? _sedBloc;

  @override
  void initState() {
    super.initState();

    try {
      _sedBloc = context.read<SetupEventDisplayBloc>();
      final eventData = widget.event.eventData ?? {};
      final subjectTypeId = eventData['subjectTypeId'];

      _sedBloc?.add(
        GetEventDisplayConfig(
          widget.event.eventType ?? '',
          2,
          subjectTypeId: subjectTypeId is int ? subjectTypeId : null,
        ),
      );
    } catch (e) {
      debugPrint('SetupEventDisplayBloc not found in context: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventData = widget.event.eventData ?? {};

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (eventData['eventId'] != null) {
            showDialog(
              context: context,
              builder: (c) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<EventBloc>()),
                  BlocProvider.value(value: context.read<HomeBloc>()),
                  BlocProvider(create: (context) => PlaybackBloc(context.read(), context.read())),
                  BlocProvider.value(value: context.read<StorageFolderBloc>()),
                ],
                child: EventDetailDialog(id: eventData['eventId'] ?? 0),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    imageUrl: eventData['imageUrl'] ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.greyDFDFDF,
                      child: Icon(Icons.image_not_supported, color: AppColors.grey4B5563, size: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _sedBloc != null
                    ? BlocBuilder<SetupEventDisplayBloc, SetupEventDisplayState>(
                        bloc: _sedBloc,
                        buildWhen: (previous, current) =>
                            current is SEDGetEventDisplayConfigSuccess ||
                            current is SEDSavingConfigsSuccess,
                        builder: (context, state) {
                          final subjectTypeId = eventData['subjectTypeId'];
                          final config =
                              _sedBloc!.configs[(
                                widget.event.eventType ?? '',
                                subjectTypeId is int ? subjectTypeId : null,
                              )];

                          if (config == null) {
                            return _buildFallbackContent(eventData);
                          }

                          return _buildConfiguredContent(eventData, config);
                        },
                      )
                    : _buildFallbackContent(eventData),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // View cũ dùng khi chưa có config hoặc không có Bloc
  Widget _buildFallbackContent(Map<String, dynamic> eventData) {
    if (eventData.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eventData.values.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              eventData.values.first?.toString() ?? '_',
              style: AppTypography.style(12, fontWeight: FontWeight.w600, color: AppColors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        const SizedBox(height: 5),
        ...eventData.entries
            .skip(1)
            .map(
              (e) => Text(
                e.value.toString(),
                style: AppTypography.style(
                  12,
                  color: AppColors.grey4B5563,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
      ],
    );
  }

  Widget _buildConfiguredContent(Map<String, dynamic> eventData, EventDisplayConfig c) {
    if (c.sorting.isEmpty || c.fields.isEmpty) return const SizedBox();

    final titleKey = c.sorting.first;
    final sortedFields = c.sortedFields();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title (item đầu tiên trong sorting)
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            eventData[titleKey]?.toString() ?? '_',
            style: AppTypography.style(12, fontWeight: FontWeight.w600, color: AppColors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 5),
        // Các field còn lại (từ index 1 trở đi)
        ...sortedFields.sublist(1).map((f) {
          final value = eventData[f.fieldKey]?.toString() ?? '';
          if (value.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (f.icon != null && f.icon!.isNotEmpty) ...[
                  _buildIcon(f.icon!),
                  const SizedBox(width: 4),
                ],
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
    );
  }

  Widget _buildIcon(String iconUrl) {
    final isSvg = iconUrl.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.network(
        iconUrl,
        width: 14, // Giảm size chút cho phù hợp live view (cũ là 18)
        height: 14,
        colorFilter: ColorFilter.mode(AppColors.grey4B5563, BlendMode.srcIn),
        placeholderBuilder: (context) => SizedBox(width: 14, height: 14),
      );
    }

    return Image.network(
      iconUrl,
      width: 14,
      height: 14,
      color: AppColors.grey4B5563,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(width: 14, height: 14); // Ẩn icon lỗi thay vì hiện broken image to
      },
    );
  }
}
