import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';

import '../bloc/camera_live/camera_live_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
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
    required this.normalStyle,
    required this.highlightStyle,
    this.playbackColor,
    this.centralLineColor,
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
  final TextStyle normalStyle;
  final TextStyle highlightStyle;
  final Color? playbackColor;
  final Color? centralLineColor;

  @override
  State<PlayerTimeline> createState() => _PlayerTimelineState();
}

class _PlayerTimelineState extends State<PlayerTimeline> {
  late final ValueNotifier<DateTime> _centralDate = ValueNotifier(
    DateTime.now().copyWith(microsecond: 0, millisecond: 0),
  );
  Timer? _debounce;

  late final Completer<void> _initCompleter = Completer<void>();
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
  PlaybackBloc get _playbackBloc => context.read<PlaybackBloc>();
  CameraLiveBloc get _cameraLiveBloc => context.read<CameraLiveBloc>();

  @override
  void dispose() {
    _debounce?.cancel();
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
      needDebounce: true,
    );
  }

  void _validateCentralDate(DateTime target, {bool needDebounce = false}) {
    if (widget.startDate != null && target.isBefore(widget.startDate!)) return;
    if (widget.endDate != null && target.isAfter(widget.endDate!)) return;

    _centralDate.value = target;

    // Click thì set ngay
    if (!needDebounce) return _playbackBloc.add(SetPlaybackAtTime(target));

    // Case kéo thả --> debounce
    _debounce?.cancel();
    _debounce = Timer(
      Duration(milliseconds: 500),
      () => _playbackBloc.add(SetPlaybackAtTime(target)),
    );
  }

  Future<void> _playPlayback(PlaybackSuccess state) async {
    if (state.setStartTimeInstantly == true && state.currentPlayback != null) {
      _centralDate.value = state.currentPlayback!.startTime;
    }

    if (_cameraLiveBloc.state.ref.currentState == null) {
      await _initCompleter.future;
    }

    _cameraLiveBloc.add(
      ChangePlayerSource(
        state.currentPlayback!.urlPlayback,
        position: state.currentDuration,
        onDuration: (int milis) {
          if (_isInteracting) return;
          _centralDate.value = state.currentPlayback!.startTime.add(Duration(milliseconds: milis));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _timelineWidth = constraints.maxWidth;
        if (widget.size != null && !widget.size!.width.isInfinite) {
          _timelineWidth = widget.size!.width;
        }

        return GestureDetector(
          onTapDown: _onTapDown,
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragStart: (_) => _isInteracting = true,
          onHorizontalDragEnd: (_) => _isInteracting = false,
          // Không bị vẽ ra ngoài
          child: ClipRRect(
            child: RepaintBoundary(
              child: BlocConsumer<PlaybackBloc, PlaybackState>(
                listener: (context, state) {
                  if (state is PlaybackSuccess && state.currentPlayback != null) {
                    _playPlayback(state);
                  }
                },
                buildWhen: (previous, current) {
                  if (previous is PlaybackSuccess && current is PlaybackSuccess) {
                    return previous.playbacks.length != current.playbacks.length;
                  }
                  return true;
                },
                builder: (context, state) {
                  // Khởi tạo lần đầu tiên
                  if (state is PlaybackSuccess && !_initCompleter.isCompleted) {
                    Future.delayed(Duration.zero, () => _initCompleter.complete());
                  }

                  return CustomPaint(
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
                      playbacks: state.type.isSuccess ? (state as PlaybackSuccess).playbacks : [],
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                      interval: widget.interval,
                      formatPattern: widget.formatPattern,
                      normalStyle: widget.normalStyle,
                      highlightStyle: widget.highlightStyle,
                      playbackColor: widget.playbackColor,
                      centralLineColor: widget.centralLineColor,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
