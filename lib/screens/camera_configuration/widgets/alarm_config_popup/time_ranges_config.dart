part of 'alarm_config_popup.dart';

class TimeRangesConfig extends StatefulWidget {
  const TimeRangesConfig({super.key, required this.alarmConfig});
  final AIAlarmConfig alarmConfig;

  @override
  State<TimeRangesConfig> createState() => _TimeRangesConfigState();
}

class _TimeRangesConfigState extends State<TimeRangesConfig> {
  late final ScrollController scrollController = ScrollController();

  late final Map<int, String> _weekdays = {
    DateTime.monday: 'T2',
    DateTime.tuesday: 'T3',
    DateTime.wednesday: 'T4',
    DateTime.thursday: 'T5',
    DateTime.friday: 'T6',
    DateTime.saturday: 'T7',
    DateTime.sunday: 'CN',
  };

  @override
  void initState() {
    if (widget.alarmConfig.times.isEmpty) {
      widget.alarmConfig.times.add(
        TimesConfig(days: _weekdays.keys.toList(), startTime: '00:00', endTime: '23:59'),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _triggerValidate() {
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      context.read<AlarmConfigDetailBloc>().add(ValidateAlarmConfig());
    });
  }

  bool canSelectDay(int day) {
    final count = widget.alarmConfig.times.where((time) => time.days.contains(day)).length;
    if (count >= 6) {
      ToastUtil.toastWarning(
        title: Text(
          'Không được tạo quá 6 khoảng thời gian trong 1 ngày',
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            lineHeight: 18 / 14,
          ),
        ),
      );
    }

    return count < 6;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithTooltip(
          title: 'Thời gian gửi cảnh báo',
          tooltip: 'Hệ thống chỉ ghi nhận và gửi cảnh báo trong các\nkhung giờ này. ',
        ),

        /*  */
        SizedBox(height: 8),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              border: Border.all(color: AppColors.greyE2E8F0),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Scrollbar(
              thumbVisibility: true,
              controller: scrollController,
              child: ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                padding: EdgeInsets.all(10),
                itemCount: widget.alarmConfig.times.length,
                itemBuilder: (context, index) {
                  final time = widget.alarmConfig.times[index];
                  bool needValidate =
                      time.startTime != null || time.endTime != null || time.days.isNotEmpty;

                  return Container(
                    padding: EdgeInsets.only(top: index == 0 ? 0 : 16),
                    decoration: index > 0
                        ? BoxDecoration(
                            border: Border(top: BorderSide(color: AppColors.greyE2E8F0)),
                          )
                        : null,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: <Widget>[
                        _columnTime(
                          'Thời gian bắt đầu',
                          time.startTime,
                          (selectedTime) => setState(() {
                            widget.alarmConfig.times[index].startTime = selectedTime;
                            _triggerValidate();
                          }),
                          maximumTime: time.endTime,
                          minimumTime: time.startTime,
                          needValidate: needValidate,
                        ),
                        _columnTime(
                          'Thời gian kết thúc',
                          time.endTime,
                          (selectedTime) => setState(() {
                            widget.alarmConfig.times[index].endTime = selectedTime;
                            _triggerValidate();
                          }),
                          maximumTime: time.endTime,
                          minimumTime: time.startTime,
                          needValidate: needValidate,
                        ),
                        _columnWeekday(widget.alarmConfig.times[index].days, (days) {
                          setState(() {
                            widget.alarmConfig.times[index].days = days;
                            _triggerValidate();
                          });
                        }, needValidate),
                        _handleButtons(
                          index,
                          showDelete:
                              widget.alarmConfig.times.length > 1 ||
                              widget.alarmConfig.times.firstOrNull?.isEmpty() == false,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _columnTime(
    String title,
    String? initialTime,
    Function(String) onChanged, {
    String? minimumTime,
    String? maximumTime,
    bool? needValidate,
  }) {
    String? errorMessage;
    if (needValidate == true && initialTime == null) errorMessage = 'Vui lòng chọn thời gian';
    final columnWidth = 140.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTypography.style(
            11,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
            lineHeight: 16 / 11,
          ),
        ),
        SizedBox(height: 6),
        SizedBox(
          width: columnWidth,
          height: 40,
          child: InkWell(
            onTap: () async {
              final selectedTime = await showDialog<String>(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  String result = initialTime ?? minimumTime ?? maximumTime ?? '00:00';

                  return Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: SizedBox(
                      width: 360,
                      height: 340,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.greyE2E8F0)),
                            ),
                            child: Text(
                              title,
                              style: AppTypography.style(
                                20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Picker
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: const _MouseDragScrollBehavior(),
                              child: CupertinoTheme(
                                data: CupertinoThemeData(
                                  textTheme: CupertinoTextThemeData(
                                    dateTimePickerTextStyle: AppTypography.style(
                                      16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  showTimeSeparator: true,
                                  minimumDate: minimumTime != null
                                      ? DateFormat("HH:mm").parse(minimumTime)
                                      : null,
                                  maximumDate: maximumTime != null
                                      ? DateFormat("HH:mm").parse(maximumTime)
                                      : null,
                                  initialDateTime: DateFormat("HH:mm").parse(result),
                                  onDateTimeChanged: (dateTime) {
                                    result = DateFormat("HH:mm").format(dateTime);
                                  },
                                ),
                              ),
                            ),
                          ),

                          // Footer
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: AppColors.greyE2E8F0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    overlayColor: AppColors.redFF0004.withValues(alpha: 0.25),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Huỷ',
                                    style: AppTypography.style(
                                      14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.redFF0004,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    overlayColor: AppColors.secondary.withValues(alpha: 0.25),
                                  ),
                                  onPressed: () => Navigator.pop(context, result),
                                  child: Text(
                                    'Xác nhận',
                                    style: AppTypography.style(
                                      14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondary,
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
                },
              );

              if (selectedTime != null) onChanged(selectedTime);
            },
            child: InputDecorator(
              key: ValueKey(initialTime),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                  borderRadius: BorderRadius.circular(6),
                ),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppAssets.icClock, width: 16, height: 16),
                ),
              ),
              child: Text(
                initialTime ?? '',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  lineHeight: 20 / 14,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 2, bottom: errorMessage != null ? 6 : 0),
          width: columnWidth,
          child: Text(
            errorMessage ?? '',
            maxLines: 3,
            style: AppTypography.style(
              11,
              fontWeight: FontWeight.w400,
              color: AppColors.redFF0004,
              lineHeight: 14 / 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _columnWeekday(List<int> selectedDays, Function(List<int>) onChanged, bool needValidate) {
    String? errorMessage;
    if (needValidate && selectedDays.isEmpty) errorMessage = 'Vui lòng chọn ngày áp dụng';

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ngày áp dụng'.toUpperCase(),
          style: AppTypography.style(
            11,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
            lineHeight: 16 / 11,
          ),
        ),
        SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 5,
          children: _weekdays.entries.map((day) {
            final isSelected = selectedDays.contains(day.key);
            return InkWell(
              onTap: () {
                if (!canSelectDay(day.key)) return;

                final newList = List<int>.from(selectedDays);
                isSelected ? newList.remove(day.key) : newList.add(day.key);

                onChanged(newList);
              },
              child: AnimatedContainer(
                width: 40,
                height: 40,
                duration: Durations.medium1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: isSelected ? Color(0xFF0EA5E9) : Colors.white,
                  border: Border.all(color: isSelected ? Color(0xFF0EA5E9) : AppColors.greyE2E8F0),
                ),
                alignment: Alignment.center,
                child: Text(
                  day.value,
                  style: AppTypography.style(
                    12,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : Color(0xFF64748B),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Container(
          padding: EdgeInsets.only(top: 2, bottom: errorMessage != null ? 6 : 0),
          child: Text(
            errorMessage ?? '',
            maxLines: 3,
            style: AppTypography.style(
              11,
              fontWeight: FontWeight.w400,
              color: AppColors.redFF0004,
              lineHeight: 14 / 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _handleButtons(int index, {bool showDelete = true}) {
    return Padding(
      padding: EdgeInsets.only(top: 16 + 6 + 10),
      child: Row(
        spacing: 8,
        children: <Widget>[
          /* Xóa */
          if (showDelete)
            InkWell(
              onTap: () {
                setState(() {
                  if (widget.alarmConfig.times.length == 1) {
                    widget.alarmConfig.times[0] = TimesConfig.empty();
                  } else {
                    widget.alarmConfig.times.removeAt(index);
                  }
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(color: Color(0xFFF10000), shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.icDelete,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),

          /* Thêm */
          InkWell(
            onTap: () {
              setState(() {
                widget.alarmConfig.times.insert(index + 1, TimesConfig.empty());
              });
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: Color(0xFF54BC00), shape: BoxShape.circle),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.iconAdd,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MouseDragScrollBehavior extends MaterialScrollBehavior {
  const _MouseDragScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
