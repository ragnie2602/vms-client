import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../widgets/mobile_timeline_painter.dart';

class MobilePlayerTimeline extends StatefulWidget {
  const MobilePlayerTimeline({
    super.key,
    this.tickWidth = 1,
    this.minorTickCount = 5, // 10
    this.formatPattern = 'HH:mm',
    this.size,
    required this.timeStyle,
    required this.playbackColor,
    required this.unplaybackColor,
    required this.centralLineColor,
    required this.tickColor,
  });

  final double tickWidth;
  final int minorTickCount;
  final String formatPattern;
  final Size? size;
  final TextStyle timeStyle;
  final Color playbackColor;
  final Color unplaybackColor;
  final Color centralLineColor;
  final Color tickColor;

  @override
  State<MobilePlayerTimeline> createState() => _MobilePlayerTimelineState();
}

class _MobilePlayerTimelineState extends State<MobilePlayerTimeline> {
  late final _centralDate = ValueNotifier(DateTime.now().roundToSecond);
  late final _time = ValueNotifier(DateTime.now().roundToSecond);
  late final _gap = ValueNotifier<double>(
    max((_timelineWidth - 4 * 5) / (4 * widget.minorTickCount), 3),
  );
  late final _overlayOffset = ValueNotifier<double?>(null);

  double _centralOffset = 0;
  double _timelineWidth = 0;

  static const Duration _interval = Duration(hours: 1);
  static const int _dragSpeed = 40000;

  double get _tickGap => _gap.value;
  late final double _showTimeFlag = _calculateGap(1.25);
  late final double _maxGap = _calculateGap(1);
  late final double _minGap = _calculateGap(7);

  CameraDetailBloc get _cameraLiveBloc => context.read<CameraDetailBloc>();
  DateTime get _startDate => _cameraLiveBloc.state.playbackDate.startOfDay;
  DateTime get _endDate => _cameraLiveBloc.state.playbackDate.startOfNextDay;
  double _calculateGap(double timeRanges) => max(
    (_timelineWidth - timeRanges * widget.minorTickCount) / (timeRanges * widget.minorTickCount),
    3,
  );

  @override
  void dispose() {
    _centralDate.dispose();
    _time.dispose();
    _gap.dispose();
    _overlayOffset.dispose();
    super.dispose();
  }

  DateTime _calculateDateFromOffset(double dx) {
    final diffFromClickToCentral =
        (dx - _timelineWidth / 2 - _centralOffset) /
        (_tickGap + widget.tickWidth) *
        (_interval.inMicroseconds / widget.minorTickCount);

    return _centralDate.value
        .add(Duration(microseconds: (diffFromClickToCentral.floor())))
        .clamp(_startDate, _endDate);
  }

  DateTime? _centralDateFromStart;
  DateTime? _centralDateFromEnd;
  void _initCentralDateFromStartAndEnd() {
    final offset =
        _timelineWidth /
        2 /
        (_tickGap + widget.tickWidth) *
        (_interval.inMicroseconds / widget.minorTickCount);

    _centralDateFromStart = _startDate.add(Duration(microseconds: offset.floor()));
    _centralDateFromEnd = _endDate.subtract(Duration(microseconds: offset.floor()));
  }

  void _clampCentralDate(DateTime target) {
    _initCentralDateFromStartAndEnd();

    if (target.isBefore(_centralDateFromStart!)) target = _centralDateFromStart!;
    if (target.isAfter(_centralDateFromEnd!)) target = _centralDateFromEnd!;

    _centralDate.value = target;
  }

  void _onPlaybackChanged(int index) {
    context.read<PlaybackBloc>().add(ChangePlayback(index));
  }

  void _onTimeChanged(DateTime time, [bool shouldUpdateCentralDate = false]) {
    _time.value = time;
    if (shouldUpdateCentralDate) _clampCentralDate(time);
  }

