import 'package:flutter/material.dart';
import 'package:vms_flutter_client/screens/home/layout/home_mobile_layout.dart';
import 'package:vms_flutter_client/screens/shared/platform_builder.dart';
import 'layout/home_desktop_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PlatformBuilder.builder(
          onDesktop: (context) => HomeDesktopLayout(content: body),
          onMobile: (context) => HomeMobileLayout(content: body),
        ),
      ),
    );
  }
}
