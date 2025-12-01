import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tab_shape_icon.dart';

class MobileTagItem extends StatelessWidget {
  final TagEntity tag;
  final bool isChecked;
  final Function(bool) onChecked;

  const MobileTagItem({
    super.key,
    required this.tag,
    required this.isChecked,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            height: 14,
            width: 14,
            child: Checkbox(
              activeColor: AppColors.secondary,
              onChanged: (value) => onChecked(value ?? false),
              side: BorderSide(color: AppColors.greyE2E8F0),
              value: isChecked,
            ),
          ),
          const SizedBox(width: 12),
          TagShapeIcon(color: tag.color, width: 18, height: 12),
          const SizedBox(width: 12),
          Text(tag.name, style: AppTypography.style(14)),
        ],
      ),
    );
  }
}
