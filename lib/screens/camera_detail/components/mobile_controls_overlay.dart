import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';

import '../../shared/player/player_controller.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../widgets/mobile_control_speed.dart';

class MobileControlsOverlay extends StatefulWidget {
  const MobileControlsOverlay({
    super.key,
    required this.name,
    required this.isFullscreen,
    required this.mode,
    required this.detailBloc,
    this.initialVisible = false,
    this.bottomBuilder,
    required this.state,
  });
  final String name;
  final bool isFullscreen;
  final CameraDetailMode mode;
  final CameraDetailBloc detailBloc;
  final bool initialVisible;
  final Widget Function()? bottomBuilder;
  final PlayerState state;

  @override
  State<MobileControlsOverlay> createState() => _MobileControlsOverlayState();
}

class _MobileControlsOverlayState extends State<MobileControlsOverlay> {
  late final ValueNotifier<bool> _visible = ValueNotifier(widget.initialVisible);
  late bool _isVisible = false;
  Timer? _hideTimer;

  /* Getter */
  PlayerController get playerController => widget.detailBloc.state.playerController;
  ValueNotifier<bool>? get isSeeking => playerController.isSeeking?.call();
  ValueNotifier<PlayerStatus>? get status => playerController.status?.call();

  @override
  void initState() {
    _isVisible = status?.value == PlayerStatus.paused;
    status?.addListener(_onPause);
    isSeeking?.addListener(_onSeeking);
    _visible.addListener(() {
      if (_visible.value) _scheduleHide();
    });
    super.initState();
  }

