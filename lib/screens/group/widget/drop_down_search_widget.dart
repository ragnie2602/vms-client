import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

class AppDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T)? itemAsString;
  final ValueChanged<T?> onChanged;
  final bool enabled;
  final String? hintTextSearch;
  final String? hintTextDropdown;
  final String? label;
  final double? borderRadius;
  const AppDropdownSearch({
    super.key,
    required this.items,
    required this.onChanged,
    this.itemAsString,
    this.selectedItem,
    this.enabled = true,
    this.hintTextSearch,
    this.hintTextDropdown,
    this.label,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  label ?? '',
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              )
            : const SizedBox(),
        DropdownSearch<T>(
          compareFn: (item1, item2) {
            if (T is DeviceGroup) {
              return (item1 as DeviceGroup).groupId ==
                  (item2 as DeviceGroup).groupId;
            } else {
              // từng loại T khác nhau tự địng nghĩa
              return item1.toString() == item2.toString();
            }
          },
          items: (filter, loadProps) => items,
          enabled: enabled,
          selectedItem: selectedItem,
          itemAsString: itemAsString,
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              hintText: hintTextDropdown,
              hintStyle: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey92929D,
              ),
              suffixIcon: SvgPicture.asset(
                AppAssets.icArrowChevronDown,
                color: Colors.pink,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 1),
                ),
                borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 1),
                ),
                borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 1),
                ),
                borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: hintTextSearch,
                hintStyle: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey92929D,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius ?? 1),
                  ),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius ?? 1),
                  ),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                ),
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
