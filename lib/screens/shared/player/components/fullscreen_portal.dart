import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

Future<void> defaultEnterNativeFullscreen() async {
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      await Future.wait([
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []),
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]),
      ]);
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await const MethodChannel(
        'com.alexmercerind/media_kit_video',
      ).invokeMethod('Utils.EnterNativeFullscreen');
    }
  } catch (exception, stacktrace) {
    debugPrint(exception.toString());
    debugPrint(stacktrace.toString());
  }
}

Future<void> defaultExitNativeFullscreen() async {
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      await Future.wait([
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values),
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]),
      ]);
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await const MethodChannel(
        'com.alexmercerind/media_kit_video',
      ).invokeMethod('Utils.ExitNativeFullscreen');
    }
  } catch (exception, stacktrace) {
    debugPrint(exception.toString());
    debugPrint(stacktrace.toString());
  }
}

class FullscreenPortal extends StatefulWidget {
  final Widget Function(bool) builder;
  final String tag;
  final bool isFullscreen;
  const FullscreenPortal({
    super.key,
    required this.builder,
    required this.tag,
    this.isFullscreen = false,
  });

  @override
  State<FullscreenPortal> createState() => FullscreenPortalState();
}

class FullscreenPortalState extends State<FullscreenPortal> {
  bool get isFullscreen => widget.isFullscreen;

  Future<void> toggleFullscreen(BuildContext context) async {
    if (isFullscreen) {
      await exitFullscreen(context);
    } else {
      await enterFullscreen(context);
    }
  }

  Future<void> enterFullscreen(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => Material(
          child: FullscreenPortal(tag: widget.tag, isFullscreen: true, builder: widget.builder),
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
    await defaultEnterNativeFullscreen();
  }

  Future<void> exitFullscreen(BuildContext context) async {
    await Navigator.of(context).maybePop();
    await defaultExitNativeFullscreen();
  }

  @override
  Widget build(BuildContext context) {
    final child = Hero(tag: widget.tag, child: widget.builder(isFullscreen));

    return widget.isFullscreen
        ? Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(child: child),
              FullScreenActions(onExit: () => exitFullscreen(context)),
            ],
          )
        : child;
  }

  @override
  dispose()  {
    defaultExitNativeFullscreen();
    super.dispose();
  }
}

class FullScreenActions extends StatefulWidget {
  const FullScreenActions({super.key, required this.onExit});
  final Function() onExit;

  @override
  State<FullScreenActions> createState() => _FullScreenActionsState();
}

class _FullScreenActionsState extends State<FullScreenActions> {
  final isVisible = ValueNotifier<bool>(true);
  Timer? _hideTimer;
  bool exited = false;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scheduleHide();
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    isVisible.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(seconds: 2), () {
      if (mounted && !exited) isVisible.value = false;
    });
  }

  void _exit() {
    exited = true;
    isVisible.value = false;
    _hideTimer?.cancel();
    widget.onExit();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isVisible,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Durations.medium1,
          top: value ? 0 : -78,
          left: 0,
          right: 0,
          child: KeyboardListener(
            focusNode: focusNode,
            autofocus: true,
            onKeyEvent: (event) {
              if (event.logicalKey == LogicalKeyboardKey.escape) _exit();
            },
            child: MouseRegion(
              onHover: (value) {
                if (exited) return;

                _hideTimer?.cancel();
                isVisible.value = true;
              },
              onExit: (value) => _scheduleHide(),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 1),
                margin: EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: _exit,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: Color.fromRGBO(0, 0, 0, 0.07),
                          offset: Offset(0, 4),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(AppAssets.icClose, width: 32, height: 32),
                        SizedBox(width: 10),
                        Text(
                          'Thoát chế độ xem toàn màn hình',
                          style: AppTypography.style(
                            18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
