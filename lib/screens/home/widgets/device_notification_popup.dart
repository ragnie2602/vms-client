import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/notification/header_notification.dart';
import 'package:vms_flutter_client/screens/home/bloc/header_notification_bloc.dart';

class DeviceNotificationPopup extends StatelessWidget {
  final VoidCallback onClose;

  const DeviceNotificationPopup({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: MediaQuery.heightOf(context) * 508 / 900,
      width: MediaQuery.widthOf(context) * 369 / 1600,
      child: BlocBuilder<HeaderNotificationBloc, HeaderNotificationState>(
        builder: (context, state) {
          final notifications = state is GetNotificationsSuccess ? state.notifications : [];

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Text(
                  'Thông báo',
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              const Divider(height: 1, color: AppColors.greyE2E8F0),
              notifications.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: notifications.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, color: AppColors.greyE2E8F0),
                        itemBuilder: (context, index) =>
                            _DeviceNotificationItem(notification: notifications[index]),
                      ),
                    )
                  : const Center(child: Text('Không có thông báo')),
              const Divider(height: 1, color: AppColors.greyE2E8F0),
              InkWell(
                onTap: () => context.read<HeaderNotificationBloc>().add(
                  GetNotifications(lastNotificationId: notifications.last.id),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  child: Text(
                    'Xem thêm',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue3B82F6,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DeviceNotificationItem extends StatelessWidget {
  final HeaderNotification notification;

  const _DeviceNotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<HeaderNotificationBloc>().add(
        MarkReadNotification(notificationId: notification.id!),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.greyE5E5E5),
            left: BorderSide(color: AppColors.greyE5E5E5),
            top: BorderSide(color: AppColors.greyE5E5E5),
          ),
          color: const Color(0xFFF2F4FA),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.network(
                notification.metadata?['icon'] ?? '',
                errorBuilder: (context, error, stackTrace) => Container(),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    notification.message ?? '',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '[${notification.topic ?? ''}]',
                        style: AppTypography.style(
                          12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey6A6A6A,
                        ),
                      ),
                      Text(
                        notification.createdAt ?? '',
                        style: AppTypography.style(
                          12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey6A6A6A,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
