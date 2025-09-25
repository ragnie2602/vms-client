import 'package:flutter/material.dart';
import 'layout/home_desktop_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeDesktopLayout(content: body)),
    );
  }
}
