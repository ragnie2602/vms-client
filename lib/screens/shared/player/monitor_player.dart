// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/background_task.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/core/utils/resolution.dart';
import 'package:vms_flutter_client/core/utils/task_pool.dart';

import 'components/dual_task_queue.dart';
import 'components/fullscreen_portal.dart';
import 'player_controller.dart';

class MonitorPlayer extends StatefulWidget {
  MonitorPlayer({
    Key? key,
    this.size,
    required this.source,
    required this.name,
    required this.mode,
    this.controller,
    this.borderRadius,
    this.labelBuilder,
    this.onStatusChanged,
    this.onInitializedValues,
    this.onLostConnection,
    this.enableZoom = false,
  }) : super(key: key ?? controller?.ref);

  final String source;
  final String name;
  final Size? size;
  final MonitorMode mode;
  final PlayerController? controller;
  final double? borderRadius;
  final Widget Function(String)? labelBuilder;
  final Function(PlayerStatus)? onStatusChanged;
  final Function({required double volume, required double speed})? onInitializedValues;
  final Function()? onLostConnection;
  final bool enableZoom;

  @override
  State<MonitorPlayer> createState() => MonitorPlayerState();
}

class MonitorPlayerState extends State<MonitorPlayer> with TickerProviderStateMixin {
  final ValueNotifier<PlayerStatus> _status = ValueNotifier(PlayerStatus.playing);
  final ValueNotifier<PlayerState> _state = ValueNotifier(PlayerState.initializing);

  final GlobalKey<FullscreenPortalState> _fullscreenKey = GlobalKey();

  final GlobalKey _ivKey = GlobalKey();
  TransformationController? _zoomController;
  AnimationController? _zoomAnimationController;

  late Player _player;
  Completer<bool>? _waitForFirstFrame;

  Timer? _reconnectingTimer;
  Timer? _timer;
  Timer? _debounce;

  double _aspectRatio = 1.0;
  int _lastPosition = -1;
  bool _shouldSyncPlayerTime = true;

  late final DualTaskQueue _dualQueue = DualTaskQueue();

  LiveviewDetailAudioSource get audioSourceMode => AppConfig.LIVEVIEW_DETAIL_AUDIO_SOURCE;