  @override
  void dispose() {
    status?.removeListener(_onPause);
    isSeeking?.removeListener(_onSeeking);
    _visible.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  // Đang seeking thì hiển thị lên
  void _onSeeking() {
    _isVisible = isSeeking?.value == true;
    if (_isVisible) {
      Future.delayed(Duration.zero, () => _visible.value = true);
    } else if (_visible.value) {
      _scheduleHide();
    }
  }

  // Đang pause thì hiển thị lên
  void _onPause() {
    _isVisible = status?.value == PlayerStatus.paused;
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

  void _onCall(VoidCallback onTap) {
    _scheduleHide();
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        // [IMPORTANT] Cho phép các event chạm được truyền qua widget này (kể cả khi click vào khoảng trắng)
        behavior: HitTestBehavior.translucent,
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
              alignment: Alignment.center,
              // [IMPORTANT] Không set color để InteractiveViewer bên dưới có thể nhận
              // HitTestBehavior.translucent --> giúp bắt đc event khi chạm vào khoảng trắng (trong suốt)
              // color: Colors.transparent,
              child: IgnorePointer(
                ignoring: !visible,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (widget.isFullscreen) _topActions(),
                    if (widget.state == PlayerState.initialized)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 0,
                        child: widget.mode.isPlayback
                            ? _centerActionsForPlayback()
                            : _centerActionsForLive(),
                      ),
                    if (widget.isFullscreen) _rightActions(),
                    if (widget.bottomBuilder != null && widget.isFullscreen)
                      Positioned(bottom: 0, left: 0, right: 0, child: widget.bottomBuilder!()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ).let(
      (child) => widget.isFullscreen
          ?
            // Fullscreen thì đợi quay ngang thì bắt đầu build (width của timeline sẽ chuẩn khi addPostFrameCallback được gọi)
            OrientationBuilder(
              builder: (context, orientation) => orientation == Orientation.portrait
                  ? Center(child: CupertinoActivityIndicator(color: AppColors.white))
                  : child,
            )
          : child,
    );
  }

  Widget _centerActionsForPlayback() {
    bool fullScreen = widget.isFullscreen;

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!fullScreen) ...[
            _actionItem(
              onTap: () => _onCall(() => playerController.seek?.call(Duration(seconds: -30))),
              icon: AppAssets.icMobileBackward30,
              backgroundColor: Colors.black.withValues(alpha: 0.6),
              iconColor: AppColors.white,
              iconSize: 30,
              parentSize: 42,
              splashColor: Colors.grey
            ),
            SizedBox(width: 20),
          ],

          ValueListenableBuilder(
            valueListenable: isSeeking!,
            builder: (context, _isSeeking, child) {
              return ValueListenableBuilder(
                valueListenable: status!,
                builder: (context, status, child) {
                  return _actionItem(
                    onTap: () => _onCall(() {
                      if (_isSeeking) return;
                      playerController.togglePlay?.call();
                    }),
                    icon: status == PlayerStatus.paused
                        ? AppAssets.icPlayMobile
                        : AppAssets.icPauseMobile,
                    backgroundColor: fullScreen
                        ? Color.fromRGBO(245, 245, 245, 0.9)
                        : Colors.black.withValues(alpha: 0.6),
                    iconSize: fullScreen ? 32 : 28,
                    parentSize: fullScreen ? 72 : 55,
                    iconColor: fullScreen ? Colors.black : Colors.white,
                    child: _isSeeking
                        ? CupertinoActivityIndicator(
                            color: fullScreen ? Colors.black : Colors.white,
                          )
                        : null,
                  );
                },
              );
            },
          ),

          if (!fullScreen) ...[
            SizedBox(width: 20),
            _actionItem(
              onTap: () => _onCall(() => playerController.seek?.call(Duration(seconds: 30))),
              icon: AppAssets.icMobileForward30,
              backgroundColor: Colors.black.withValues(alpha: 0.6),
              iconColor: AppColors.white,
              iconSize: 30,
              parentSize: 42,
            ),
          ],
        ],
      ),
    );
  }

  Widget _centerActionsForLive() {
    return ValueListenableBuilder(
      valueListenable: status!,
      builder: (context, status, child) {
        if (status == PlayerStatus.playing) return const SizedBox.shrink();

        return Center(
          child: _actionItem(
            onTap: () => _onCall(() => playerController.togglePlay?.call()),
            icon: AppAssets.icPlayMobile,
            backgroundColor: Color.fromRGBO(245, 245, 245, 0.9),
            iconSize: 32,
            parentSize: 72,
            iconColor: Colors.black,
          ),
        );
      },
    );
  }

  Widget _rightActions() {
    return Positioned(
      right: 20,
      bottom: 0,
      top: 0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _actionItem(
              parentSize: 46,
              icon: AppAssets.icCamera01,
              onTap: () => _onCall(
                () => widget.detailBloc.add(
                  TakeSnapshot(
                    onSuccess: () => ToastUtil.toastSuccess(
                      title: Text(
                        "Đã lưu ảnh chụp",
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              iconSize: 28,
              iconColor: Colors.black,
              backgroundColor: Color.fromRGBO(245, 245, 245, 0.9),
            ),

            if (widget.mode.isPlayback) ...[
              SizedBox(height: 20),
              BlocSelector<CameraDetailBloc, CameraDetailState, double>(
                bloc: widget.detailBloc,
                selector: (state) => state.speed,
                builder: (context, speed) => Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: MobileControlSpeed(
                    speed: speed,
                    onSpeedChanged: (spd) => widget.detailBloc.add(ChangeSpeed(spd)),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _topActions() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
        child: Row(
          children: [
            _actionItem(
              onTap: () => Navigator.of(context).maybePop(),
              icon: AppAssets.icArrowCircleLeft,
              iconColor: AppColors.white,
              iconSize: 24,
              parentSize: 48,
              splashColor: Colors.grey.withValues(alpha: 0.25),
            ),
            // SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.name,
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                maxLines: 1,
              ),
            ),
            BlocSelector<CameraDetailBloc, CameraDetailState, double>(
              bloc: widget.detailBloc,
              selector: (state) => state.volume,
              builder: (context, volume) => _actionItem(
                onTap: () => widget.detailBloc.add(ToggleMute()),
                icon: volume == 0 ? AppAssets.icVolumeMutedFullscreen : AppAssets.icVolume,
                iconColor: AppColors.white,
                iconSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionItem({
    required String icon,
    required VoidCallback onTap,
    double? parentSize,
    required double iconSize,
    Color? iconColor,
    Color? backgroundColor,
    Widget? child,
    Color? splashColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: parentSize == null ? null : splashColor ?? AppColors.primary,
        highlightColor: parentSize == null ? null : splashColor ?? AppColors.primary,
        focusColor: parentSize == null ? null : splashColor ?? AppColors.primary,
        hoverColor: parentSize == null ? null : splashColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: parentSize,
          height: parentSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
          child:
              child ??
              SvgPicture.asset(
                icon,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                    : null,
                width: iconSize,
                height: iconSize,
              ),
        ),
      ),
    );
  }
}
