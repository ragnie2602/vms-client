// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fvp/mdk.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/common_extensions.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/background_task.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

import 'components/accumulating_seek_queue.dart';
import 'components/dual_task_queue.dart';
import 'components/fullscreen_portal.dart';
import 'components/sequential_task_queue.dart';
import 'player_controller.dart';

class PlaybackPlayer extends StatefulWidget {
  PlaybackPlayer({
    required this.playlist,
    required this.name,
    this.initialIndex = 0,
    required this.controller,
    this.onStatusChanged,
    this.onInitializedValues,
    this.onLostConnection,
    this.labelBuilder,
    this.enableZoom = false,
  }) : super(key: controller.ref);

  final List<PlaybackVideo> playlist;
  final String name;
  final int initialIndex;
  final PlayerController controller;
  final Function(PlayerStatus)? onStatusChanged;
  final Function({required double volume, required double speed})? onInitializedValues;
  final Function()? onLostConnection;
  final Function(String name)? labelBuilder;
  final bool enableZoom;

  @override
  State<PlaybackPlayer> createState() => PlaybackPlayerState();
}

class PlaybackPlayerState extends State<PlaybackPlayer> with TickerProviderStateMixin {
  final ValueNotifier<PlayerStatus> _status = ValueNotifier(PlayerStatus.playing);
  final ValueNotifier<PlayerState> _state = ValueNotifier(PlayerState.initializing);

  final ValueNotifier<bool> _isSeeking = ValueNotifier(false);
  late final ValueNotifier<int> _playlistIndex = ValueNotifier(widget.initialIndex);

  final GlobalKey<FullscreenPortalState> _fullscreenKey = GlobalKey();

  final GlobalKey _ivKey = GlobalKey();
  TransformationController? _zoomController;
  AnimationController? _zoomAnimationController;
  Animation<double>? _zoomAnimation;

  late final Player _player;
  Completer<bool>? _waitForFirstFrame;
  // Trường hợp đổi sang media mới thì có thể trigger status (unloaded + end) --> bị trigger thành lỗi
  Completer<void> _waitForUnloadedOldMedia = Completer<void>()..safeComplete();
  Timer? _completerTimeoutTimer;

  double _aspectRatio = 1.0;
  int _lastPosition = -1;
  bool _shouldSyncPlayerTime = true;
  Timer? _reconnectingTimer;
  Timer? _timer;
  Timer? _debounce;
  late final _seekFlag = SeekFlag(SeekFlag.fromStart | SeekFlag.keyFrame | SeekFlag.inCache);

  late final SequentialTaskQueue _sequentialQueue = SequentialTaskQueue();
  late final DualTaskQueue _dualQueue = DualTaskQueue();
  late final AccumulatingSeekQueue _accumulatingSeekQueue = AccumulatingSeekQueue(onSeek: _seek);

  late final Map<String, int> _playlistMapper;
  int get initialIndex => widget.initialIndex;
  int get currentIndex => _playlistIndex.value;
  PlaybackVideo get currentPlayback => widget.playlist[currentIndex];
  PlaybackVideo? get nextPlayback =>
      currentIndex < widget.playlist.length - 1 ? widget.playlist[currentIndex + 1] : null;

  /// Nếu lần vẽ cuối cùng đó xảy ra sau khi _player.dispose() bắt đầu chạy nhưng trước khi nó hoàn tất
  /// Widget Texture(textureId: id) sẽ cố gắng vẽ một Texture ID đã bị hủy (invalid) --> Crash App.
  bool _isDisposing = false;

