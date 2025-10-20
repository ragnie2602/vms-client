import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';

import '../bloc/camera_live/camera_live_bloc.dart';

class PlaybackDate extends StatefulWidget {
  const PlaybackDate({super.key});

  @override
  State<PlaybackDate> createState() => _PlaybackDateState();
}

class _PlaybackDateState extends State<PlaybackDate> {
  PageController? _pageController;
  final _menuController = MenuController();

  final mapDayOfWeek = {
    DateTime.monday: 'T2',
    DateTime.tuesday: 'T3',
    DateTime.wednesday: 'T4',
    DateTime.thursday: 'T5',
    DateTime.friday: 'T6',
    DateTime.saturday: 'T7',
    DateTime.sunday: 'CN',
  };

  CameraLiveBloc get bloc => context.read<CameraLiveBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: MenuAnchor(
        controller: _menuController,
        menuChildren: [_buildCalendar()],
        alignmentOffset: Offset(0, 8),
        useRootOverlay: true,
        child: BlocSelector<CameraLiveBloc, CameraLiveState, DateTime>(
          selector: (state) => state.playbackDate,
          builder: (context, date) => Row(
            children: <Widget>[
              _icon(
                AppAssets.icArrowChevronLeft,
                () => bloc.add(ChangePlaybackDate(date.subtract(Duration(days: 1)))),
              ),
              InkWell(
                onTap: () =>
                    _menuController.isOpen ? _menuController.close() : _menuController.open(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 23.5),
                  constraints: BoxConstraints(minWidth: 75, minHeight: 24),
                  alignment: Alignment.center,
                  child: Text(
                    date.format('dd/MM/yyyy'),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackOrWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              _icon(AppAssets.icArrowChevronRight, () {
                final nextDate = bloc.state.playbackDate.startOfNextDay;
                if (nextDate.isAfter(DateTime.now())) return;

                bloc.add(ChangePlaybackDate(nextDate));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      height: 300,
      width: 316,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.contentBg,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(147, 152, 154, 0.2),
            spreadRadius: 0,
            blurRadius: 60,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BlocSelector<CameraLiveBloc, CameraLiveState, DateTime>(
        selector: (state) => state.playbackDate,
        builder: (context, date) {
          return TableCalendar(
            onDaySelected: (date, focusedDay) =>
                context.read<CameraLiveBloc>().let((bloc) => bloc.add(ChangePlaybackDate(date))),
            onCalendarCreated: (pageController) => _pageController = pageController,
            pageJumpingEnabled: true,
            startingDayOfWeek: StartingDayOfWeek.monday,
            locale: 'vi',
            focusedDay: date,
            firstDay: DateTime.fromMillisecondsSinceEpoch(0),
            lastDay: DateTime.now(),
            currentDay: date,
            shouldFillViewport: true,
            rowHeight: 36,
            daysOfWeekHeight: 36,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
              headerPadding: EdgeInsets.zero,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) => mapDayOfWeek[date.weekday] ?? '',
              weekdayStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackOrWhite,
              ),
              weekendStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackOrWhite,
              ),
            ),
            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.zero,
              defaultDecoration: BoxDecoration(shape: BoxShape.rectangle),
              outsideDecoration: BoxDecoration(shape: BoxShape.rectangle),
              rangeStartDecoration: BoxDecoration(shape: BoxShape.rectangle),
              rangeEndDecoration: BoxDecoration(shape: BoxShape.rectangle),
              rowDecoration: BoxDecoration(shape: BoxShape.rectangle),
              weekendDecoration: BoxDecoration(shape: BoxShape.rectangle),
              disabledDecoration: BoxDecoration(shape: BoxShape.rectangle),
              todayDecoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(3),
                shape: BoxShape.rectangle,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(3),
                shape: BoxShape.rectangle,
              ),
              selectedTextStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w700,
                color: AppColors.blackOrWhiteReverse,
              ),
              defaultTextStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w400,
                color: AppColors.blackOrWhite,
              ),
              weekendTextStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w400,
                color: AppColors.blackOrWhite,
              ),
              holidayDecoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(3),
                shape: BoxShape.rectangle,
              ),
              outsideTextStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey94A3B8,
              ),
              disabledTextStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey94A3B8,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return Container(
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          day.format('MMMM, yyyy', locale: 'vi').capitalizeFirstLetter,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackOrWhite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () => _pageController?.previousPage(
                          duration: Durations.long2,
                          curve: Curves.easeInOut,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.icArrowChevronLeft,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () => _pageController?.nextPage(
                          duration: Durations.long2,
                          curve: Curves.easeInOut,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.icArrowChevronRight,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            day.isInCurrentMonth ? Color(0xFFCACAD8) : Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _icon(String icon, VoidCallback onTap, [Color? color]) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: AppColors.greyF2F4FA,
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        ),
      ),
    );
  }
}
