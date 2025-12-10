import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tab_shape_icon.dart';

class MobileTagItem extends StatefulWidget {
  final TagEntity tag;
  final bool initValue;
  final Function(bool) onChecked;

  const MobileTagItem({
    super.key,
    required this.tag,
    required this.initValue,
    required this.onChecked,
  });

  @override
  State<MobileTagItem> createState() => _MobileTagItemState();
}

class _MobileTagItemState extends State<MobileTagItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    if (mounted) isChecked = widget.initValue;
  }

  @override
  void didUpdateWidget(MobileTagItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initValue != widget.initValue) setState(() => isChecked = widget.initValue);
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChecked(!isChecked);
        setState(() => isChecked = !isChecked);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            SizedBox(
              height: 14,
              width: 14,
              child: Checkbox(
                activeColor: AppColors.secondary,
                onChanged: (_) {},
                side: BorderSide(color: AppColors.greyE2E8F0),
                value: isChecked,
              ),
            ),
            const SizedBox(width: 12),
            TagShapeIcon(color: widget.tag.color, width: 18, height: 12),
            const SizedBox(width: 12),
            Text(widget.tag.name, style: AppTypography.style(14)),
          ],
        ),
      ),
    );
  }
}
