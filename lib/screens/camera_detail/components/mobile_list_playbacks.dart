import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';

import '../../../core/utils/size_observer.dart';
import '../../shared/state_builder_mixin.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../widgets/mobile_playback_card.dart';

class MobileListPlaybacks extends StatefulWidget {
  const MobileListPlaybacks({super.key});

  @override
  State<MobileListPlaybacks> createState() => _MobileListPlaybacksState();
}

class _MobileListPlaybacksState extends State<MobileListPlaybacks> with StateBuilderMixin {
  CameraDetailBloc get _dBloc => context.read<CameraDetailBloc>();

  late final ScrollController _scrollController = ScrollController();
  double? _cardHeight;
  double? _listHeight;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _showPopupSelectDate() async {
    final result = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      initialDate: _dBloc.state.playbackDate,
      firstDate: DateTime.fromMillisecondsSinceEpoch(0),
      lastDate: DateTime.now(),
      helpText: "Lựa chọn ngày",
      cancelText: "Huỷ",
      confirmText: "Xác nhận",
      fieldHintText: "dd/mm/yyyy",
      errorFormatText: "Định dạng không hợp lệ (dd/mm/yyyy)",
      errorInvalidText: "Ngày không hợp lệ",
      locale: Locale('vi', 'VN'),
      // calendarDelegate: MobileListPlaybackCalendarDelegate(), // custom lại format date
      builder: (context, child) => Theme(
        data: ThemeData(
          dividerTheme: const DividerThemeData(color: Colors.transparent),
          textTheme: TextTheme(
            // text field style
            bodyLarge: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.black171725,
            ),
            // text field style
            titleMedium: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.black171725,
            ),
          ),
          datePickerTheme: DatePickerThemeData(
            dividerColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            toggleButtonTextStyle: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.secondary,
            ),
            subHeaderForegroundColor: AppColors.secondary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            cancelButtonStyle: ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                AppTypography.style(15, fontWeight: FontWeight.w600),
              ),
              foregroundColor: WidgetStatePropertyAll(AppColors.redFF0000),
              // shape: WidgetStatePropertyAll(
              //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              // ),
            ),
            confirmButtonStyle: ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                AppTypography.style(15, fontWeight: FontWeight.w600),
              ),
              foregroundColor: WidgetStatePropertyAll(AppColors.blue005AA9),
              // shape: WidgetStatePropertyAll(
              //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              // ),
            ),
            backgroundColor: AppColors.scaffoldBgLight,
            headerBackgroundColor: AppColors.blue005AA9,
            headerForegroundColor: Colors.white,
            headerHelpStyle: AppTypography.style(15, fontWeight: FontWeight.w500),
            headerHeadlineStyle: AppTypography.style(28, fontWeight: FontWeight.w600),
            weekdayStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
            dayStyle: AppTypography.style(14, fontWeight: FontWeight.w400),
            yearStyle: AppTypography.style(14, fontWeight: FontWeight.w400),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey94A3B8,
              ),
              labelStyle: AppTypography.style(
                16,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
              errorStyle: AppTypography.style(
                12,
                fontWeight: FontWeight.w400,
                color: AppColors.redFF0909,
              ),
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.redFF0909)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.secondary)),
            ),
            dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              return states.contains(WidgetState.selected)
                  ? AppColors.blue005AA9
                  : Colors.transparent;
            }),
            dayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              if (states.contains(WidgetState.disabled)) {
                return AppColors.grey94A3B8;
              }
              return AppColors.black171725;
            }),
            todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              return states.contains(WidgetState.selected)
                  ? AppColors.blue005AA9
                  : Colors.transparent;
            }),
            todayForegroundColor: WidgetStateProperty.resolveWith((states) {
              return states.contains(WidgetState.selected) ? Colors.white : AppColors.blue005AA9;
            }),
            yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
              return states.contains(WidgetState.selected)
                  ? AppColors.blue005AA9
                  : Colors.transparent;
            }),
            yearForegroundColor: WidgetStateProperty.resolveWith((states) {
              return states.contains(WidgetState.selected) ? Colors.white : Colors.black;
            }),
            yearOverlayColor: WidgetStatePropertyAll(AppColors.blue005AA9),
          ),
        ),
        child: child!,
      ),
    );

    if (result != null && mounted) {
      _dBloc.add(ChangePlaybackDate(result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* Select date */
        BlocSelector<CameraDetailBloc, CameraDetailState, DateTime>(
          selector: (state) => state.playbackDate,
          builder: (context, date) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: AppColors.greyE5E5E5, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _icon(
                  AppAssets.icArrowChevronLeft,
                  () => _dBloc.add(ChangePlaybackDate(date.subtract(Duration(days: 1)))),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _showPopupSelectDate,
                  child: Text(
                    date.format('dd/MM/yyyy'),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackOrWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                _icon(
                  AppAssets.icArrowChevronRight,
                  () => _dBloc.add(ChangePlaybackDate(date.add(Duration(days: 1)))),
                  disabled: _dBloc.state.playbackDate.startOfNextDay.isAfter(DateTime.now()),
                ),
              ],
            ),
          ),
        ),

        /* List playbacks */
        Expanded(
          child: SizeObserver(
            onChange: (size) => _listHeight = size.height,
            child: BlocBuilder<PlaybackBloc, PlaybackState>(
              buildWhen: (pre, current) {
                final preSelectedIndex = pre is PlaybackSuccess ? pre.currentIndex : null;
                if (current is PlaybackSuccess &&
                    current.currentIndex != preSelectedIndex &&
                    current.currentIndex >= 0) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    if (_scrollController.hasClients == false) return;

                    _scrollController.animateTo(
                      // scroll tới vị trí sao cho currentIndex nằm ở giữa màn hình
                      current.currentIndex * (_cardHeight ?? 72) -
                          (_listHeight ?? 0) / 2 +
                          (_cardHeight ?? 0) / 2,
                      duration: Durations.medium1,
                      curve: Curves.easeOutCubic,
                    );
                  });
                }

                return true;
              },
              builder: (context, state) => stateBuilder<PlaybackSuccess>(
                state,
                emptyBuilder: () => Center(
                  child: Text(
                    'Không có đoạn video nào được lưu trong khoảng thời gian này.',
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey666666,
                    ),
                  ),
                ),
                child: (state) => ListView.builder(
                  physics: ClampingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: state.playbacks.length,
                  itemBuilder: (context, index) => SizeObserver(
                    onChange: (size) => _cardHeight = size.height,
                    child: MobilePlaybackCard(
                      onTap: () => context
                          .read<CameraDetailBloc>()
                          .state
                          .playerController
                          .jumpToDate
                          ?.call(state.playbacks[index].startTime, dateIndex: index),
                      key: ValueKey(state.playbacks[index].playbackId),
                      playback: state.playbacks[index],
                      isSelected: state.currentIndex == index,
                      backgroundColor: state.currentIndex == index
                          ? AppColors.greyF2F4FA
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _icon(String icon, VoidCallback onTap, {bool disabled = false}) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: disabled ? ColorFilter.mode(Color(0xFFB2B2B2), BlendMode.srcIn) : null,
      ),
    );
  }
}

class MobileListPlaybackCalendarDelegate extends GregorianCalendarDelegate {
  final _mapDayOfWeek = {
    DateTime.sunday: 'CN',
    DateTime.monday: 'Thứ 2',
    DateTime.tuesday: 'Thứ 3',
    DateTime.wednesday: 'Thứ 4',
    DateTime.thursday: 'Thứ 5',
    DateTime.friday: 'Thứ 6',
    DateTime.saturday: 'Thứ 7',
  };

  @override
  String formatMediumDate(DateTime date, MaterialLocalizations localizations) {
    // 'Thứ 3, 16 tháng 12'
    return date.format("'${_mapDayOfWeek[date.weekday]}', d MMMM", locale: 'vi');
  }

  @override
  String formatMonthYear(DateTime date, MaterialLocalizations localizations) {
    // 'Tháng 12, 2025'
    return date.format("MMMM, yyyy", locale: 'vi').capitalizeFirstLetter;
  }
}
