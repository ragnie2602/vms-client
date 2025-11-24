import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';

import '../components/header.dart';

class HomeMobileLayout extends StatelessWidget {
  final Widget content;

  const HomeMobileLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 1, top: 1),
              child: content,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(Routes.monitoring.path)) return 0;
    if (location.startsWith(Routes.users.path)) return 1;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(Routes.monitoring.name);
        break;
      case 1:
        context.goNamed(Routes.users.name);
        break;
    }
  }
}
