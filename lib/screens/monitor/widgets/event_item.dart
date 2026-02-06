import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});
  final ReceiveEventEntity event;

  @override
  Widget build(BuildContext context) {
    final eventData = event.eventDataEntity;
    final configData = eventData.configData ?? [];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // showDetailDialog(context)
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
                                child: Image.network(
                                  config.icon!,
                                  width: 18,
                                  height: 18,
                                  color: AppColors.grey4B5563,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.broken_image,
                                      color: AppColors.grey4B5563,
                                      size: 18,
                                    );
                                  },
                                ),
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
}
