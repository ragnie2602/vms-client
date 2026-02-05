import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class EventFilterDropdown<T> extends StatefulWidget {
  final String? hint;
  final bool isDense;
  final bool isExpanded;
  final Widget Function(T item)? itemBuilder;
  final List<T> items;
  final T? initialValue;
  final String? label;
  final void Function(T?) onChanged;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;

  const EventFilterDropdown({
    super.key,
    this.hint,
    this.isDense = false,
    this.isExpanded = true,
    this.itemBuilder,
    required this.items,
    this.initialValue,
    this.label,
    required this.onChanged,
    this.padding,
    this.style,
  });

  @override
  State<EventFilterDropdown<T>> createState() => _EventFilterDropdownState<T>();
}

class _EventFilterDropdownState<T> extends State<EventFilterDropdown<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label!),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyE2E8F0, width: 1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: DropdownButton2<T>(
            buttonStyleData: ButtonStyleData(
              height:
                  (widget.padding?.vertical ?? 0) +
                  (widget.isDense ? widget.style?.fontSize ?? 13 : 13) +
                  1,
              padding: widget.padding ?? EdgeInsets.zero,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              offset: const Offset(0, -4),
            ),
            hint: Text(
              widget.hint ?? '',
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey64748B,
              ),
            ),
            iconStyleData: IconStyleData(icon: SvgPicture.asset(AppAssets.icDropdown)),
            isDense: widget.isDense,
            isExpanded: widget.isExpanded,
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    child: widget.itemBuilder?.call(item) ?? Text(item.toString()),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() => _selectedValue = value);
              widget.onChanged(value);
            },
            selectedItemBuilder: (context) => widget.items
                .map(
                  (item) => Align(
                    alignment: Alignment.centerLeft,
                    child:
                        widget.itemBuilder?.call(item) ??
                        Text(
                          item.toString(),
                          style:
                              widget.style ??
                              AppTypography.style(
                                14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                        ),
                  ),
                )
                .toList(),
            style:
                widget.style ??
                AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
            underline: const SizedBox.shrink(),
            value: _selectedValue,
          ),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant EventFilterDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_selectedValue != null && !widget.items.contains(_selectedValue)) {
      setState(() => _selectedValue = null);
    }

    final nextInitial = widget.initialValue;
    if (nextInitial != null &&
        widget.items.contains(nextInitial) &&
        nextInitial != _selectedValue) {
      setState(() => _selectedValue = nextInitial);
    }
  }
}
