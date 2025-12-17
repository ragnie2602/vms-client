import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class CustomTabBar extends StatefulWidget {
  final TabController controller;
  final List<String> tabs;

  const CustomTabBar({super.key, required this.controller, required this.tabs});

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
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.tabs.length, (index) {
        final isSelected = widget.controller.index == index;

        return Ink(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : AppColors.greyFBFBFB,
            border: isSelected ? null : Border.all(color: AppColors.greyF2F4FA),
          ),
          child: InkWell(
            onTap: () => widget.controller.animateTo(index),
            borderRadius: BorderRadius.circular(4),
            hoverColor: isSelected
                ? AppColors.secondary.withOpacity(0.9)
                : AppColors.greyF2F4FA.withOpacity(0.5),
            splashColor: isSelected
                ? Colors.white.withOpacity(0.2)
                : AppColors.grey64748B.withOpacity(0.1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
              child: Text(
                widget.tabs[index],
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.grey64748B,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
