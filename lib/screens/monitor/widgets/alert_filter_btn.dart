import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/shared/popup_menu.dart';
import 'package:vms_flutter_client/screens/shared/primary_checkbox.dart';

class AlertFilterBtn extends StatefulWidget {
  const AlertFilterBtn({super.key});

  @override
  State<AlertFilterBtn> createState() => _AlertFilterBtnState();
}

class _AlertFilterBtnState extends State<AlertFilterBtn> {
  late final CustomPopupMenuController _controller = CustomPopupMenuController();

  final List<String> _selected = ['Cảnh báo hút thuốc', 'Sử dụng điện thoại'];
  final List<String> _filterOptions = [
    'Cảnh báo xâm nhập',
    'Cảnh báo hút thuốc',
    'Sử dụng điện thoại',
    'Cảnh báo tụ tập',
    'Cảnh báo cháy',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      barrierColor: Colors.transparent,
      controller: _controller,
      hideOnItemTap: false,
      horizontalMargin: 0,
      menuBuilder: () => _buildMenu(),
      position: PreferredPosition.bottom,
      pressType: PressType.singleClick,
      showArrow: false,
      verticalMargin: -60,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          color: _selected.isNotEmpty ? AppColors.blueE7F3FF : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getLabel(),
              style: AppTypography.style(
                13,
                color: _selected.isNotEmpty ? AppColors.blue005AA9 : AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 6),
            _selected.isNotEmpty
                ? InkWell(
                    onTap: () => setState(() => _selected.clear()),
                    child: SvgPicture.asset(AppAssets.icCloseRounded, height: 12, width: 12),
                  )
                : SvgPicture.asset(AppAssets.icArrowdown, height: 4, width: 8),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMenu() {
    return StatefulBuilder(
      builder: (context, menuSetState) {
        void _select(String option) {
          setState(() {
            if (_selected.contains(option)) {
              _selected.remove(option);
            } else {
              _selected.add(option);
            }
          });
          menuSetState(() {});
        }

        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.white),
          padding: const EdgeInsets.all(15),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: _filterOptions.asMap().entries.map((entry) {
                final option = entry.value;
                final isSelected = _selected.contains(option);

                return InkWell(
                  onTap: () => _select(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryCheckbox(onChanged: (v) => _select(option), value: isSelected),
                        const SizedBox(width: 8),
                        Text(
                          option,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  String getLabel() {
    if (_selected.length == 1) {
      return _selected[0].split(' ').sublist(2).join(' ').capitalizeFirstLetter;
    }
    if (_selected.length > 1) return '${_selected.length} loại';
    return 'Lọc';
  }
}
