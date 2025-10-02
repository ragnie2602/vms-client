import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PlatformStyle { material, cupertino }

enum PlatformType { android, ios, macos, windows, web }

class PlatformWidget extends StatelessWidget {
  const PlatformWidget._internal({
    super.key,
    this.onAndroid,
    this.onIOS,
    this.onMacOS,
    this.onWindows,
    this.onWeb,
    this.onMaterial,
    this.onCupertino,
    this.onDesktop,
    this.onMobile,
  });

  factory PlatformWidget.builder({
    Key? key,
    required Function(BuildContext) onAndroid,
    required Function(BuildContext) onIOS,
    required Function(BuildContext) onMacOS,
    required Function(BuildContext) onWindows,
    Function(BuildContext)? onWeb,
  }) => PlatformWidget._internal(
    key: key,
    onAndroid: onAndroid,
    onIOS: onIOS,
    onMacOS: onMacOS,
    onWindows: onWindows,
    onWeb: onWeb,
  );

  factory PlatformWidget.groupBuilder({
    Key? key,
    required Function(BuildContext) onDesktop,
    required Function(BuildContext) onMobile,
    Function(BuildContext)? onWeb,
  }) => PlatformWidget._internal(key: key, onDesktop: onDesktop, onMobile: onMobile, onWeb: onWeb);

  factory PlatformWidget.styleBuilder({
    Key? key,
    required Function(BuildContext) onMaterial,
    required Function(BuildContext) onCupertino,
  }) => PlatformWidget._internal(key: key, onMaterial: onMaterial, onCupertino: onCupertino);

  final Function(BuildContext)? onAndroid;
  final Function(BuildContext)? onIOS;
  final Function(BuildContext)? onMacOS;
  final Function(BuildContext)? onWindows;
  final Function(BuildContext)? onWeb;
  final Function(BuildContext)? onMaterial;
  final Function(BuildContext)? onCupertino;
  final Function(BuildContext)? onDesktop;
  final Function(BuildContext)? onMobile;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return onMaterial?.call(context) ?? onWeb?.call(context) ?? _error();

    return switch (defaultTargetPlatform) {
      TargetPlatform.android =>
        onMobile?.call(context) ??
            onMaterial?.call(context) ??
            onAndroid?.call(context) ??
            _error(),
      TargetPlatform.windows =>
        onDesktop?.call(context) ??
            onMaterial?.call(context) ??
            onWindows?.call(context) ??
            _error(),
      TargetPlatform.iOS =>
        onMobile?.call(context) ?? onCupertino?.call(context) ?? onIOS?.call(context) ?? _error(),
      TargetPlatform.macOS =>
        onDesktop?.call(context) ??
            onCupertino?.call(context) ??
            onMacOS?.call(context) ??
            _error(),
      _ => _error("Unsupported platform ($defaultTargetPlatform)"),
    };
  }

  Widget _error([String message = "Empty builder!"]) {
    return Center(child: Text(message));
  }
}
