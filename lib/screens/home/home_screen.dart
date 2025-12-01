import 'package:flutter/material.dart';
import 'package:vms_flutter_client/screens/home/layout/home_mobile_layout.dart';
import 'package:vms_flutter_client/screens/shared/platform_builder.dart';
import 'layout/home_desktop_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.body, required this.currentPath});

  final Widget body;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder.builder(
      onDesktop: (context) => HomeDesktopLayout(content: body),
      onMobile: (context) => HomeMobileLayout(key: ValueKey(currentPath), content: body, currentPath: currentPath),
    );
  }
}
