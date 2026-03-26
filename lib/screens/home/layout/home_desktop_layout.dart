import 'package:flutter/material.dart';

import 'package:vms_flutter_client/core/app_router.dart';

import '../components/header.dart';
import '../components/sidebar.dart';

class HomeDesktopLayout extends StatelessWidget {
  final Widget content;
  final String currentPath;

  const HomeDesktopLayout({super.key, required this.content, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            // Sidebar
            if (currentPath != Routes.onboarding.path) Sidebar(currentPath: currentPath),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header
                  Header(currentPath: currentPath),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1, top: 1),
                      child: content,
                    ),
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
