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
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: hint,
      focusColor: Colors.white,
      dropdownColor: Colors.white,
      icon: Padding(
        padding: EdgeInsetsGeometry.only(right: 12),
        child: SvgPicture.asset(
          AppAssets.icDropdown,
          colorFilter: ColorFilter.mode(AppColors.grey94A3B8, BlendMode.srcIn),
        ),
      ),
      padding: padding,
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(itemAsString(item), style: contentTextStyle),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: isErr == true ? Colors.red : AppColors.greyE2E8F0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: isErr == true ? Colors.red : AppColors.greyE2E8F0,
          ),
        ),
      ),
    );
  }
}