  @override
  void initState() {
    _initZoom();
    _attachController();
    _playlistIndex.value = widget.initialIndex;

    _isSeeking.addListener(() {
      if (_status.value == PlayerStatus.finished) _status.value = PlayerStatus.playing;
    });
    _state.addListener(() => _tryReconnecting(_state.value == PlayerState.error));
    _status.addListener(() {
      if (_status.value == PlayerStatus.playing) _shouldSyncPlayerTime = true;
      widget.onStatusChanged?.call(_status.value);
    });
    _playlistIndex.addListener(() => widget.controller.onPlaybackChanged?.call(currentIndex));

    super.initState();
    _zoomAnimationController = AnimationController(vsync: this, duration: Durations.medium1);

    _playlistMapper = Map.fromEntries(
      widget.playlist.mapIndexed((idx, e) => MapEntry(e.urlPlayback, idx)),
    );
    _init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInitializedValues?.call(volume: 100, speed: 1);
      widget.controller.onPlaybackChanged?.call(currentIndex);
      widget.controller.onTimeChanged?.call(currentPlayback.startTime.roundToSecond);
    });
  }

  @override
  void dispose() {
    _isDisposing = true;

    _accumulatingSeekQueue.dispose();
    _sequentialQueue.dispose();
    _playlistIndex.dispose();
    _dualQueue.dispose();
    _cancelTimers();
    _completerTimeoutTimer?.cancel();
    try {
      _player.dispose(synchronized: false);
    } catch (_) {}
    _status.dispose();
    _state.dispose();
    _zoomAnimationController?.dispose();
    _zoomController?.dispose();
    _isSeeking.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PlaybackPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enableZoom != oldWidget.enableZoom) _initZoom();
    _attachController();
  }

  Future<void> _init() async {
    _initPlayer();
    await _connecting();
  }

  void _cancelTimers() {
    _timer?.cancel();
    _debounce?.cancel();
    _reconnectingTimer?.cancel();
  }

  void _initZoom() {
    _zoomController?.dispose();
    _zoomAnimationController?.dispose();
    if (widget.enableZoom) {
      _zoomController = TransformationController();
      _zoomAnimationController = AnimationController(vsync: this, duration: Durations.medium1);
    }
  }

  void _attachController() {
    widget.controller.changeVolume = changeVolume;
    widget.controller.seek = seekQueue;
    widget.controller.changeSpeed = changeSpeed;
    widget.controller.togglePlay = togglePlay;
    widget.controller.snapshot = snapshot;
    widget.controller.zoom = zoom;
    widget.controller.toggleFullscreen = toggleFullscreen;
    widget.controller.jumpToDate = jumpToDateQueue;
    widget.controller.isInitialized = isInitialized;
  }

  void _initPlayer() {
    if (!mounted) return;

    _player = Player();
    _player.onMediaChanged(() {
      _playlistIndex.value = _playlistMapper[_player.nativeMedia] ?? _playlistIndex.value;
    });
    _player.onStateChanged((pre, cur) {
      if (cur == PlaybackState.stopped &&
          currentIndex == widget.playlist.length - 1 &&
          !_isSeeking.value) {
        // Delay để tránh bị override lại khi check timer 1s
        Future.delayed(Duration(milliseconds: 1100), () => _status.value = PlayerStatus.finished);
      }

      // print("=========================> STATE: $pre - $cur");
    });
    _player.onMediaStatus((pre, cur) {
      // Completer
      if (_waitForFirstFrame != null && !_waitForFirstFrame!.isCompleted) {
        if (cur.test(MediaStatus.invalid)) _waitForFirstFrame!.safeComplete(false);
        if (pre.test(MediaStatus.buffering) && cur.test(MediaStatus.buffered)) {
          _waitForFirstFrame!.safeComplete(true);
        }
      }

      // Case mất kết nối giữ chừng (== giống khi kết thúc video)
      // Khi đổi playback thì media cũ có thể bị unloaded + end --> bỏ qua trường hợp này
      if (_waitForUnloadedOldMedia.isCompleted &&
          cur.test(MediaStatus.unloaded) &&
          cur.test(MediaStatus.end) &&
          !(currentIndex == widget.playlist.length - 1 &&
              _player.position + 1000 >= _player.mediaInfo.duration)) {
        Logger.warn("Camera '${widget.name}' disconnected ($pre -> $cur)");
        _state.value = PlayerState.error;
      }

      // Completer unloaded old media (sau check mất kết nối)
      if (!_waitForUnloadedOldMedia.isCompleted && cur.test(MediaStatus.unloaded)) {
        _waitForUnloadedOldMedia.safeComplete();
      }

      // Case bị lỗi
      if (!pre.test(MediaStatus.invalid) && cur.test(MediaStatus.invalid)) {
        Logger.warn("Camera '${widget.name}' invalid ($pre -> $cur)");
        _state.value = PlayerState.error;
      }

      // print("=========================> STATUS: $pre - $cur");
      return true;
    });
    // _player.onEvent((event) {
    //   print(
    //     "=========================> EVENT ${event.category} - ${event.detail} - ${event.error}",
    //   );
    // });

    // ======================= Properties =======================
    _player.setProperty('avformat.strict', 'experimental');
    _player.setProperty('avformat.safe', '0');
    _player.setProperty('avformat.extension_picky', '0');
    _player.setProperty('avformat.allowed_segment_extensions', 'ALL');

    // Giữ lại renderer resource và frame cuối khi dừng (case seek thì vẫn giữ hình ảnh cuối thay vì đen kịt)
    setGlobalOption('videoout.clear_on_stop', 0);

    _player.videoDecoders = AppConfig.MDK_DECODERS;
    // Nếu trong 15 giây không nhận được gói tin nào, ngắt kết nối và báo lỗi.
    _player.setProperty("avformat.timeout", "15000000");
    _player.setProperty("avformat.stimeout", "15000000");
    // Cho phép FFmpeg tự do đệm dữ liệu để xử lý mạng chập chờn
    _player.setProperty('avformat.fflags', '+genpts+discardcorrupt');
    // Tối ưu hóa mạng cho HTTP/MP4
    _player.setProperty('avio.reconnect', '1');
    _player.setProperty('avio.reconnect_delay_max', '7');
    // HTTP persistent connection giúp tái sử dụng kết nối TCP khi seek
    _player.setProperty('http_persistent', '1');
    // Tăng tốc độ phân tích ban đầu (Start nhanh hơn)
    _player.setProperty("avformat.probesize", "500000"); // 500KB là đủ cho MP4 header
    _player.setProperty("avformat.analyzeduration", "1000000"); // 1 giây
    // Cấu hình bộ đệm RAM (Buffer Range) --> Min cao để mượt, max cao để cache trước
    _player.setBufferRange(
      min: 0, // Play ngay
      max: 1000 * 60 * 10, // Cache ~ 10 phút
      drop: false, // TUYỆT ĐỐI KHÔNG DROP (để đảm bảo không mất dữ liệu khi tua)
    );
  }

  void _tryReconnecting(bool isError) {
    if (!mounted || !isError) return _reconnectingTimer?.cancel();

    _cancelTimers();
    _reconnectingTimer = Timer(const Duration(seconds: 5), () async {
      if (!mounted) return _cancelTimers();

      await _connecting(showLoading: false);
    });
  }

  Future<void> _connecting({bool showLoading = true}) async {
    if (!mounted) return;

    _cancelTimers();
    _state.value = showLoading ? PlayerState.initializing : PlayerState.error_again;
    _waitForFirstFrame = Completer<bool>();

    // disable next media (nếu đang có next media)
    _player.setNext("", from: -1);

    // Nếu kết nối lại sau khi bị disconnect --> set rỗng --> set lại source cũ
    if (_player.media == currentPlayback.urlPlayback) {
      _waitForUnloadedOldMedia = Completer<void>();
      _player.media = "";
      await _waitForUnloadedOldMedia.future.timeout(Duration(seconds: 1), onTimeout: () => false);
      await Future.delayed(Duration(milliseconds: 150));
      _waitForUnloadedOldMedia.safeComplete();
    }

    _player
      ..media = currentPlayback.urlPlayback
      ..state = PlaybackState.playing;

    int textureId = -1;
    try {
      textureId = _player.textureId.value ?? -1;
    } catch (_) {}

    // Chưa có texture --> tạo lại
    if (textureId < 0) {
      textureId = await _player.updateTexture(timeout: AppConfig.PLAYER_INITIALIZATION_TIMEOUT);

      // Lỗi thì complete _waitForFirstFrame luôn đỡ phải đợi thêm [PLAYER_INITIALIZATION_TIMEOUT]
      if (textureId < 0) _waitForFirstFrame?.safeComplete(false);
    }

    final res = await _waitForFirstFrame?.future.timeout(
      AppConfig.PLAYER_INITIALIZATION_TIMEOUT,
      onTimeout: () => false,
    );
    if (res != true) textureId = -1;
    _waitForFirstFrame = null;

    // Một vài trường hợp loading lâu nên khi tới đây thì widget có thể đã bị dispose
    if (!mounted) return;

    textureId < 0 ? _state.value = PlayerState.error : await _onInitialized();
  }

  Future<void> _onInitialized() async {
    if (!mounted) return;

    final size = await _player.textureSize.timeout(
      AppConfig.PLAYER_INITIALIZATION_TIMEOUT,
      onTimeout: () => null,
    );
    _aspectRatio = (size?.width ?? 1920) / (size?.height ?? 1080);

    if (_lastPosition > 0) {
      await _seek(Duration(milliseconds: _lastPosition), needInitialized: false);
    }
    _state.value = PlayerState.initialized;

    _cancelTimers();
    _lastPosition = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return _cancelTimers();

      _player.position.let((pos) {
        if (_lastPosition != pos) {
          _handlePlaylistChanged();

          if (_shouldSyncPlayerTime) {
            // Case đang dừng --> tự động play bởi thư viện --> update _status
            if (_status.value != PlayerStatus.playing) _status.value = PlayerStatus.playing;

            // Syncing time
            widget.controller.onTimeChanged?.call(
              currentPlayback.startTime.add(Duration(milliseconds: pos)).roundToSecond,
            );
          }
          // _debounceConnectionLost();
        }
        _lastPosition = pos;
      });
    });
  }

  // void _debounceConnectionLost() {
  //   _debounce?.cancel();
  //   _debounce = Timer(AppConfig.PLAYER_DISCONNECTION_THRESHOLD, () {
  //     if (!mounted ||
  //         _status.value == PlayerStatus.finished ||
  //         _status.value == PlayerStatus.paused ||
  //         _state.value == PlayerState.empty ||
  //         _state.value.isError) {
  //       return;
  //     }
  //     Logger.warn("Camera '${widget.name}' disconnected");
  //     _cancelTimers();
  //     _state.value = PlayerState.error;
  //   });
  // }

  void _handlePlaylistChanged() {
    // Gần hết đoạn playback hiện tại thì setNext tiếp theo để không bị gián đoạn
    if (_player.position + 3000 >= _player.mediaInfo.duration) {
      if (_player.nextMedia.isEmpty && nextPlayback?.urlPlayback != null) {
        // setNext <=> đổi media <=> status từ [unloaded+end] sau đó sang [loading+loaded/invalid]
        // --> FIX: khi hết playback hiện tại và chuyển sang playback tiếp theo --> báo lỗi
        _waitForUnloadedOldMedia = Completer<void>();
        _player.setNext(nextPlayback!.urlPlayback);

        // Sau 10s mà chưa complete thì mark complete luôn (đề phòng)
        _completerTimeoutTimer?.cancel();
        _completerTimeoutTimer = Timer(
          Duration(seconds: 10),
          () => _waitForUnloadedOldMedia.safeComplete(),
        );
      }
    } else if (_player.nextMedia.isNotEmpty) {
      _player.setNext("", from: -1);
    }
  }

  /* =============================== CONTROL FUNCTIONS =============================== */
  Future<void> _ensureConnectingFinished() async {
    /// Trường hợp đang load (mới mở) hoặc reconnecting --> đợi xong mới thực hiện jump
    /// await updateTexture (~ await textureSize) --> change media --> textureSize sẽ được complete (null) và khởi tạo lại
    /// --> return -1 --> Hiển thị lỗi
    if (_waitForFirstFrame?.isCompleted == false) {
      final success = await _waitForFirstFrame?.future;

      // Thành công thì đợi state sang initialized (sau khi có textureSize) --> để seek chuẩn
      if (success == true) {
        await _player.textureSize.timeout(
          AppConfig.PLAYER_INITIALIZATION_TIMEOUT,
          onTimeout: () => null,
        );
      }
      // Lỗi --> cancel retry (Tránh reconnecting sau 5s) --> Seek (lỗi/thành công thì sẽ được thực hiện theo date mới)
      else {
        _cancelTimers();
      }

      await Future.delayed(Duration(milliseconds: 150));
    }
  }

  bool _newestIsEmpty = false;
  Future<void> jumpToDateQueue(DateTime date, {int? dateIndex}) async {
    if (!mounted) return;

    _shouldSyncPlayerTime = _newestIsEmpty = false;
    _isSeeking.value = true;
    widget.controller.onTimeChanged?.call(date.roundToSecond, dateIndex != null);

    final index = dateIndex ?? widget.playlist.atTime(date);
    widget.controller.onPlaybackChanged?.call(index ?? -1);
    if (index == null) {
      _isSeeking.value = false;
      _newestIsEmpty = true;
      _state.value = PlayerState.empty;
      _player.pause();
      await _dualQueue.cancelAndReset();
      return;
    }

    _dualQueue.add(() async {
      await _ensureConnectingFinished();
      await _jumpToDate(date, dateIndex: index);

      // Spam click và sau đó click ra ngoài --> bị nhảy về cái trước đó
      if (_dualQueue.nextJobIsEmpty && !_newestIsEmpty) {
        _shouldSyncPlayerTime = true;
        _isSeeking.value = false;
      }
    });
  }

  Future<void> _jumpToDate(DateTime date, {int? dateIndex}) async {
    final index = dateIndex ?? widget.playlist.atTime(date);

    // Click ngoài khoảng playback
    if (index == null) {
      widget.controller.onPlaybackChanged?.call(-1);
      _state.value = PlayerState.empty;
      _player.pause();
      return;
    }

    if (_state.value == PlayerState.empty) {
      _state.value = PlayerState.initialized;
      // đổi initialized trước play do có thể bị đổi từ error --> initialized
      _player.play();
    }

    final diff = date.difference(widget.playlist[index].startTime);

    // Trong khoảng hiện tại --> seek
    if (index == currentIndex) {
      if (diff != Duration.zero) await _seek(diff, needInitialized: false);
    }
    // Playback khác --> đổi playlist và jump
    else {
      // Gán local biến luôn để khi reconnecting tới đúng index đó
      _playlistIndex.value = index;
      _lastPosition = diff.inMilliseconds;

      _player.setNext("", from: -1); // disable next media (đề phòng)
      _waitForUnloadedOldMedia = Completer<void>();
      _player.state = PlaybackState.paused;
      _player.media = widget.playlist[index].urlPlayback;
      await _player.prepare(position: diff.inMilliseconds);
      _player.state = PlaybackState.playing;
      _waitForUnloadedOldMedia.safeComplete();
    }
  }

  void seekQueue(Duration duration) => _accumulatingSeekQueue.add(duration);
  Future<void> _seek(Duration duration, {bool needInitialized = true}) async {
    if ((needInitialized && !isInitialized()) || !mounted) return;
    final _toMs = _player.position + duration.inMilliseconds;
    final _totalMs = _player.mediaInfo.duration;

    // Đầu playlist
    if (_toMs <= 0 && currentIndex == 0) {
      await _player.seek(position: 0, flags: _seekFlag);
      return;
    }
    // Cuối playlist
    if (_toMs >= _totalMs && currentIndex == widget.playlist.length - 1) {
      // Để video nhảy 1 phát xong hiện pause luôn
      await _player.seek(position: _totalMs - 500, flags: _seekFlag);
      return;
    }

    // Tua sang playback tiếp theo
    if (_toMs <= _totalMs && _toMs >= 0) {
      _lastPosition = _toMs;

      await _player.seek(position: _toMs, flags: _seekFlag);
    } else {
      _shouldSyncPlayerTime = false;
      _isSeeking.value = true;
      await _jumpToDate(currentPlayback.startTime.add(Duration(milliseconds: _toMs)));
      _shouldSyncPlayerTime = true;
      _isSeeking.value = false;
    }
  }

  Future<bool> snapshot(String path) async {
    final videoData = _player.mediaInfo.video?.firstOrNull;
    if (videoData == null) return false;

    final res = await _player.snapshot(
      width: videoData.codec.width,
      height: videoData.codec.height,
    );

    if (res == null) return false;

    return await BackgroundTask.encodeRgbaToJpegFile(
      path: path,
      bytes: res,
      width: videoData.codec.width,
      height: videoData.codec.height,
    );
  }

  bool isInitialized() => _state.value == PlayerState.initialized;

  // Dual task queue
  void changeVolume(double volume) {
    _dualQueue.add(() async {
      final clamped = volume.clamp(0, AppConfig.PLAYER_MAX_VOLUME_PERCENT).toDouble();
      _player.volume = clamped / 100;
      await Future.delayed(Duration(milliseconds: 100));
    });
  }

  Future<void> togglePlay() async {
    if (_status.value == PlayerStatus.playing) {
      _shouldSyncPlayerTime = false;
      _player.pause();
      _status.value = PlayerStatus.paused;
    } else {
      _shouldSyncPlayerTime = true;
      _player.play();
      _status.value = PlayerStatus.playing;
    }
  }

  Future<void> changeSpeed(double speed) async {
    _player.playbackRate = speed;
  }

  void toggleFullscreen() {
    _fullscreenKey.currentState?.toggleFullscreen(context);
  }

  void zoom(int type) {
    if (_zoomController == null || _zoomAnimationController == null) return;

    final currentScale = _zoomController!.value.getMaxScaleOnAxis();
    final targetScale = (currentScale + type).clamp(1.0, 16.0);
    if (targetScale == currentScale) return;

    final box = _ivKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final viewportCenter = Offset(box.size.width / 2, box.size.height / 2);
    final _scale = targetScale / currentScale;

    final Matrix4 inverted = Matrix4.inverted(_zoomController!.value);
    final Vector3 v = Vector3(viewportCenter.dx, viewportCenter.dy, 0);
    final Vector3 contentPoint = inverted.transform3(v);
    final Offset focalContent = Offset(contentPoint.x, contentPoint.y);

    final startMatrix = _zoomController!.value.clone();
    final Matrix4 focalToOrigin = Matrix4.identity()
      ..translateByDouble(-focalContent.dx, -focalContent.dy, 0, 1);
    final Matrix4 zoom = Matrix4.identity()..scaleByDouble(_scale, _scale, _scale, 1);
    final Matrix4 back = Matrix4.identity()
      ..translateByDouble(focalContent.dx, focalContent.dy, 0, 1);
    final Matrix4 endMatrix = startMatrix.multiplied(back * zoom * focalToOrigin);

    _zoomAnimationController!.reset();
    _zoomAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _zoomAnimationController!, curve: Curves.easeInOut),
        )..addListener(() {
          _zoomController!.value = startMatrix
              .lerp(endMatrix, _zoomAnimation!.value)
              .clampMatrixToBounds(box.size);
        });

    _zoomAnimationController!.forward();
  }

  // Future<Process?> recording(String output) async {
  //   // Preload - tránh bị mất các giây đầu
  //   // await FFmpegProcess.instance.preload(widget.source);
  //   // Bắt đầu ghi -- time sẽ chuẩn
  //   return FFmpegProcess.instance.record(widget.source, output);
  // }

  @override
  Widget build(BuildContext context) {
    return FullscreenPortal(
      key: _fullscreenKey,
      tag: hashCode.toString(),
      builder: (isFullscreen) => Container(
        decoration: BoxDecoration(color: Colors.black),
        width: double.infinity,
        height: double.infinity,
        child: wrapWithInteractiveViewerIfEnabled(
          key: isFullscreen ? null : _ivKey,
          child: ValueListenableBuilder(
            valueListenable: _state,
            builder: (context, value, child) => switch (value) {
              PlayerState.initializing => const Center(child: CircularProgressIndicator.adaptive()),
              PlayerState.empty => _buildNoPlayback(),
              PlayerState.error || PlayerState.error_again => _buildError(),
              _ => Stack(
                fit: StackFit.expand,
                children: [
                  /* Player */
                  Center(
                    child: AspectRatio(
                      aspectRatio: _aspectRatio,
                      child: ValueListenableBuilder(
                        valueListenable: _player.textureId,
                        builder: (context, id, _) {
                          final player = (id == null || _isDisposing)
                              ? const SizedBox.shrink()
                              : Texture(textureId: id);

                          return player;
                        },
                      ),
                    ),
                  ),

                  if (widget.labelBuilder != null) widget.labelBuilder!.call(widget.name),
                  Positioned.fill(child: _buildPlaybackStatus()),
                  _buildSeekingStatus(),
                ],
              ),
            },
          ),
        ),
      ),
    );
  }

  Widget wrapWithInteractiveViewerIfEnabled({Key? key, required Widget child}) {
    if (!widget.enableZoom) return child;

    return InteractiveViewer(
      key: key,
      minScale: 0.1,
      maxScale: 16.0,
      transformationController: _zoomController,
      child: child,
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 14),
        Icon(Icons.error, color: Colors.red, size: 36),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'Có lỗi xảy ra trong quá trình tải bản ghi',
            style: AppTypography.style(13, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildPlaybackStatus() {
    return ValueListenableBuilder(
      valueListenable: _status,
      builder: (context, status, child) {
        if (status == PlayerStatus.playing) return const SizedBox.shrink();

        return InkWell(
          onTap: togglePlay,
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withValues(alpha: 0.25),
            child: SvgPicture.asset(
              AppAssets.icPlay,
              width: 60,
              height: 60,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSeekingStatus() {
    return ValueListenableBuilder(
      valueListenable: _isSeeking,
      builder: (context, value, child) {
        return Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: value
              ? Container(
                  color: Colors.black.withValues(alpha: 0.15),
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator.adaptive(),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildNoPlayback() {
    return Center(
      child: Text(
        'Không có dữ liệu bản ghi',
        style: AppTypography.style(13, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
