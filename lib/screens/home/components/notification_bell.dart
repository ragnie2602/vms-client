import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/bloc/header_notification_bloc.dart';
import 'package:vms_flutter_client/screens/home/widgets/device_notification_popup.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  late final HeaderNotificationBloc bloc;

  final GlobalKey _bellKey = GlobalKey();

  OverlayEntry? _notificationOverlay;
  Timer? getNotiTimer;

  int unreadCount = 0;

  @override
  void initState() {
    super.initState();

    bloc = context.read()..add(GetNotifications());
    getNotiTimer = Timer.periodic(Duration(seconds: 5), (timer) => bloc.add(GetNotifications()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HeaderNotificationBloc, HeaderNotificationState>(
      builder: (context, state) {
        final icon = SvgPicture.asset(AppAssets.icBell, width: 20, height: 20);

        return InkWell(
          key: _bellKey,
          onTap: _toggleNotificationPopup,
          borderRadius: BorderRadius.circular(20),
          child: unreadCount > 0
              ? Badge.count(
                  count: unreadCount,
                  padding: EdgeInsets.all(2),
                  backgroundColor: Color(0xFF21CCC3),
                  textStyle: AppTypography.style(
                    9,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  child: icon,
                )
              : icon,
        );
      },
      listener: (context, state) {
        if (state is GetNotificationsSuccess) unreadCount = state.unreadCount;
        if (state is MarkReadNotificationSuccess) unreadCount--;
      },
    );
  }

  @override
  void dispose() {
    _hideNotificationPopup();
    getNotiTimer?.cancel();
    super.dispose();
  }

  void _toggleNotificationPopup() {
    if (_notificationOverlay != null) {
      _hideNotificationPopup();
    } else {
      _showNotificationPopup();
    }
  }

  void _showNotificationPopup() {
    getNotiTimer?.cancel();

    final renderBox = _bellKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenWidth = MediaQuery.of(context).size.width;

    _notificationOverlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideNotificationPopup,
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: offset.dy + size.height + 8,
            right: screenWidth - offset.dx - size.width,
            child: Material(
              color: Colors.transparent,
              child: DeviceNotificationPopup(bloc: bloc, onClose: _hideNotificationPopup),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_notificationOverlay!);
  }

  void _hideNotificationPopup() {
    _notificationOverlay?.remove();
    _notificationOverlay = null;

    getNotiTimer = Timer.periodic(Duration(seconds: 5), (timer) => bloc.add(GetNotifications()));
  }
}
