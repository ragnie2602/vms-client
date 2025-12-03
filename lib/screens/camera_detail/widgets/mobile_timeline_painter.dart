import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

class MobileTimelinePainter extends CustomPainter {
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueNotifier<DateTime> _centralDate;
  final DateTime currentTime;
  final List<PlaybackVideo> playbacks;

  final void Function(double offset)? onCentralOffset;

  // Time
  final TextStyle timeStyle;
  final String formatPattern;
  final bool showMinorTickTime;

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
  late final Paint tickPaint;
  late final Paint playbackPaint;
  late final Paint unplaybackPaint;

  MobileTimelinePainter({
    this.onCentralOffset,
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
    required this.timeStyle,
    this.playbacks = const [],
    Color? playbackColor,
    Color? unplaybackColor,
    Color? centralLineColor,
    Color? tickColor,
  }) : _centralDate = centralDate,
       _textSpan = TextSpan(text: '', style: timeStyle),
       tickPaint = Paint()
         ..color = tickColor ?? Colors.grey
         ..strokeCap = StrokeCap.round
         ..style = PaintingStyle.stroke
         ..strokeWidth = tickWidth,
       playbackPaint = Paint()
         ..color = playbackColor ?? AppColors.primary
         ..style = PaintingStyle.fill,
       unplaybackPaint = Paint()
         ..color = unplaybackColor ?? Colors.transparent
         ..style = PaintingStyle.fill,
       centralLinePaint = Paint()
         ..color = centralLineColor ?? Colors.indigoAccent
         ..strokeCap = StrokeCap.square
         ..style = PaintingStyle.stroke
         ..strokeWidth = tickWidth,
       super(repaint: centralDate);

  @override
  bool shouldRepaint(covariant MobileTimelinePainter oldDelegate) {
    return oldDelegate.playbacks != playbacks ||
        oldDelegate.currentTime != currentTime ||
        oldDelegate.interval != interval ||
        oldDelegate.tickGap != tickGap;
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

      Size textSize = Size.zero;
      if (isMajorTick) {
        textSize = _drawTime(canvas, size, offsetX, displayDate);
        index = minorTickCount;
        displayDate = displayDate.subtract(interval);
      } else if (showMinorTickTime) {
        // Vẽ major cuối cùng trước --> displayDate đã bị trừ interval rồi --> add
        textSize = _drawTime(canvas, size, offsetX, displayDate.add(minorInterval * index));
      }

      _drawTick(canvas, size, offsetX, isMajorTick, textSize);
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
        textSize = _drawTime(canvas, size, offsetX, displayDate);
        displayDate = displayDate.add(interval);
      } else if (showMinorTickTime) {
        // Vẽ major đầu tiên trước --> displayDate đã được add interval rồi --> trừ
        textSize = _drawTime(
          canvas,
          size,
          offsetX,
          displayDate.subtract(minorInterval * (minorTickCount - index)),
        );
      }

      // Vẽ bên trái central
      _drawTick(canvas, size, offsetX, isMajorTick, textSize);
    }

    // Vẽ central
    _drawCurrentTick(canvas, size, _getOffset(currentTime, central));
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

      bool isMajorTick = index == minorTickCount;

      Size textSize = Size.zero;
      if (isMajorTick) {
        textSize = _drawTime(
          canvas,
          size,
          offsetX,
          displayDate,
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
        );
      }

      _drawTick(canvas, size, offsetX, isMajorTick, textSize);
    }

    // Vẽ central --> offset convert về sát 0 do check = 0 thì tương ứng với center
    _drawCurrentTick(canvas, size, _getOffset(currentTime, startDate!));
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
      bool isMajorTick = index == minorTickCount;

      Size textSize = Size.zero;
      if (isMajorTick) {
        textSize = _drawTime(canvas, size, j, displayDate, isLast: i == 0);
        index = 0;
        displayDate = displayDate.subtract(interval);
      } else if (showMinorTickTime) {
        // Vẽ major cuối cùng trước --> displayDate đã bị trừ interval rồi --> add
        textSize = _drawTime(canvas, size, j, displayDate.add(minorInterval * index));
      }

      _drawTick(canvas, size, j, isMajorTick, textSize);
    }

    // Vẽ central
    _drawCurrentTick(canvas, size, size.width - _getOffset(currentTime, endDate!).abs());
    onCentralOffset?.call(centralOffsetX - size.width / 2);
  }

  /*  */
  Size _drawTime(
    Canvas canvas,
    Size size,
    double offsetX,
    DateTime currentTime, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    _textSpan = TextSpan(text: DateFormat(formatPattern).format(currentTime), style: timeStyle);
    _textPainter.text = _textSpan;

    _textPainter.layout(minWidth: 0, maxWidth: size.width);

    double _offsetX = offsetX - _textPainter.width / 2;
    if (isFirst) _offsetX = offsetX + 2;
    if (isLast) _offsetX = offsetX - _textPainter.width - 2;

    _textPainter.paint(canvas, Offset(_offsetX, 6));
    return _textPainter.size;
  }

  double? _cachedTextHeight;
  void _drawTick(Canvas canvas, Size size, double offsetX, bool isMajorTick, Size textSize) {
    _cachedTextHeight ??= (TextPainter(
      text: TextSpan(text: '00:00', style: timeStyle),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width)).height;

    double lineStartPoint = 6 + _cachedTextHeight! + 4;
    if (!isMajorTick) lineStartPoint += 3;
    double lineEndPoint = 6 + _cachedTextHeight! + 14 - 1;

    canvas.drawPath(
      _path
        ..reset()
        ..moveTo(offsetX, lineStartPoint) // Đáy trên
        ..lineTo(offsetX, lineEndPoint), // Đáy dưới
      tickPaint,
    );
  }

  void _drawCurrentTick(Canvas canvas, Size size, double offsetX) {
    // Case nằm ngoài startDate và endDate --> không vẽ nữa
    if (startDate != null && endDate != null && !currentTime.isBetween(startDate!, endDate!)) {
      return;
    }

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

    // Vẽ thanh không có playback
    canvas.drawRect(
      Rect.fromPoints(Offset(0, size.height - 11), Offset(size.width, 33)),
      unplaybackPaint,
    );

    double currentOffset = centralOffsetX;
    DateTime comparedTime = central;
    for (final playback in playbacks.reversed) {
      final endOffset = _getOffset(playback.endTime, comparedTime);
      final durationOffset = _getOffset(playback.endTime, playback.startTime);

      if (endOffset + durationOffset > size.width) continue;

      currentOffset += endOffset;
      canvas.drawRect(
        Rect.fromPoints(
          Offset(currentOffset, size.height - 11),
          Offset(currentOffset - durationOffset, 33),
        ),
        playbackPaint,
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
