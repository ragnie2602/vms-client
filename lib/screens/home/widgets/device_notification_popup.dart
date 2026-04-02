import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/notification/header_notification.dart';
import 'package:vms_flutter_client/screens/home/bloc/header_notification_bloc.dart';

class DeviceNotificationPopup extends StatefulWidget {
  final HeaderNotificationBloc bloc;
  final VoidCallback onClose;

  const DeviceNotificationPopup({super.key, required this.bloc, required this.onClose});

  @override
  State<DeviceNotificationPopup> createState() => _DeviceNotificationPopupState();
}

class _DeviceNotificationPopupState extends State<DeviceNotificationPopup> {
  final List<HeaderNotification> notifications = [];
  bool canLoadMore = false;

  @override
  void initState() {
    super.initState();
    if (mounted) widget.bloc.add(GetNotifications());
  }

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
      child: BlocConsumer<HeaderNotificationBloc, HeaderNotificationState>(
        bloc: widget.bloc,
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Text(
                'Thông báo',
                style: AppTypography.style(14, fontWeight: FontWeight.w600, color: AppColors.black),
              ),
            ),
            const Divider(height: 1, color: AppColors.greyE2E8F0),
            notifications.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          _DeviceNotificationItem(widget.bloc, notifications[index]),
                      itemCount: notifications.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, color: AppColors.greyE2E8F0),
                      padding: EdgeInsets.zero,
                    ),
                  )
                : const Center(child: Text('Không có thông báo')),
            const Divider(height: 1, color: AppColors.greyE2E8F0),
            if (notifications.length > 5)
              InkWell(
                onTap: () =>
                    widget.bloc.add(GetNotifications(lastNotificationId: notifications.last.id)),
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
        ),
        listener: (context, state) {
          if (state is GetNotificationsSuccess) {
            final incoming = state.notifications;

            canLoadMore = incoming.length > 5;
            notifications.addAll(incoming.sublist(0, min(5, incoming.length)));
          } else if (state is MarkReadNotificationSuccess) {
            notifications
                    .firstWhereOrNull((notification) => notification.id == state.notificationId)
                    ?.read =
                true;
          }
        },
      ),
    );
  }
}

class _DeviceNotificationItem extends StatelessWidget {
  final HeaderNotificationBloc bloc;
  final HeaderNotification notification;

  const _DeviceNotificationItem(this.bloc, this.notification);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => bloc.add(MarkReadNotification(notificationId: notification.id!)),
      child: Container(
        color: notification.read == true ? Colors.white : const Color(0xFFF2F4FA),
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
                        getTimeStr(DateTime.parse(notification.createdAt ?? '')),
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

  /// WIDGETS
  String getTimeStr(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) {
      return 'Vừa xong';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} phút trước';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} giờ trước';
    } else if (dateTime.year == now.year) {
      return '${dateTime.day}/${dateTime.month}';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
