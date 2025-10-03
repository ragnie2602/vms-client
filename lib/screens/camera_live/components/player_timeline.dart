import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';

import '../widgets/player_timeline_painter.dart';

class PlayerTimeline extends StatefulWidget {
  const PlayerTimeline({
    super.key,
    this.tickWidth = 1,
    this.tickGap = 42, // 21
    this.minorTickCount = 5, // 10
    this.interval = const Duration(minutes: 15), // seconds: 1
    this.majorTickHeight = 90,
    this.minorTickHeight = 36,
    this.formatPattern = 'HH:mm:ss',
    this.startDate,
    this.endDate,
    this.size,
  });

  final double tickWidth;
  final double tickGap;
  final int minorTickCount;
  final Duration interval;
  final double majorTickHeight;
  final double? minorTickHeight;
  final String formatPattern;
  final DateTime? startDate;
  final DateTime? endDate;
  final Size? size;

  @override
  State<PlayerTimeline> createState() => _PlayerTimelineState();
}

class _PlayerTimelineState extends State<PlayerTimeline> {
  late final _centralDate = ValueNotifier(
    DateTime.now().copyWith(microsecond: 0, millisecond: 0),
  );
  late Timer _timer;

  bool _isInteracting = false;
  double _centralOffset = 0;
  double _timelineWidth = 0;

  int get _dragSpeed => widget.interval.let((duration) {
    return widget.minorTickCount *
        switch (duration) {
          Duration d when d.inSeconds % 60 == 0 => 1000, // phút -- tua theo hệ số 1s
          Duration d when d.inMinutes % 60 == 0 => 10000, // giờ - tua theo hệ số 10s
          _ => 100, // giây
        };
  });

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_isInteracting || _centralDate.value.isAfter(DateTime.now())) return;

      // _centralDate.value = DateTime.now().copyWith(microsecond: 0, millisecond: 0);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    final diffFromClickToCentral =
        (details.localPosition.dx - _timelineWidth / 2 - _centralOffset) /
        (widget.tickGap + widget.tickWidth) *
        (widget.interval.inMicroseconds / widget.minorTickCount);

    _validateCentralDate(
      _centralDate.value.add(Duration(microseconds: diffFromClickToCentral.round())),
    );
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _validateCentralDate(
      _centralDate.value.subtract(Duration(milliseconds: details.delta.dx.toInt() * _dragSpeed)),
    );
  }

  void _validateCentralDate(DateTime target) {
    if (widget.startDate != null && target.isBefore(widget.startDate!)) return;
    if (widget.endDate != null && target.isAfter(widget.endDate!)) return;

    _centralDate.value = target;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _timelineWidth = widget.size?.width ?? constraints.maxWidth;

        return GestureDetector(
          onTapDown: _onTapDown,
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragStart: (_) => _isInteracting = true,
          onHorizontalDragEnd: (_) => _isInteracting = false,
          child: RepaintBoundary(
            child: CustomPaint(
              size: Size(_timelineWidth, widget.size?.height ?? widget.majorTickHeight),
              isComplex: true,
              willChange: true,
              painter: PlayerTimelinePainter(
                onCentralOffset: (offset) => _centralOffset = offset,
                majorTickHeight: widget.majorTickHeight,
                minorTickHeight: widget.minorTickHeight,
                minorTickCount: widget.minorTickCount,
                tickGap: widget.tickGap,
                tickWidth: widget.tickWidth,
                centralDate: _centralDate,
                startDate: widget.startDate,
                endDate: widget.endDate,
                interval: widget.interval,
                formatPattern: widget.formatPattern,
                normalStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                ),
                highlightStyle: const TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
