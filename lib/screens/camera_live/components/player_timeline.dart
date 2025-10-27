import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/size_observer.dart';

import '../bloc/camera_live/camera_live_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../widgets/timeline_painter.dart';

class PlayerTimeline extends StatefulWidget {
  const PlayerTimeline({
    super.key,
    this.tickWidth = 1,
    this.minorTickCount = 5, // 10
    this.majorTickHeight = 30,
    this.minorTickHeight = 18,
    this.formatPattern = 'HH:mm',
    this.size,
    required this.normalStyle,
    required this.highlightStyle,
    this.playbackColor,
    this.centralLineColor,
  });

  final double tickWidth;
  final int minorTickCount;
  final double majorTickHeight;
  final double? minorTickHeight;
  final String formatPattern;
  final Size? size;
  final TextStyle normalStyle;
  final TextStyle highlightStyle;
  final Color? playbackColor;
  final Color? centralLineColor;

  @override
  State<PlayerTimeline> createState() => _PlayerTimelineState();
}

class _PlayerTimelineState extends State<PlayerTimeline> {
  late final _centralDate = ValueNotifier(DateTime.now().roundToSecond);
  late final _time = ValueNotifier(DateTime.now().roundToSecond);
  Timer? _debounce;
  OverlayEntry? _overlayEntry;
  final GlobalKey _globalKey = GlobalKey();
  DateTime? _hoverDate;

  bool _isInteracting = false;
  double _centralOffset = 0;
  double _timelineWidth = 0;
  double _overlayWidth = 0;

  Duration get _interval => _cameraLiveBloc.state.timelineDisplayMode.interval;
  double get _tickGap => _cameraLiveBloc.state.timelineDisplayMode.gap(_timelineWidth);
  int get _dragSpeed => _cameraLiveBloc.state.timelineDisplayMode.let(
    (mode) => switch (mode) {
      TimelineDisplayMode.h1 => 2500,
      TimelineDisplayMode.h8 => 10000,
      TimelineDisplayMode.h24 => 10000,
    },
  );
  PlaybackBloc get _playbackBloc => context.read<PlaybackBloc>();
  CameraLiveBloc get _cameraLiveBloc => context.read<CameraLiveBloc>();
  DateTime get _startDate => _cameraLiveBloc.state.playbackDate.startOfDay;
  DateTime get _endDate => _cameraLiveBloc.state.playbackDate.startOfNextDay;

  DateTime? _centralDateFromStart;
  DateTime? _centralDateFromEnd;