  late final int _minorIntervalSize = Duration(
    microseconds: _interval.inMicroseconds ~/ widget.minorTickCount,
  ).inMicroseconds;
  double overlayWidth = 56;
  void _showCurentTimeOverlay() {
    final offsetCentral =
        _time.value.difference(_centralDate.value).inMicroseconds /
        _minorIntervalSize *
        (_tickGap + widget.tickWidth);

    double? dx = _timelineWidth / 2 + offsetCentral;
    if (dx <= 0 || dx >= _timelineWidth) dx = null;
    Future.delayed(Duration.zero, () => _overlayOffset.value = dx);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.greyF2F2F2),
      child: LayoutBuilder(
        builder: (context, constraints) {
          _timelineWidth = constraints.maxWidth;
          if (widget.size != null && !widget.size!.width.isInfinite) {
            _timelineWidth = widget.size!.width;
          }

          return Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                // Khi nhả click, nếu drag thì sẽ không chạy hàm này nữa (onTapDown sẽ gọi trước khi click để drag)
                onTapUp: (details) {
                  _cameraLiveBloc.state.playerController.jumpToDate?.call(
                    _calculateDateFromOffset(details.localPosition.dx),
                  );
                },
                // Xử lý chugn cho pinch to zoom và drag
                onScaleUpdate: (details) {
                  final isPinch = (details.scale - 1.0).abs() > 0.01;

                  if (isPinch) {
                    double gap = _tickGap + details.scale / 2 * (details.scale > 1 ? 1 : -1);
                    if (gap >= _maxGap) gap = _maxGap;
                    if (gap <= _minGap) gap = _minGap;
                    _gap.value = gap;
                  } else {
                    _clampCentralDate(
                      _centralDate.value.subtract(
                        Duration(milliseconds: details.focalPointDelta.dx.toInt() * _dragSpeed),
                      ),
                    );
                  }
                },
                // Không bị vẽ ra ngoài
                child: ClipRRect(
                  child: RepaintBoundary(
                    child: BlocBuilder<PlaybackBloc, PlaybackState>(
                      buildWhen: (previous, current) {
                        if (previous is! PlaybackSuccess &&
                            current is PlaybackSuccess &&
                            current.playbacks.isNotEmpty) {
                          _clampCentralDate(current.playbacks[current.initialIndex].startTime);
                          _cameraLiveBloc.state.playerController
                            ..onPlaybackChanged = _onPlaybackChanged
                            ..onTimeChanged = _onTimeChanged;
                        }
                        return true;
                      },
                      builder: (context, state) {
                        return ValueListenableBuilder(
                          valueListenable: _time,
                          builder: (context, currentTime, child) {
                            return ValueListenableBuilder(
                              valueListenable: _gap,
                              builder: (context, gap, child) => CustomPaint(
                                size: Size(_timelineWidth, widget.size?.height ?? double.infinity),
                                isComplex: true,
                                willChange: true,
                                painter: MobileTimelinePainter(
                                  showMinorTickTime: _tickGap >= _showTimeFlag,
                                  onCentralOffset: (offset) {
                                    _centralOffset = offset;
                                    _showCurentTimeOverlay();
                                  },
                                  minorTickCount: widget.minorTickCount,
                                  tickGap: _tickGap, //
                                  interval: _interval, //
                                  tickWidth: widget.tickWidth,
                                  centralDate: _centralDate,
                                  currentTime: currentTime,
                                  playbacks: state.type.isSuccess
                                      ? (state as PlaybackSuccess).playbacks
                                      : [],
                                  startDate: _startDate,
                                  endDate: _endDate,
                                  formatPattern: widget.formatPattern,
                                  timeStyle: widget.timeStyle,
                                  playbackColor: widget.playbackColor,
                                  unplaybackColor: widget.unplaybackColor,
                                  centralLineColor: widget.centralLineColor,
                                  tickColor: widget.tickColor,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),

              ValueListenableBuilder(
                valueListenable: _overlayOffset,
                builder: (context, dx, child) {
                  if (dx == null) return const SizedBox.shrink();

                  return Positioned(
                    left: dx - overlayWidth / 2,
                    top: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 3),
                      width: overlayWidth,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _time.value.format("HH:mm"),
                            style: AppTypography.style(
                              11,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SvgPicture.asset(AppAssets.icArrowChevronRight, width: 9, height: 12),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
