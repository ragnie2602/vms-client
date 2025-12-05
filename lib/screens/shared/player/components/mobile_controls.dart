import 'dart:async';

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

import '../player_controller.dart';

class MobileControls extends StatefulWidget {
  const MobileControls({
    super.key,
    required this.status,
    required this.isSeeking,
    required this.togglePlay,
    required this.seek,
    this.initialVisible = false,
  });
  final ValueNotifier<PlayerStatus> status;
  final ValueNotifier<bool> isSeeking;
  final Function() togglePlay;
  final Function(Duration) seek;
  final bool initialVisible;

  @override
  State<MobileControls> createState() => _MobileControlsState();
}

class _MobileControlsState extends State<MobileControls> {
  late final ValueNotifier<bool> _visible = ValueNotifier(widget.initialVisible);
  late bool _isVisible = widget.status.value == PlayerStatus.paused;
  Timer? _hideTimer;

  @override
  void initState() {
    widget.status.addListener(_onPause);
    widget.isSeeking.addListener(_onSeeking);
    _visible.addListener(() {
      if (_visible.value) _scheduleHide();
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.status.removeListener(_onPause);
    widget.isSeeking.removeListener(_onSeeking);
    _visible.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _onSeeking() {
    _isVisible = widget.isSeeking.value;
    if (_isVisible) {
      Future.delayed(Duration.zero, () => _visible.value = true);
    } else if (_visible.value) {
      _scheduleHide();
    }
  }

  void _onPause() {
    _isVisible = widget.status.value == PlayerStatus.paused;
    if (_isVisible) {
      Future.delayed(Duration.zero, () => _visible.value = true);
    } else if (_visible.value) {
      _scheduleHide();
    }
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(seconds: 5), () => _visible.value = _isVisible);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Future.delayed(Duration.zero, () => _visible.value = !_visible.value),
      child: ValueListenableBuilder(
        valueListenable: _visible,
        builder: (context, visible, child) => AnimatedOpacity(
          curve: Curves.fastOutSlowIn,
          opacity: visible ? 1.0 : 0.0,
          duration: Durations.medium1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.15)),
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  _buildControlItem(
                    icon: AppAssets.icMobileBackward30,
                    onTap: () {
                      _scheduleHide();
                      widget.seek(Duration(seconds: -30));
                    },
                    size: 42,
                    iconSize: 30,
                    disabled: !visible,
                  ),

                  ValueListenableBuilder(
                    valueListenable: widget.isSeeking,
                    builder: (context, isSeeking, child) {
                      return ValueListenableBuilder(
                        valueListenable: widget.status,
                        builder: (context, status, child) {
                          return _buildControlItem(
                            icon: status == PlayerStatus.paused
                                ? AppAssets.icPlayMobile
                                : AppAssets.icPauseMobile,
                            onTap: () {
                              _scheduleHide();
                              if (isSeeking) return;
                              widget.togglePlay();
                            },
                            size: 55,
                            iconSize: 28,
                            iconColor: Colors.white,
                            disabled: !visible,
                            child: isSeeking
                                ? CupertinoActivityIndicator(color: Colors.white)
                                : null,
                          );
                        },
                      );
                    },
                  ),

                  _buildControlItem(
                    icon: AppAssets.icMobileForward30,
                    onTap: () {
                      _scheduleHide();
                      widget.seek(Duration(seconds: 30));
                    },
                    size: 42,
                    iconSize: 30,
                    disabled: !visible,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControlItem({
    required String icon,
    required VoidCallback onTap,
    required double iconSize,
    required double size,
    Color? iconColor,
    bool disabled = false,
    Widget? child,
  }) {
    return IgnorePointer(
      ignoring: disabled,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
          width: size,
          height: size,
          alignment: Alignment.center,
          child:
              child ??
              SvgPicture.asset(
                icon,
                width: iconSize,
                height: iconSize,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                    : null,
              ),
        ),
      ),
    );
  }
}
