import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PlatformStyle { material, cupertino }

enum PlatformType { android, ios, macos, windows, web }

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder._internal({super.key, this.onDesktop, this.onMobile});

  factory PlatformBuilder.builder({
    Key? key,
    required Function(BuildContext) onDesktop,
    required Function(BuildContext) onMobile,
  }) => PlatformBuilder._internal(
    key: key,
    onDesktop: onDesktop,
    onMobile: onMobile,
  );

  final Function(BuildContext)? onDesktop;
  final Function(BuildContext)? onMobile;

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      (TargetPlatform.android || TargetPlatform.iOS) =>
        onMobile?.call(context) ?? _error(),
      (TargetPlatform.linux ||
          TargetPlatform.macOS ||
          TargetPlatform.windows) =>
        onDesktop?.call(context) ?? _error(),
      _ => _error("Unsupported platform ($defaultTargetPlatform)"),
    };
  }

  Widget _error([String message = "Empty builder!"]) {
    return Center(child: Text(message));
  }
}
