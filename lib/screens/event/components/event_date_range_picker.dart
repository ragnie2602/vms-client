import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';

class EventDateRangePicker extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final DateTimeRange? initialDateRange;
  final void Function(DateTimeRange?)? onChanged;
  final EdgeInsetsGeometry? padding;
  final bool isDense;
  final TextStyle? style;

  const EventDateRangePicker({
    super.key,
    this.label,
    this.labelStyle,
    this.hintText,
    this.initialDateRange,
    this.onChanged,
    this.padding,
    this.isDense = false,
    this.style,
  });

  @override
  State<EventDateRangePicker> createState() => EventDateRangePickerState();
}

class EventDateRangePickerState extends State<EventDateRangePicker> {
  late final TextEditingController _controller;

  DateTimeRange? _selectedDateRange;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    if (widget.initialDateRange != null) {
      _selectedDateRange = widget.initialDateRange;

      _updateControllerText();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(_selectedDateRange);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style:
                widget.labelStyle ??
                AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
          ),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
            contentPadding:
                widget.padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            hintText: widget.hintText ?? 'Từ ngày - đến ngày',
            hintStyle: AppTypography.style(
              14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey64748B,
            ),
            isDense: widget.isDense,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(AppAssets.icCalendar, height: 16, width: 16),
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 16 + 12, // width icon + padding right
              minHeight: 16,
            ),
          ),
          keyboardType: TextInputType.none,
          onTap: _showDateRangePicker,
          readOnly: true,
          style:
              widget.style ??
              AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(EventDateRangePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDateRange != oldWidget.initialDateRange) {
      _selectedDateRange = widget.initialDateRange;
      _updateControllerText();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  changeDateRange(DateTimeRange dateRange) {
    setState(() {
      _selectedDateRange = dateRange;

      _updateControllerText();
    });
    widget.onChanged?.call(dateRange);
  }

  Future<void> _showDateRangePicker() async {
    final result = await showDialog<DateTimeRange?>(
      context: context,
      barrierDismissible: true,
      builder: (context) => _EventRangePickerDialog(initialRange: _selectedDateRange),
    );

    if (result != null) changeDateRange(result);
  }

  _updateControllerText() {
    if (_selectedDateRange != null) {
      final startDate = _selectedDateRange!.start.format('dd/MM/yyyy');
      final endDate = _selectedDateRange!.end.format('dd/MM/yyyy');
      _controller.text = '$startDate - $endDate';
    } else {
      _controller.text = '';
    }
  }
}

class _EventRangePickerDialog extends StatefulWidget {
  final DateTimeRange? initialRange;

  const _EventRangePickerDialog({required this.initialRange});

  @override
  State<_EventRangePickerDialog> createState() => _EventRangePickerDialogState();
}

class _EventRangePickerDialogState extends State<_EventRangePickerDialog> {
  PageController? _pageController;

  late DateTime _focusedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedDay = widget.initialRange?.start ?? now;
    _rangeStart = widget.initialRange?.start;
    _rangeEnd = widget.initialRange?.end;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.widthOf(context) * 520 / 1600,
          // maxHeight: MediaQuery.heightOf(context) * 520 / 900,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  Text(
                    'Chọn phạm vi',
                    style: AppTypography.style(
                      16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    splashRadius: 16,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.greyE2E8F0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                _buildRangeLabel(),
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey64748B,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 16), child: _buildCalendar()),
            const Divider(height: 1, color: AppColors.greyE2E8F0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Hủy',
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey64748B,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _rangeStart == null || _rangeEnd == null
                          ? AppColors.greyE2E8F0
                          : AppColors.secondary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: _rangeStart != null && _rangeEnd != null
                        ? () => Navigator.of(
                            context,
                          ).pop(DateTimeRange(start: _rangeStart!, end: _rangeEnd!))
                        : null,
                    child: Text(
                      'Áp dụng',
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildRangeLabel() {
    if (_rangeStart == null && _rangeEnd == null) {
      return 'Ngày bắt đầu - Ngày kết thúc';
    }
    if (_rangeStart != null && _rangeEnd == null) {
      return '${_rangeStart!.format('d MMM yyyy', locale: 'vi')} - ...';
    }
    return '${_rangeStart!.format('d MMM yyyy', locale: 'vi')} - ${_rangeEnd!.format('d MMM yyyy', locale: 'vi')}';
  }

  Widget _buildCalendar() {
    return TableCalendar(
      calendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
        defaultTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        disabledTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey94A3B8,
        ),
        outsideTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey94A3B8,
        ),
        rangeEndDecoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
        rangeHighlightColor: AppColors.blueE7F3FF,
        rangeStartDecoration: const BoxDecoration(
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
        selectedDecoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.secondary),
        selectedTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        todayDecoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(BorderSide(color: AppColors.secondary)),
          color: Colors.transparent,
        ),
        todayTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        weekendTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        withinRangeDecoration: const BoxDecoration(color: Colors.transparent),
        withinRangeTextStyle: AppTypography.style(
          12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      daysOfWeekHeight: 32,
      firstDay: DateTime.fromMillisecondsSinceEpoch(0),
      focusedDay: _focusedDay,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleCentered: false,
      ),
      headerVisible: true,
      lastDay: DateTime.now(),
      locale: 'vi',
      onCalendarCreated: (controller) => _pageController = controller,
      onDaySelected: (selectedDay, focusedDay) {
        if (_rangeEnd != null) {
          setState(() {
            _rangeStart = selectedDay;
            _rangeEnd = null;
          });
        } else {
          setState(() {
            if (selectedDay.isBefore(_rangeStart ?? selectedDay)) {
              _rangeEnd = _rangeStart;
              _rangeStart = selectedDay;
            } else {
              _rangeEnd = selectedDay;
            }
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      rowHeight: 50,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Container(
            padding: const EdgeInsets.only(bottom: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    day.format('MMMM yyyy', locale: 'vi'),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () => _pageController?.previousPage(
                    duration: Durations.medium1,
                    curve: Curves.easeInOut,
                  ),
                  child: SvgPicture.asset(AppAssets.icArrowChevronLeft, width: 20, height: 20),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => _pageController?.nextPage(
                    duration: Durations.medium1,
                    curve: Curves.easeInOut,
                  ),
                  child: SvgPicture.asset(AppAssets.icArrowChevronRight, width: 20, height: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
