import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event});
  final ReceiveEventEntity event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool hasRead = false;

  @override
  Widget build(BuildContext context) {
    final eventData = widget.event.eventDataEntity;
    final configData = eventData.configData ?? [];

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
                // Ảnh bên trái
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.greyDFDFDF,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      eventData.imageUrl ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.greyDFDFDF,
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppColors.grey4B5563,
                            size: 40,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 2,
                          ),
                        );
                      },
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
                        Text(
                          configData[0].data ?? '',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 8),
                      // Các phần tử tiếp theo - hiển thị icon + data
                      ...configData.skip(1).map((config) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              if (config.icon != null &&
                                  config.icon!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: SvgPicture.asset(
                                    config.icon!,
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.grey4B5563,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  config.data ?? '',
                                  style: AppTypography.style(
                                    13,
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
      ),
    );
  }

  void showDetailDialog(BuildContext context) {
    setState(() => hasRead = true);
  }
}