  @override
  void initState() {
    _state.addListener(() => _tryReconnecting(_state.value.isError));
    if (widget.onStatusChanged != null) {
      _status.addListener(() => widget.onStatusChanged?.call(_status.value));
    }

    _initZoom();
    _attachController();

    super.initState();

    _init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInitializedValues?.call(volume: 100, speed: 1);
    });
  }

  void _initZoom() {
    _zoomController?.dispose();
    _zoomAnimationController?.dispose();
    if (widget.enableZoom) {
      _zoomController = TransformationController();
      _zoomAnimationController = AnimationController(vsync: this, duration: Durations.medium1);
    }
  }

  Future<void> _init() async {
    if (widget.mode == MonitorMode.monitoring) {
      TaskPool.instance.add(() async {
        await _initPlayer();
        await _connecting();
        await Future.delayed(const Duration(milliseconds: 100));

        if (!mounted) _tryDisposePlayer();
      });
    } else {
      await _initPlayer();
      await _connecting();
    }
  }

  void _attachController() {
    if (widget.controller == null) return;
    widget.controller!.changeVolume = changeVolume;
    widget.controller!.seek = null;
    widget.controller!.changeSpeed = null;
    widget.controller!.togglePlay = togglePlay;
    widget.controller!.snapshot = snapshot;
    widget.controller!.toggleFullscreen = toggleFullscreen;
    widget.controller!.jumpToDate = null;
    widget.controller!.isInitialized = isInitialized;
  }

  @override
  void dispose() {
    _zoomAnimationController?.dispose();
    _zoomController?.dispose();
    _dualQueue.dispose();
    _reconnectingTimer?.cancel();
    _timer?.cancel();
    _debounce?.cancel();
    _status.dispose();
    _state.dispose();
    _tryDisposePlayer();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MonitorPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enableZoom != oldWidget.enableZoom) _initZoom();
    _attachController();

    // Đổi source
    if (widget.source != oldWidget.source) {
      _dualQueue.add(() async => await _connecting(shortDelay: true));
    }
  }

  Future<void> _tryDisposePlayer() async {
    try {
      await _player.dispose(
        delay: const Duration(milliseconds: 100),
        synchronized: widget.mode == MonitorMode.monitoring,
      );
    } catch (_) {}
  }

  /* =============================== CONNECTION FUNCTIONS =============================== */
  Future<void> _initPlayer() async {
    if (!mounted) return;

    _player = Player();
    _player.onMediaStatus((pre, cur) {
      if (_waitForFirstFrame != null && !_waitForFirstFrame!.isCompleted) {
        if (cur.test(MediaStatus.invalid)) _waitForFirstFrame!.complete(false);
        if (pre.test(MediaStatus.buffering) && cur.test(MediaStatus.buffered)) {
          _waitForFirstFrame!.complete(true);
        }
      }

      return true;
    });

    // Properties
    _player.setProperty('avformat.strict', 'experimental');
    _player.setProperty('avformat.safe', '0');
    _player.setProperty('avio.reconnect', '1');
    _player.setProperty('avio.reconnect_delay_max', '7');
    _player.setProperty('avformat.rtsp_transport', 'tcp');
    _player.setProperty('avformat.extension_picky', '0');
    _player.setProperty('avformat.allowed_segment_extensions', 'ALL');
    _player.videoDecoders = AppConfig.MDK_DECODERS;

    _player.setProperty("avcodec.skip_frame", "1");
    _player.setProperty("avcodec.threads", "1");
    _player.setProperty("avcodec.skip_loop_filter", "all"); // Tắt lọc nhiễu
    // Cho phép decoder bỏ qua một số quy chuẩn khắt khe để giải mã nhanh hơn, tốn ít CPU hơn.
    _player.setProperty("avcodec.flags2", "+fast");
    // Xóa frame khi dừng
    _player.setProperty("video.clear_on_stop", "1");

    // Reduce latency:
    _player.setProperty('avformat.fflags', '+nobuffer');
    _player.setProperty('avformat.fpsprobesize', '0');
    _player.setProperty("avformat.probesize", "32");
    _player.setProperty("avformat.formatprobesize", "0");
    // Không cần phân tích thời lượng vì là live stream
    _player.setProperty('avformat.analyzeduration', '0');

    // No cache
    _player.setBufferRange(min: 0, max: 1, drop: true);
    _player.setFps(20);

    if (widget.mode == MonitorMode.monitoring || audioSourceMode.isOff) {
      _player.activeAudioTracks = [];
      _player.audioDecoders = [];
    }
  }

  void _tryReconnecting(bool isError) {
    if (!mounted) return;
    if (!isError) return _reconnectingTimer?.cancel();

    _reconnectingTimer?.cancel();
    _reconnectingTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (!mounted) return timer.cancel();

      _reconnectingTimer?.cancel();
      await _connecting(showLoading: false);
    });
  }

  Future<void> _connecting({bool showLoading = true, bool shortDelay = false}) async {
    if (!mounted) return;

    _timer?.cancel();
    _debounce?.cancel();
    _reconnectingTimer?.cancel();
    _state.value = showLoading ? PlayerState.initializing : PlayerState.error_again;

    // Nếu kết nối lại sau khi bị disconnect --> set rỗng --> set lại source cũ
    if (_player.media == widget.source) {
      _player.media = "";
      await Future.delayed(const Duration(seconds: 1));
    }

    _waitForFirstFrame = Completer<bool>();
    _player
      ..media = widget.source
      ..state = PlaybackState.playing;

    int textureId = -1;
    try {
      textureId = _player.textureId.value ?? -1;
    } catch (_) {}

    // Chưa có texture --> tạo lại
    if (textureId < 0) {
      final textureConstraints = widget.size?.let(
        (size) => StandardResolution.snapFromSize(size, mode: RoundMode.up),
      );
      textureId = await _player
          .updateTexture(width: textureConstraints?.width, height: textureConstraints?.height)
          .timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT, onTimeout: () => -1);
    }

    final res = await _waitForFirstFrame?.future.timeout(
      AppConfig.PLAYER_INITIALIZATION_TIMEOUT,
      onTimeout: () => false,
    );
    if (res != true) textureId = -1;
    if (res == true && shortDelay) await Future.delayed(const Duration(milliseconds: 500));
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
    _state.value = PlayerState.initialized;

    _timer?.cancel();
    _debounce?.cancel();
    _reconnectingTimer?.cancel();
    _lastPosition = -1;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return _timer?.cancel();

      _player.position.let((pos) {
        if (_lastPosition != pos) {
          // Case đang dừng --> tự động play bởi thư viện --> update _status
          if (_status.value != PlayerStatus.playing && _shouldSyncPlayerTime) {
            _status.value = PlayerStatus.playing;
          }
          _debounceConnectionLost();
        }
        _lastPosition = pos;
      });
    });
  }

  void _debounceConnectionLost() {
    _debounce?.cancel();
    _debounce = Timer(AppConfig.PLAYER_DISCONNECTION_THRESHOLD, () {
      if (!mounted ||
          _status.value == PlayerStatus.finished ||
          _status.value == PlayerStatus.paused ||
          _state.value == PlayerState.error) {
        return;
      }

      Logger.warn("Camera '${widget.name}' disconnected");
      _timer?.cancel();
      _state.value = PlayerState.error;
    });
  }

  /* =============================== CONTROL FUNCTIONS =============================== */
  bool isInitialized() => _state.value == PlayerState.initialized;

  void changeVolume(double volume) {
    _dualQueue.add(() async {
      _player.volume = volume / 100;
      await Future.delayed(Duration(milliseconds: 100));
    });
  }

  Future<void> togglePlay() async {
    if (_player.state == PlaybackState.playing) {
      _shouldSyncPlayerTime = false;
      _player.pause();
      _status.value = PlayerStatus.paused;
    } else {
      _shouldSyncPlayerTime = true;
      _player.play();
      _status.value = PlayerStatus.playing;
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

  void toggleFullscreen() {
    _fullscreenKey.currentState?.toggleFullscreen(context);
  }

  /* =============================== BUILD =============================== */
  @override
  Widget build(BuildContext context) {
    return FullscreenPortal(
      key: _fullscreenKey,
      tag: hashCode.toString(),
      builder: (isFullscreen) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(widget.borderRadius ?? 0),
          color: Colors.black,
        ),
        width: double.infinity,
        height: double.infinity,
        child: wrapWithInteractiveViewerIfEnabled(
          key: isFullscreen ? null : _ivKey,
          child: ValueListenableBuilder<PlayerState>(
            valueListenable: _state,
            builder: (context, state, _) => switch (state) {
              PlayerState.empty => Center(
                child: Text(
                  'Không có dữ liệu!',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              PlayerState.initializing => const Center(child: CircularProgressIndicator.adaptive()),
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
                          final player = id == null
                              ? const SizedBox.shrink()
                              : widget.borderRadius != null
                              ? ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(widget.borderRadius!),
                                  child: Texture(textureId: id),
                                )
                              : Texture(textureId: id);

                          return player;
                        },
                      ),
                    ),
                  ),

                  if (widget.labelBuilder != null) widget.labelBuilder!.call(widget.name),
                  Positioned.fill(child: _buildPlayerStatus()),
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

  Widget _buildPlayerStatus() {
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

  Widget _buildError() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.videocam_off, color: Colors.red, size: 36),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Camera ${widget.name} đang ngoại tuyến',
                style: AppTypography.style(13, color: Colors.white, lineHeight: 1.25),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