  @override
  void initState() {
    super.initState();

    if (_playbackBloc.state is PlaybackInitial) {
      _playbackBloc.add(
        GetVideoPlaybacks(_cameraLiveBloc.state.camera.id, _cameraLiveBloc.state.playbackDate),
      );
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
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

  void _initCentralDateFromStartAndEnd() {
    final offset =
        _timelineWidth /
        2 /
        (_tickGap + widget.tickWidth) *
        (_interval.inMicroseconds / widget.minorTickCount);

    _centralDateFromStart = _startDate.add(Duration(microseconds: offset.floor()));
    _centralDateFromEnd = _endDate.subtract(Duration(microseconds: offset.floor()));
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _clampCentralDate(
      _centralDate.value.subtract(Duration(milliseconds: details.delta.dx.toInt() * _dragSpeed)),
    );
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

  void _onTimeChanged(DateTime time) {
    _time.value = time;
  }

  void _showOverlay(double dx, {DateTime? date, bool isCenter = false}) {
    if (_isInteracting) return;

    final parentBox = _globalKey.currentContext!.findRenderObject() as RenderBox;
    final parentOffset = parentBox.localToGlobal(Offset.zero);

    _hoverDate = date ?? _calculateDateFromOffset(dx);
    _hoverDate = _hoverDate!.addIf(
      _cameraLiveBloc.state.timelineDisplayMode.timeOffset,
      _hoverDate!.isBetween(_startDate, _endDate, equal: false),
    );

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height - parentOffset.dy + 6,
        left:
            parentOffset.dx +
            (isCenter ? parentBox.size.width / 2 - _overlayWidth - 16 + _centralOffset : dx - 22),
        child: Material(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          child: SizeObserver(
            onChange: (size) => _overlayWidth = size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              child: Text(
                _hoverDate!.format(widget.formatPattern),
                style: AppTypography.style(13, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    final mode = context.select<CameraLiveBloc, TimelineDisplayMode>(
      (bloc) => bloc.state.timelineDisplayMode,
    );

    return Row(
      key: _globalKey,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xFF3C3C3C)),
            child: LayoutBuilder(
              builder: (context, constraints) {
                _timelineWidth = constraints.maxWidth;
                if (widget.size != null && !widget.size!.width.isInfinite) {
                  _timelineWidth = widget.size!.width;
                }

                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onExit: (_) {
                    _overlayEntry?.remove();
                    _overlayEntry = null;
                  },
                  onHover: (event) {
                    if (_isInteracting) return;
                    _showOverlay(event.localPosition.dx);
                  },
                  child: GestureDetector(
                    // Khi nhả click, nếu drag thì sẽ không chạy hàm này nữa (onTapDown sẽ gọi trước khi click để drag)
                    onTapUp: (details) {
                      _cameraLiveBloc.state.playbackController.ref.currentState?.jumpToDate(
                        _hoverDate ?? _calculateDateFromOffset(details.localPosition.dx),
                      );
                    },
                    onHorizontalDragUpdate: _onHorizontalDragUpdate,
                    onHorizontalDragStart: (_) {
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                    onHorizontalDragEnd: (details) {
                      _isInteracting = false;
                      _showOverlay(details.localPosition.dx); // Hiển thị luôn lúc thả
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
                              _cameraLiveBloc.state.playbackController
                                ..onPlaybackChanged = _onPlaybackChanged
                                ..onTimeChanged = _onTimeChanged;
                            }
                            return true;
                          },
                          builder: (context, state) {
                            return ValueListenableBuilder(
                              valueListenable: _time,
                              builder: (context, currentTime, child) {
                                return CustomPaint(
                                  size: Size(
                                    _timelineWidth,
                                    widget.size?.height ?? widget.majorTickHeight,
                                  ),
                                  isComplex: true,
                                  willChange: true,
                                  painter: TimelinePainter(
                                    showMinorTickTime: mode == TimelineDisplayMode.h1,
                                    onCentralOffset: (offset) => _centralOffset = offset,
                                    majorTickHeight: widget.majorTickHeight,
                                    minorTickHeight: widget.minorTickHeight,
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
                                    normalStyle: widget.normalStyle,
                                    highlightStyle: widget.highlightStyle,
                                    playbackColor: widget.playbackColor,
                                    centralLineColor: widget.centralLineColor,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        /*  */
        _buildTimelineMode(mode),
      ],
    );
  }

  Widget _buildTimelineMode(TimelineDisplayMode mode) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.65), blurRadius: 9, offset: Offset(-4, 0)),
        ],
      ),
      width: 74,
      height: widget.size?.height ?? widget.majorTickHeight,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          Expanded(
            child: Text(
              mode.label,
              style: AppTypography.style(16, fontWeight: FontWeight.w500, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 4),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 7,
            children: <Widget>[
              InkWell(
                onTap: () => _cameraLiveBloc.add(ChangeTimelineDisplayMode(mode.next)),
                child: SvgPicture.asset(AppAssets.icArrowChevronUp, width: 20, height: 20),
              ),
              InkWell(
                onTap: () => _cameraLiveBloc.add(ChangeTimelineDisplayMode(mode.previous)),
                child: SvgPicture.asset(AppAssets.icArrowChevronDown, width: 20, height: 20),
              ),
            ],
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}

enum TimelineDisplayMode {
  h24('24h', Duration(hours: 1), 5, Duration(minutes: 2)),
  h8('8h', Duration(hours: 1), 5, Duration(minutes: 1)),
  h1('1h', Duration(hours: 1), 5, Duration(minutes: 1));

  final String label;
  final Duration interval;
  final int minorTicks;
  final Duration timeOffset;

  const TimelineDisplayMode(this.label, this.interval, this.minorTicks, this.timeOffset);

  double gap(double width) {
    final size = switch (this) {
      TimelineDisplayMode.h24 => 24,
      TimelineDisplayMode.h8 => 8,
      TimelineDisplayMode.h1 => 1,
    };

    return max((width - size * 5) / (size * minorTicks), 10);
  }

  TimelineDisplayMode get next => switch (this) {
    TimelineDisplayMode.h1 => TimelineDisplayMode.h8,
    TimelineDisplayMode.h8 => TimelineDisplayMode.h24,
    TimelineDisplayMode.h24 => TimelineDisplayMode.h1,
  };
  TimelineDisplayMode get previous => switch (this) {
    TimelineDisplayMode.h1 => TimelineDisplayMode.h24,
    TimelineDisplayMode.h8 => TimelineDisplayMode.h1,
    TimelineDisplayMode.h24 => TimelineDisplayMode.h8,
  };
}
