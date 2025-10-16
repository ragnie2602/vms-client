import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

class GroupNode extends StatelessWidget {
  const GroupNode({
    super.key,
    required this.group,
    this.onTap,
    this.onToggleExpansion,
    this.actions,
    this.isExpand,
    this.isSelected,
  });
  final DeviceGroup group;
  final Function()? onTap;
  final Function()? onToggleExpansion;
  final Widget? actions;
  final bool? isExpand;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
        splashColor: Colors.transparent,
        onTap: onTap ?? () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (constraints.maxWidth >= 20 + 20) ...[
                // level 1 -> icon folder
                // level 2 -> collapse/expand
                // level 3 -> no icon
                SvgPicture.asset(
                  group.level == 0
                      ? AppAssets.icRootFolder
                      : (group.groups.isEmpty || isExpand == true)
                      ? AppAssets.icCollapse
                      : AppAssets.icExpand,
                  width: group.level == 0
                      ? 20
                      : group.level == 2
                      ? 0
                      : 12,
                  height: group.level == 0
                      ? 20
                      : group.level == 2
                      ? 0
                      : 12,
                ).let((child) {
                  return onToggleExpansion != null
                      ? GestureDetector(onTap: onToggleExpansion, child: child)
                      : child;
                }),
              ],
              if (constraints.maxWidth >= 20 + 20 + 8) SizedBox(width: 8),
              Expanded(
                child: ColoredBox(
                  color: isSelected == true
                      ? AppColors.greyF2F4FA
                      : Colors.transparent,
                  child: Text(
                    group.name,
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackOrWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),

              if (actions != null && constraints.maxWidth >= 12) actions!,
            ],
          ),
        ),
      ),
    );
  }
}
