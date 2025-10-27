import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class PlayerFullScreen extends StatefulWidget {
  const PlayerFullScreen({super.key, required this.onExit});
  final Function() onExit;

  @override
  State<PlayerFullScreen> createState() => _PlayerFullScreenState();
}

class _PlayerFullScreenState extends State<PlayerFullScreen> {
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
