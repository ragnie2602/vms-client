import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class CustomCommonDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;
  final String Function(T) itemAsString;
  final String? lable;
  final EdgeInsetsGeometry? padding;
  final TextStyle? contentTextStyle;
  final bool? isRequired;
  final bool? isErr;
  final Widget? hint;
  final double? width;
  final bool Function(T?, T?)? compareFn;
  final double? height;

  const CustomCommonDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemAsString,
    this.lable,
    this.padding,
    this.contentTextStyle,
    this.isRequired,
    this.isErr,
    this.hint,
    this.width,
    this.compareFn,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final field = DropdownSearch<T>(
      items: (filter, loadProps) => items,
      selectedItem: value,
      itemAsString: itemAsString,
      compareFn: compareFn ?? (a, b) => a == b,
      dropdownBuilder: (context, selectedItem) {
        if (selectedItem == null) {
          return hint ?? const SizedBox.shrink();
        }
        return Text(itemAsString(selectedItem), style: contentTextStyle);
      },
      onChanged: onChanged,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.asset(
              AppAssets.icDropdown,
              colorFilter: ColorFilter.mode(
                AppColors.grey94A3B8,
                BlendMode.srcIn,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: BorderSide(
              color: isErr == true ? Colors.red : AppColors.greyE2E8F0,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: BorderSide(
              color: isErr == true ? Colors.red : AppColors.greyE2E8F0,
              width: 1,
            ),
          ),
        ),
      ),
      popupProps: PopupProps.menu(showSearchBox: false),
    );

    Widget wrapped = field;
    if (width != null || height != null) {
      wrapped = SizedBox(width: width, height: height, child: field);
    }
    return padding != null
        ? Padding(padding: padding!, child: wrapped)
        : wrapped;
  }
}
