import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

class PlayerTimelinePainter extends CustomPainter {
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueNotifier<DateTime> _centralDate;
  final List<PlaybackVideo> playbacks;

  final void Function(double offset)? onCentralOffset;

  // Time
  final TextStyle normalStyle;
  final TextStyle highlightStyle;
  final String formatPattern;

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
  late final Path _path = Path();
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

  PlayerTimelinePainter({
    this.onCentralOffset,
    this.majorTickHeight,
    this.minorTickHeight,
    required this.minorTickCount,
    required this.tickGap,
    required this.tickWidth,
    required this.interval,
    this.startDate,
    this.endDate,
    required ValueNotifier<DateTime> centralDate,
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
  bool shouldRepaint(covariant PlayerTimelinePainter oldDelegate) {
    return oldDelegate.playbacks != playbacks;
  }

  @override
  void paint(Canvas canvas, Size size) {
    /// Trường hợp central gần về start
    final leftCentralOffset = startDate?.let((startDate) {
      final offset = _getOffset(central, startDate);
      return offset <= size.width / 2 ? offset : null;
    });
    if (leftCentralOffset != null) {
      _drawPlaybacks(canvas, size, leftCentralOffset);
      return _drawTimelineFromStart(canvas, size, leftCentralOffset);
    }

    /// Trường hợp central gần về start
    final rightCentralOffset = endDate?.let((endDate) {
      final offset = _getOffset(endDate, central);
      return offset <= size.width / 2 ? offset : null;
    });
    if (rightCentralOffset != null) {
      _drawPlaybacks(canvas, size, size.width - rightCentralOffset);
      return _drawTimelineFromEnd(canvas, size, size.width - rightCentralOffset);
    }

    /// Trường hợp central ở giữa
    _drawPlaybacks(canvas, size, size.width / 2);
    canvas.translate(size.width / 2, 0); // Bắt đầu từ chính giữa
    _drawTimelineFromMiddle(canvas, Size(size.width / 2, size.height));
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

      _drawTick(canvas, size, offsetX, isMajorTick, true);

      if (isMajorTick) {
        _drawTime(canvas, size, offsetX, displayDate, true);
        index = minorTickCount;
        displayDate = displayDate.subtract(interval);
      }
    }

    // Vẽ bên phải central
    displayDate = nearestMajorTick.add(interval);
    index = numStepFromNearestTickToMajorTick.toInt() + 1;
    for (double j = 0, i = 1; j < size.width; index++, j += minorIntervalWidth, i++) {
      final offsetX = i * minorIntervalWidth - diffFromCentralToNearestTick;
      bool isMajorTick = index == minorTickCount;

      // Vẽ bên trái central
      _drawTick(canvas, size, offsetX, isMajorTick, false);

      if (isMajorTick) {
        index = 0;
        _drawTime(canvas, size, offsetX, displayDate, false);
        displayDate = displayDate.add(interval);
      }
    }

    // Vẽ central
    _drawCurrentTick(canvas, size, 0);
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

      _drawTick(canvas, size, offsetX, isMajorTick, isHighlighted);

      if (isMajorTick) {
        _drawTime(canvas, size, offsetX, displayDate, isHighlighted);
        index = 0;
        displayDate = displayDate.add(interval);
      }
    }

    // Vẽ central --> offset convert về sát 0 do check = 0 thì tương ứng với center
    _drawCurrentTick(canvas, size, max(centralOffsetX, 0.0000000001));
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

      _drawTick(canvas, size, j, isMajorTick, isHighlighted);

      if (isMajorTick) {
        _drawTime(canvas, size, j, displayDate, isHighlighted, isReverse: j == size.width);
        index = 0;
        displayDate = displayDate.subtract(interval);
      }
    }

    // Vẽ central
    _drawCurrentTick(canvas, size, centralOffsetX);
  }

  /*  */
  void _drawTime(
    Canvas canvas,
    Size size,
    double offsetX,
    DateTime currentTime,
    bool isHighlighted, {
    bool isReverse = false,
  }) {
    _textSpan = TextSpan(
      text: DateFormat(formatPattern).format(currentTime),
      style: isHighlighted ? highlightStyle : normalStyle,
    );
    _textPainter.text = _textSpan;

    _textPainter.layout(minWidth: 0, maxWidth: size.width);

    if (isReverse) {
      _textPainter.paint(canvas, Offset(offsetX - 4 - _textPainter.width, 2));
    } else {
      _textPainter.paint(canvas, Offset(offsetX + 4, 2));
    }
  }

  void _drawTick(Canvas canvas, Size size, double offsetX, bool isMajorTick, bool isHighlighted) {
    final height =
        size.height -
        (isMajorTick ? majorTickHeight ?? size.height : minorTickHeight ?? size.height / 2);

    canvas.drawPath(
      _path
        ..reset()
        ..moveTo(offsetX, size.height - 1) // Xuống đáy
        ..lineTo(offsetX, height + 1), // Lên trên
      isHighlighted ? majorTickPaint : minorTickPaint,
    );
  }

  void _drawCurrentTick(Canvas canvas, Size size, double offsetX) {
    // Vẽ từ giữa thì offset tính từ giữa luôn -- size.width sẽ là 1/2 timelineWidth
    // Vẽ từ trái/phải thì offset tính từ trái/phải -- size.width sẽ là timelineWidth
    onCentralOffset?.call(offsetX == 0 ? 0 : offsetX - size.width / 2);

    canvas.drawPath(
      _path
        ..reset()
        ..moveTo(offsetX, size.height) // Xuống đáy dưới tại offsetX
        ..lineTo(offsetX, 0), // Vẽ từ đáy dưới lên đáy trên
      centralLinePaint,
    );
  }

  void _drawPlaybacks(Canvas canvas, Size size, double centralOffsetX) {
    if (playbacks.isEmpty) return;

    double currentOffset = centralOffsetX;
    DateTime comparedTime = central;
    for (final playback in playbacks) {
      final endOffset = _getOffset(playback.endTime, comparedTime);
      final durationOffset = _getOffset(playback.endTime, playback.startTime);

      if (endOffset + durationOffset > size.width) continue;

      currentOffset += endOffset;
      canvas.drawRect(
        Rect.fromPoints(
          Offset(currentOffset, size.height),
          Offset(currentOffset - durationOffset, 0),
        ),
        rectLinePaint,
      );
      comparedTime = playback.startTime;
      currentOffset -= durationOffset;

      if (currentOffset < 0) break;
    }
  }

  double _getOffset(DateTime from, DateTime to) {
    return from.difference(to).inMicroseconds / minorInterval.inMicroseconds * minorIntervalWidth;
  }
}
