import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

class TimelinePainter extends CustomPainter {
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueNotifier<DateTime> _centralDate;
  final DateTime currentTime;
  final List<PlaybackVideo> playbacks;

  final void Function(double offset)? onCentralOffset;

  // Time
  final TextStyle normalStyle;
  final TextStyle highlightStyle;
  final String formatPattern;
  final bool showMinorTickTime;

  /// Chiều cao của vạch chính (vạch cao, hiển thị thời gian)
  final double? majorTickHeight;

  /// Chiều cao của vạch nhỏ
  final double? minorTickHeight;

  /// Số lượng vạch nhỏ giữa 2 vạch chính
  final int minorTickCount;

  /// Khoảng cách giữa 2 vạch nhỏ
  final double tickGap;

  /// Chiều rộng của vạch
  final double tickWidth;

  /// Khoảng thời gian giữa 2 vạch chính
  final Duration interval;

  DateTime get central => _centralDate.value;
  late final minorInterval = Duration(microseconds: interval.inMicroseconds ~/ minorTickCount);
  late final minorIntervalWidth = tickGap + tickWidth;

  /*  */
  late final TextPainter _textPainter = TextPainter(textDirection: TextDirection.ltr);
  late TextSpan _textSpan;
  late final Paint centralLinePaint;
  late final majorTickPaint = Paint()
    ..color = highlightStyle.color ?? Colors.white
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = tickWidth;
  late final minorTickPaint = Paint()
    ..color = normalStyle.color ?? Colors.white
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = tickWidth;
  late final Paint rectLinePaint;

  /// Paths
  final Path _majorPath = Path();
  final Path _minorPath = Path();
  final Path _playbackPath = Path();
  final Path _currentTickPath = Path();

  TimelinePainter({
    this.onCentralOffset,
    this.majorTickHeight,
    this.minorTickHeight,
    required this.minorTickCount,
    required this.tickGap,
    required this.tickWidth,
    required this.interval,
    this.showMinorTickTime = false,
    this.startDate,
    this.endDate,
    required ValueNotifier<DateTime> centralDate,
    required this.currentTime,
    required this.formatPattern,
    required this.normalStyle,
    required this.highlightStyle,
    this.playbacks = const [],
    Color? playbackColor,
    Color? centralLineColor,
  }) : _centralDate = centralDate,
       _textSpan = TextSpan(text: '', style: normalStyle),
       rectLinePaint = Paint()
         ..color = playbackColor ?? AppColors.primary
         ..style = PaintingStyle.fill,
       centralLinePaint = Paint()
         ..color = centralLineColor ?? Colors.indigoAccent
         ..strokeCap = StrokeCap.square
         ..style = PaintingStyle.stroke
         ..strokeWidth = tickWidth * 2,
       super(repaint: centralDate);

  @override
  bool shouldRepaint(covariant TimelinePainter oldDelegate) {
    return oldDelegate.playbacks != playbacks ||
        oldDelegate.currentTime != currentTime ||
        oldDelegate.interval != interval ||
        oldDelegate.tickGap != tickGap;
  }

