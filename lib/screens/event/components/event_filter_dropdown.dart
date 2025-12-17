import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';

class EventFilterDropdown<T> extends StatefulWidget {
  final String? hint;
  final List<T> items;
  final T? initialValue;
  final String? label;
  final void Function(dynamic) onChanged;
  final EventFilterDropdownType type;

  const EventFilterDropdown({
    super.key,
    this.hint,
    required this.items,
    this.initialValue,
    this.label,
    required this.onChanged,
    this.type = EventFilterDropdownType.normal,
  });

  @override
  State<EventFilterDropdown<T>> createState() => _EventFilterDropdownState<T>();
}

class _EventFilterDropdownState<T> extends State<EventFilterDropdown<T>> {
  T? _selectedValue;
  TextEditingController? _dateController;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;

    if (widget.type == EventFilterDropdownType.date) _dateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label!),
        const SizedBox(height: 8),
        widget.type == EventFilterDropdownType.date ? _dateDropdown() : _normalDropdown(),
      ],
    );
  }

  Widget _dateDropdown() {
    return TextField(
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: AppColors.greyE2E8F0),
        ),
        constraints: BoxConstraints(minHeight: 0, minWidth: 0),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: AppColors.greyE2E8F0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: AppColors.greyE2E8F0),
        ),
        hintText: widget.hint ?? 'dd/mm/yyyy',
        hintStyle: AppTypography.style(
          14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey64748B,
        ),
        isDense: true,
      ),
      keyboardType: TextInputType.none,
      onTap: () async => await _showDatePicker(),
    );
  }

  Widget _normalDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyE2E8F0, width: 1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: DropdownButton(
        hint: Text(
          widget.hint ?? '',
          style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.grey64748B),
        ),
        isDense: true,
        isExpanded: true,
        items: widget.items
            .map((item) => DropdownMenuItem(value: item, child: Text(item.toString())))
            .toList(),
        onChanged: widget.onChanged,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
        underline: Container(),
        value: _selectedValue,
      ),
    );
  }

  _showDatePicker() async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.fromMillisecondsSinceEpoch(0),
      lastDate: DateTime.now(),
    );

    if (result != null) _dateController?.text = result.format('dd/MM/yyyy');

    widget.onChanged(result);
  }
}

enum EventFilterDropdownType { date, normal }
