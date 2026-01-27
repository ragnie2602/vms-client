import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class CustomTabBar extends StatefulWidget {
  final TabController controller;

  const CustomTabBar({super.key, required this.controller});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Item(
            isSelected: widget.controller.index == 0,
            onTap: () => widget.controller.animateTo(0),
            title: 'Tất cả',
          ),
        ),
        Expanded(
          child: _Item(
            isSelected: widget.controller.index == 1,
            onTap: () => widget.controller.animateTo(1),
            title: 'Cam đang xem',
          ),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool isSelected;

  const _Item({required this.onTap, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        hoverColor: isSelected
            ? AppColors.secondary.withOpacity(0.9)
            : AppColors.greyF2F4FA.withOpacity(0.5),
        onTap: onTap,
        splashColor: isSelected
            ? Colors.white.withOpacity(0.2)
            : AppColors.grey64748B.withOpacity(0.1),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? AppColors.white : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            title,
            style: AppTypography.style(
              14,
              color: isSelected ? AppColors.black111827 : AppColors.blue64748B,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
