import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/widgets/device_notification_popup.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  final GlobalKey _bellKey = GlobalKey();

  OverlayEntry? _notificationOverlay;
  Timer? getNotiTimer;

  @override
  void initState() {
    super.initState();
    getNotiTimer = Timer.periodic(Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: _bellKey,
      onTap: _toggleNotificationPopup,
      borderRadius: BorderRadius.circular(20),
      child: Badge.count(
        count: 01,
        padding: EdgeInsets.all(2),
        backgroundColor: Color(0xFF21CCC3),
        textStyle: AppTypography.style(9, fontWeight: FontWeight.w600, color: Colors.white),
        child: SvgPicture.asset(AppAssets.icBell, width: 20, height: 20),
      ),
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
              child: DeviceNotificationPopup(
                onClose: _hideNotificationPopup,
                onViewMore: _hideNotificationPopup,
              ),
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
  }
}
