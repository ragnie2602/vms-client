import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/size_observer.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/screens/camera_detail/components/player_timeline.dart';
import 'package:vms_flutter_client/screens/camera_detail/widgets/timeline_painter.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';

class MultiPlaybackTimeshiftWidget extends StatefulWidget {
  const MultiPlaybackTimeshiftWidget({
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
  State<MultiPlaybackTimeshiftWidget> createState() =>
      _MultiPlaybackTimeshiftWidgetState();
}

class _MultiPlaybackTimeshiftWidgetState
    extends State<MultiPlaybackTimeshiftWidget> {
  late final _time = ValueNotifier(DateTime.now().roundToSecond);
  late final _centralDate = ValueNotifier(DateTime.now().roundToSecond);

  OverlayEntry? _overlayEntry;

  final GlobalKey _globalKey = GlobalKey();
  DateTime? _hoverDate;

  double _timelineWidth = 0;
  bool _isInteracting = false;
  double _centralOffset = 0;
  double _overlayWidth = 0;

  //
  MultiPlaybackBloc get _multiPlaybackBloc => context.read<MultiPlaybackBloc>();
  double get _tickGap =>
      _multiPlaybackBloc.state.timelineDisplayMode.gap(_timelineWidth);
  Duration get _interval =>
      _multiPlaybackBloc.state.timelineDisplayMode.interval;
  DateTime get _startDate => _multiPlaybackBloc.state.playbackDate.startOfDay;
  DateTime get _endDate => _multiPlaybackBloc.state.playbackDate.startOfNextDay;
  int get _dragSpeed => _multiPlaybackBloc.state.timelineDisplayMode.let(
    (mode) => switch (mode) {
      TimelineDisplayMode.h1 => 2500,
      TimelineDisplayMode.h8 => 10000,
      TimelineDisplayMode.h24 => 10000,
    },
  );

  //
  DateTime? _centralDateFromStart;
  DateTime? _centralDateFromEnd;

  @override
  void dispose() {
    _time.dispose();
    _overlayEntry?.remove();
    _centralDate.dispose();
    super.dispose();
  }

  void _initCentralDateFromStartAndEnd() {
    final offset =
        _timelineWidth /
        2 /
        (_tickGap + widget.tickWidth) *
        (_interval.inMicroseconds / widget.minorTickCount);

    _centralDateFromStart = _startDate.add(
      Duration(microseconds: offset.floor()),
    );
    _centralDateFromEnd = _endDate.subtract(
      Duration(microseconds: offset.floor()),
    );
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _clampCentralDate(
      _centralDate.value.subtract(
        Duration(milliseconds: details.delta.dx.toInt() * _dragSpeed),
      ),
    );
  }

  void _clampCentralDate(DateTime target) {
    _initCentralDateFromStartAndEnd();

    if (target.isBefore(_centralDateFromStart!))
      target = _centralDateFromStart!;
    if (target.isAfter(_centralDateFromEnd!)) target = _centralDateFromEnd!;

    _centralDate.value = target;
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

  void _showOverlay(double dx, {DateTime? date, bool isCenter = false}) {
    if (_isInteracting) return;

    final parentBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    final parentOffset = parentBox.localToGlobal(Offset.zero);

    _hoverDate = date ?? _calculateDateFromOffset(dx);
    _hoverDate = _hoverDate!.addIf(
      _multiPlaybackBloc.state.timelineDisplayMode.timeOffset,
      _hoverDate!.isBetween(_startDate, _endDate, equal: false),
    );

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height - parentOffset.dy + 6,
        left:
            parentOffset.dx +
            (isCenter
                ? parentBox.size.width / 2 - _overlayWidth - 16 + _centralOffset
                : dx - 22),
        child: Material(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          child: SizeObserver(
            onChange: (size) => _overlayWidth = size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              child: Text(
                _hoverDate!.format(widget.formatPattern),
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void _onTimeChanged(DateTime time, [bool shouldUpdateCentralDate = false]) {
    _time.value = time;
    if (shouldUpdateCentralDate) _clampCentralDate(time);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiPlaybackBloc, MultiPlaybackState>(
      buildWhen: (previous, current) {
        bool shouldRebuild =
            previous.timelineDisplayMode != current.timelineDisplayMode ||
            previous.mergedPlaybackList != current.mergedPlaybackList ||
            previous.listItemCamPlayback != current.listItemCamPlayback;
        if (shouldRebuild) {
          _clampCentralDate(_time.value);
          for (var item in current.listItemCamPlayback ?? []) {
            item.playerController.onTimeChanged = _onTimeChanged;
          }
        }

        return shouldRebuild;
      },
      builder: (context, state) {
        final mode = state.timelineDisplayMode;

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
                          final date =
                              _hoverDate ??
                              _calculateDateFromOffset(
                                details.localPosition.dx,
                              );
                          for (ItemPlaybackModel? e
                              in _multiPlaybackBloc.state.listItemCamPlayback ??
                                  []) {
                            e?.playerController.jumpToDate?.call(date);
                          }
                        },
                        onHorizontalDragUpdate: _onHorizontalDragUpdate,
                        onHorizontalDragStart: (_) {
                          _overlayEntry?.remove();
                          _overlayEntry = null;
                        },
                        onHorizontalDragEnd: (details) {
                          _isInteracting = false;
                          _showOverlay(
                            details.localPosition.dx,
                          ); // Hiển thị luôn lúc thả
                        },
                        // Không bị vẽ ra ngoài
                        child: ClipRRect(
                          child: RepaintBoundary(
                            child:
                                BlocBuilder<
                                  MultiPlaybackBloc,
                                  MultiPlaybackState
                                >(
                                  builder: (context, state) {
                                    return ValueListenableBuilder(
                                      valueListenable: _time,
                                      builder: (context, currentTime, child) {
                                        return CustomPaint(
                                          size: Size(
                                            _timelineWidth,
                                            widget.size?.height ??
                                                widget.majorTickHeight,
                                          ),
                                          isComplex: true,
                                          willChange: true,
                                          painter: TimelinePainter(
                                            showMinorTickTime:
                                                mode == TimelineDisplayMode.h1,
                                            onCentralOffset: (offset) =>
                                                _centralOffset = offset,
                                            majorTickHeight:
                                                widget.majorTickHeight,
                                            minorTickHeight:
                                                widget.minorTickHeight,
                                            minorTickCount:
                                                widget.minorTickCount,
                                            tickGap: _tickGap, //
                                            interval: _interval, //
                                            tickWidth: widget.tickWidth,
                                            centralDate: _centralDate,
                                            currentTime: currentTime,
                                            playbacks: state.mergedPlaybackList,
                                            startDate: _startDate,
                                            endDate: _endDate,
                                            formatPattern: widget.formatPattern,
                                            normalStyle: widget.normalStyle,
                                            highlightStyle:
                                                widget.highlightStyle,
                                            playbackColor: widget.playbackColor,
                                            centralLineColor:
                                                widget.centralLineColor,
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
      },
    );
  }

  Widget _buildTimelineMode(TimelineDisplayMode mode) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.65),
            blurRadius: 9,
            offset: Offset(-4, 0),
          ),
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
              style: AppTypography.style(
                16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 4),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 7,
            children: <Widget>[
              InkWell(
                onTap: () => _multiPlaybackBloc.add(
                  ChangeTimelineDisplayMode(mode.next),
                ),
                child: SvgPicture.asset(
                  AppAssets.icArrowChevronUp,
                  width: 20,
                  height: 20,
                ),
              ),
              InkWell(
                onTap: () => _multiPlaybackBloc.add(
                  ChangeTimelineDisplayMode(mode.previous),
                ),
                child: SvgPicture.asset(
                  AppAssets.icArrowChevronDown,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
