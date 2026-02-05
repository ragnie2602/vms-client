part of 'alarm_config_popup.dart';

class AlertTimeRange {
  TimeOfDay startTime;
  TimeOfDay endTime;
  String weekday;

  AlertTimeRange({
    this.startTime = const TimeOfDay(hour: 0, minute: 0),
    this.endTime = const TimeOfDay(hour: 23, minute: 59),
    this.weekday = 'T2',
  });
}

class TimeRangesConfig extends StatefulWidget {
  const TimeRangesConfig({super.key});

  @override
  State<TimeRangesConfig> createState() => _TimeRangesConfigState();
}

class _TimeRangesConfigState extends State<TimeRangesConfig> {
  List<AlertTimeRange> times = [
    AlertTimeRange(weekday: 'T2'),
    AlertTimeRange(weekday: 'T3'),
    AlertTimeRange(weekday: 'T4'),
    AlertTimeRange(weekday: 'T5'),
    AlertTimeRange(weekday: 'T6'),
    AlertTimeRange(weekday: 'T7'),
    AlertTimeRange(weekday: 'CN'),
  ];
  late final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
            child: times.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    padding: EdgeInsets.all(10),
                    itemCount: times.length,
                    itemBuilder: (context, index) {
                      final time = times[index];

                      return Container(
                        padding: EdgeInsets.only(top: index == 0 ? 0 : 16, bottom: 16),
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
                                times[index].startTime = selectedTime;
                              }),
                              maximumTime: time.endTime,
                              minimumTime: time.startTime,
                            ),
                            _columnTime(
                              'Thời gian kết thúc',
                              time.endTime,
                              (selectedTime) => setState(() {
                                times[index].endTime = selectedTime;
                              }),
                              maximumTime: time.endTime,
                              minimumTime: time.startTime,
                            ),
                            _columnWeekday(times[index].weekday, (day) {
                              setState(() {
                                times[index].weekday = day;
                              });
                            }),
                            _handleButtons(
                              onDelete: () {
                                setState(() {
                                  times.removeAt(index);
                                });
                              },
                              onAdd: () {
                                setState(() {
                                  times.add(AlertTimeRange());
                                });

                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  Widget _columnTime(
    String title,
    TimeOfDay initialTime,
    Function(TimeOfDay) onChanged, {
    TimeOfDay? minimumTime,
    TimeOfDay? maximumTime,
  }) {
    final formattedTime =
        "${initialTime.hour.toString().padLeft(2, '0')}:${initialTime.minute.toString().padLeft(2, '0')}";

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
          width: 140,
          height: 40,
          child: InkWell(
            onTap: () async {
              final selectedTime = await showDialog<TimeOfDay>(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  TimeOfDay result = initialTime;

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
                                      ? DateTime(2000, 1, 1, minimumTime.hour, minimumTime.minute)
                                      : null,
                                  maximumDate: maximumTime != null
                                      ? DateTime(2000, 1, 1, maximumTime.hour, maximumTime.minute)
                                      : null,
                                  initialDateTime: DateTime(2000, 1, 1, result.hour, result.minute),
                                  onDateTimeChanged: (dateTime) {
                                    result = TimeOfDay(
                                      hour: dateTime.hour,
                                      minute: dateTime.minute,
                                    );
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
              key: ValueKey(formattedTime),
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
                formattedTime,
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
        // Container(
        //   padding: EdgeInsets.only(top: 2, bottom: errorMessage != null ? 6 : 0),
        //   child: Text(
        //     errorMessage ?? '',
        //     style: AppTypography.style(
        //       11,
        //       fontWeight: FontWeight.w400,
        //       color: AppColors.redFF0004,
        //       lineHeight: 14 / 11,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _columnWeekday(String currentDay, Function(String) onChanged) {
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
          children: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN']
              .map(
                (day) => InkWell(
                  onTap: () => onChanged(day),
                  child: AnimatedContainer(
                    width: 40,
                    height: 40,
                    duration: Durations.medium1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: day == currentDay ? Color(0xFF0EA5E9) : Colors.white,
                      border: Border.all(
                        color: day == currentDay ? Color(0xFF0EA5E9) : AppColors.greyE2E8F0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day,
                      style: AppTypography.style(
                        12,
                        fontWeight: FontWeight.w700,
                        color: day == currentDay ? Colors.white : Color(0xFF64748B),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _handleButtons({required Function() onDelete, Function()? onAdd}) {
    return Padding(
      padding: EdgeInsets.only(top: 16 + 6 + 10),
      child: Row(
        spacing: 8,
        children: <Widget>[
          InkWell(
            onTap: onDelete,
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

          if (onAdd != null)
            InkWell(
              onTap: onAdd,
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

  Widget _buildEmptyState() {
    return InkWell(
      onTap: () => setState(() {
        times.add(AlertTimeRange());
      }),
      child: Container(
        width: double.infinity,
        height: 32,
        margin: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: Color(0xFF54BC00), shape: BoxShape.circle),
        child: Center(child: Icon(Icons.add, color: Colors.white, size: 18)),
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