  void _onDrawAll(Canvas canvas) {
    canvas.drawPath(_majorPath, majorTickPaint);
    canvas.drawPath(_minorPath, minorTickPaint);
    canvas.drawPath(_currentTickPath, centralLinePaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // ** RESET PATHS
    _majorPath.reset();
    _minorPath.reset();
    _playbackPath.reset();
    _currentTickPath.reset();

    /// Trường hợp central gần về start
    final leftCentralOffset = startDate?.let((startDate) {
      final offset = _getOffset(central, startDate);
      return offset <= size.width / 2 ? offset : null;
    });
    if (leftCentralOffset != null) {
      _drawPlaybacks(canvas, size, leftCentralOffset);
      _drawTimelineFromStart(canvas, size, leftCentralOffset);
      return _onDrawAll(canvas);
    }

    /// Trường hợp central gần về start
    final rightCentralOffset = endDate?.let((endDate) {
      final offset = _getOffset(endDate, central);
      return offset <= size.width / 2 ? offset : null;
    });
    if (rightCentralOffset != null) {
      _drawPlaybacks(canvas, size, size.width - rightCentralOffset);
      _drawTimelineFromEnd(canvas, size, size.width - rightCentralOffset);
      return _onDrawAll(canvas);
    }

    /// Trường hợp central ở giữa
    _drawPlaybacks(canvas, size, size.width / 2);
    canvas.translate(size.width / 2, 0); // Bắt đầu từ chính giữa
    _drawTimelineFromMiddle(canvas, Size(size.width / 2, size.height));
    return _onDrawAll(canvas);
  }

  void _drawTimelineFromMiddle(Canvas canvas, Size size) {
    final centralMicroseconds = central.microsecondsSinceEpoch;

    // Duration của 1 ô nhỏ
    final nearestTick = DateTime.fromMicrosecondsSinceEpoch(
      centralMicroseconds - centralMicroseconds % minorInterval.inMicroseconds,
    );
    final nearestMajorTick = DateTime.fromMicrosecondsSinceEpoch(
      centralMicroseconds - centralMicroseconds % interval.inMicroseconds,
    );
    final diffFromCentralToNearestTick = _getOffset(central, nearestTick);
    final numStepFromNearestTickToMajorTick =
        nearestTick.difference(nearestMajorTick).inMicroseconds / minorInterval.inMicroseconds;

    // Vẽ bên trái central
    DateTime displayDate = nearestMajorTick;
    int index = numStepFromNearestTickToMajorTick.toInt();
    for (double j = 0, i = 0; j < size.width; index--, j += minorIntervalWidth, i++) {
      final offsetX = -1 * i * minorIntervalWidth - diffFromCentralToNearestTick;
      bool isMajorTick = index == 0;

      Size textSize = Size.zero;
      if (isMajorTick) {
        textSize = _drawTime(canvas, size, offsetX, displayDate, true);
        index = minorTickCount;
        displayDate = displayDate.subtract(interval);
      } else if (showMinorTickTime) {
        // Vẽ major cuối cùng trước --> displayDate đã bị trừ interval rồi --> add
        textSize = _drawTime(canvas, size, offsetX, displayDate.add(minorInterval * index), true);
      }

      _addTickToPath(size, offsetX, isMajorTick, true, textSize);
    }

    // Vẽ bên phải central
    displayDate = nearestMajorTick.add(interval);
    index = numStepFromNearestTickToMajorTick.toInt() + 1;
    for (double j = 0, i = 1; j < size.width; index++, j += minorIntervalWidth, i++) {
      final offsetX = i * minorIntervalWidth - diffFromCentralToNearestTick;
      bool isMajorTick = index == minorTickCount;

      Size textSize = Size.zero;
      if (isMajorTick) {
        index = 0;
        textSize = _drawTime(canvas, size, offsetX, displayDate, false);
        displayDate = displayDate.add(interval);
      } else if (showMinorTickTime) {
        // Vẽ major đầu tiên trước --> displayDate đã được add interval rồi --> trừ
        textSize = _drawTime(
          canvas,
          size,
          offsetX,
          displayDate.subtract(minorInterval * (minorTickCount - index)),
          true,
        );
      }

      // Vẽ bên trái central
      _addTickToPath(size, offsetX, isMajorTick, false, textSize);
    }

    // Vẽ central
    _addCurrentTickToPath(size, _getOffset(currentTime, central));
    onCentralOffset?.call(0);
  }

  void _drawTimelineFromStart(Canvas canvas, Size size, double centralOffsetX) {
    int index = minorTickCount;
    DateTime displayDate = startDate!;
    for (double j = 0, i = 0; j < size.width; j += minorIntervalWidth, i++, index++) {
      if (startDate != null &&
          endDate != null &&
          startDate!.add(minorInterval * i).isAfter(endDate!)) {
        break;
      }

      final offsetX = i * minorIntervalWidth;

      bool isHighlighted = offsetX <= centralOffsetX;
      bool isMajorTick = index == minorTickCount;

      Size textSize = Size.zero;
      if (isMajorTick) {
        textSize = _drawTime(
          canvas,
          size,
          offsetX,
          displayDate,
          isHighlighted,
          isFirst: i == 0,
          isLast: displayDate == endDate,
        );
        index = 0;
        displayDate = displayDate.add(interval);
      } else if (showMinorTickTime) {
        // Vẽ major đầu tiên trước --> displayDate đã được add interval rồi --> trừ
        textSize = _drawTime(
          canvas,
          size,
          offsetX,
          displayDate.subtract(minorInterval * (minorTickCount - index)),
          true,
        );
      }

      _addTickToPath(size, offsetX, isMajorTick, isHighlighted, textSize);
    }

    // Vẽ central --> offset convert về sát 0 do check = 0 thì tương ứng với center
    _addCurrentTickToPath(size, _getOffset(currentTime, startDate!));
    onCentralOffset?.call(max(centralOffsetX, 0.0000000001) - size.width / 2);
  }

  void _drawTimelineFromEnd(Canvas canvas, Size size, double centralOffsetX) {
    int index = minorTickCount;
    DateTime displayDate = endDate!;
    for (double j = size.width, i = 0; j >= 0; j -= minorIntervalWidth, i++, index++) {
      if (endDate != null &&
          startDate != null &&
          endDate!.subtract(minorInterval * i).isBefore(startDate!)) {
        break;
      }

      // Với vạch cuối thì thêm 1 khoảng chênh lệch nhỏ để gần tới thì highlight luôn
      bool isHighlighted = j <= centralOffsetX + (j == size.width ? 5 : 0);
      bool isMajorTick = index == minorTickCount;

      Size textSize = Size.zero;
      if (isMajorTick) {
        textSize = _drawTime(canvas, size, j, displayDate, isHighlighted, isLast: i == 0);
        index = 0;
        displayDate = displayDate.subtract(interval);
      } else if (showMinorTickTime) {
        // Vẽ major cuối cùng trước --> displayDate đã bị trừ interval rồi --> add
        textSize = _drawTime(canvas, size, j, displayDate.add(minorInterval * index), true);
      }

      _addTickToPath(size, j, isMajorTick, isHighlighted, textSize);
    }

    // Vẽ central
    _addCurrentTickToPath(size, size.width - _getOffset(currentTime, endDate!).abs());
    onCentralOffset?.call(centralOffsetX - size.width / 2);
  }

  /*  */
  Size _drawTime(
    Canvas canvas,
    Size size,
    double offsetX,
    DateTime currentTime,
    bool isHighlighted, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    _textSpan = TextSpan(
      text: DateFormat(formatPattern).format(currentTime),
      style: isHighlighted ? highlightStyle : normalStyle,
    );
    _textPainter.text = _textSpan;
    _textPainter.layout(minWidth: 0, maxWidth: double.infinity);

    double _offsetX = offsetX - _textPainter.width / 2;
    if (isFirst) _offsetX = offsetX + 2;
    if (isLast) _offsetX = offsetX - _textPainter.width - 2;

    _textPainter.paint(canvas, Offset(_offsetX, size.height - _textPainter.height - 2));
    return _textPainter.size;
  }

  double? _cachedTextHeight;
  void _addTickToPath(
    Size size,
    double offsetX,
    bool isMajorTick,
    bool isHighlighted,
    Size textSize,
  ) {
    double lineStartPoint = 0;
    double lineEndPoint = 0;

    if (isMajorTick) {
      lineStartPoint = size.height - textSize.height - 4;
      lineEndPoint = majorTickHeight != null ? lineStartPoint - majorTickHeight! - 4 : 4;
    } else if (!isMajorTick) {
      _cachedTextHeight ??=
          (_textPainter
                ..text = TextSpan(text: '00:00', style: normalStyle)
                ..layout())
              .height;

      double spaceAround = minorTickHeight != null
          ? (size.height - _cachedTextHeight! - 4 - minorTickHeight!) / 2
          : (size.height - _cachedTextHeight! - 4) / 4;

      lineStartPoint = size.height - _cachedTextHeight! - 4 - spaceAround;
      lineEndPoint = 4 + spaceAround;
    }

    (isHighlighted ? _majorPath : _minorPath)
      ..moveTo(offsetX, lineStartPoint)
      ..lineTo(offsetX, lineEndPoint);
  }

  void _addCurrentTickToPath(Size size, double offsetX) {
    // Case nằm ngoài startDate và endDate --> không vẽ nữa
    if (startDate != null && endDate != null && !currentTime.isBetween(startDate!, endDate!)) {
      return;
    }

    _currentTickPath
      ..moveTo(offsetX, size.height)
      ..lineTo(offsetX, 0);
  }

  void _drawPlaybacks(Canvas canvas, Size size, double centralOffsetX) {
    if (playbacks.isEmpty) return;

    double currentOffset = centralOffsetX;
    DateTime comparedTime = central;
    for (final playback in playbacks.reversed) {
      final endOffset = _getOffset(playback.endTime, comparedTime);
      final durationOffset = _getOffset(playback.endTime, playback.startTime);

      if (currentOffset + endOffset - durationOffset > size.width) continue;

      currentOffset += endOffset;
      _playbackPath.addRect(
        Rect.fromPoints(
          Offset(currentOffset, size.height),
          Offset(currentOffset - durationOffset, 0),
        ),
      );
      comparedTime = playback.startTime;
      currentOffset -= durationOffset;

      if (currentOffset < 0) break;
    }

    canvas.drawPath(_playbackPath, rectLinePaint);
  }

  double _getOffset(DateTime from, DateTime to) {
    return from.difference(to).inMicroseconds / minorInterval.inMicroseconds * minorIntervalWidth;
  }
}
