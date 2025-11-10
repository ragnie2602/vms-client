import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_stream.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';

class ControlSource extends StatefulWidget {
  const ControlSource({super.key, required this.disabled});
  final bool disabled;

  @override
  State<ControlSource> createState() => _ControlSourceState();
}

class _ControlSourceState extends State<ControlSource> {
  late final _menuShowing = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _menuShowing.dispose();
    super.dispose();
  }

  void _showMenu() {
    final streams = context.read<CameraDetailBloc>().state.camera?.stream.streamLinks ?? [];
    if (streams.isEmpty) return;

    _menuShowing.value = true;
    showPopover(
      barrierColor: Colors.black.withValues(alpha: 0.1),
      context: context,
      bodyBuilder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: streams
            .mapIndexed((index, e) => _buildMenuItem(e, showTopBorder: index != 0))
            .toList(),
      ),
      onPop: () => _menuShowing.value = false,
      direction: PopoverDirection.top,
      arrowWidth: 10,
      arrowHeight: 5,
      arrowDyOffset: -3.5,
      radius: 5,
    );
  }

  void _onItemTap(CameraStreamUrlStream value) {
    Navigator.of(context, rootNavigator: true).pop();
    context.read<CameraDetailBloc>().add(ChangeStream(value));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disabled ? null : _showMenu,
      borderRadius: BorderRadius.circular(3),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyE2E8F0),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: <Widget>[
            BlocSelector<CameraDetailBloc, CameraDetailState, CameraStreamUrlStream?>(
              selector: (state) => state.stream,
              builder: (context, stream) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90),
                  child: Text(
                    stream?.nameOfStream ?? "",
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: widget.disabled ? AppColors.grey64748B : AppColors.blackOrWhite,
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 4),

            ValueListenableBuilder(
              valueListenable: _menuShowing,
              builder: (context, isShowing, _) => TweenAnimationBuilder<double>(
                tween: Tween(begin: isShowing ? 0 : 180, end: isShowing ? 180 : 0),
                duration: Durations.medium2,
                builder: (context, angle, child) {
                  return Transform.rotate(
                    angle: angle * (math.pi / 180), // đổi độ sang radian
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  AppAssets.icArrowChevronUp,
                  width: 12,
                  height: 12,
                  colorFilter: ColorFilter.mode(AppColors.blackOrWhite, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(CameraStreamUrlStream stream, {showTopBorder = true}) {
    bool isSelected = stream == context.read<CameraDetailBloc>().state.stream;

    return InkWell(
      onTap: () => _onItemTap(stream),
      child: Container(
        constraints: BoxConstraints(minWidth: 108),
        padding: EdgeInsets.fromLTRB(4, 8, 12, 8),
        decoration: showTopBorder
            ? BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.greyF2F4FA)),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: isSelected
                  ? SvgPicture.asset(
                      AppAssets.icCheck,
                      colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    )
                  : SizedBox.shrink(),
            ),
            SizedBox(width: 4),
            Text(
              stream.nameOfStream,
              style: AppTypography.style(
                13,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.black : AppColors.grey64748B,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
