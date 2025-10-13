import 'package:flutter/material.dart';

import '../components/header.dart';
import '../components/sidebar.dart';

class HomeDesktopLayout extends StatelessWidget {
  final Widget content;

  const HomeDesktopLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Sidebar
        const Sidebar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header
              const Header(),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 1, top: 1),
                child: content,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
