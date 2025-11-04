// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';

typedef _SpeedData = ({String label, double value});

class ControlSpeedBox extends StatefulWidget {
  const ControlSpeedBox({super.key});

  @override
  State<ControlSpeedBox> createState() => _ControlSpeedBoxState();
}

class _ControlSpeedBoxState extends State<ControlSpeedBox> {
  late final _menuShowing = ValueNotifier<bool>(false);

  late final _map = <double, _SpeedData>{
    0.5: (label: "0.5", value: 0.5),
    1: (label: "Chuẩn", value: 1),
    2: (label: "2", value: 2),
    4: (label: "4", value: 4),
    8: (label: "8", value: 8),
    16: (label: "16", value: 16),
  };

  @override
  void dispose() {
    _menuShowing.dispose();
    super.dispose();
  }

  void _showMenu() {
    _menuShowing.value = true;
    showPopover(
      barrierColor: Colors.black.withValues(alpha: 0.1),
      context: context,
      bodyBuilder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: _map.values
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

  void _onItemTap(double value) {
    Navigator.of(context, rootNavigator: true).pop();
    context.read<CameraDetailBloc>().add(ChangeSpeed(value));

    if (value >= 8) {
      ToastUtil.toastWarning(
        context: context,
        autoCloseDuration: 5,
        title: Text(
          "Lưu ý: Tốc độ tua nhanh này yêu cầu băng thông mạng rất lớn nên hình ảnh video có thể bị giật, chậm. Vui lòng chọn chế độ thấp hơn nếu gặp vấn đề khi xem video.",
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            lineHeight: 1.25,
            letterSpacing: 0.15,
          ),
          maxLines: 6,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showMenu,
      borderRadius: BorderRadius.circular(3),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyE2E8F0),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
        child: Row(
          children: <Widget>[
            BlocSelector<CameraDetailBloc, CameraDetailState, double>(
              selector: (state) => state.speed,
              builder: (context, speed) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 44),
                  child: Text(
                    _map[speed]?.label ?? "",
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
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

  Widget _buildMenuItem(_SpeedData data, {showTopBorder = true}) {
    bool isSelected = data.value == context.read<CameraDetailBloc>().state.speed;

    return InkWell(
      onTap: () => _onItemTap(data.value),
      child: Container(
        constraints: BoxConstraints(minWidth: 90),
        padding: EdgeInsets.fromLTRB(4, 8, 16, 8),
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
              data.label,
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
