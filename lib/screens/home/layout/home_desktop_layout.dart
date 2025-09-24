import 'package:flutter/material.dart';

import '../components/header.dart';
// import '../components/sidebar.dart';

class HomeDesktopLayout extends StatelessWidget {
  final Widget content;

  HomeDesktopLayout({super.key, required this.content});

  late final cursor = ValueNotifier(MouseCursor.defer);
  // void _onCursorChange(MouseCursor cursor) => this.cursor.value = cursor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cursor,
      builder: (context, value, child) => MouseRegion(cursor: value, child: child),
      child: Row(
        children: <Widget>[
          // Sidebar
          // Sidebar(
          //   maxWidth: MediaQuery.of(context).size.width * 0.15,
          //   onCursorChange: _onCursorChange,
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Header
                Header(),
                Expanded(child: content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
