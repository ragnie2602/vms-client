// // ignore_for_file: depend_on_referenced_packages

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:media_kit/media_kit.dart' hide PlayerState;
// import 'package:media_kit_video/media_kit_video.dart';
// import 'package:vms_flutter_client/core/app_config.dart';
// import 'package:vms_flutter_client/core/constants/assets.dart';
// import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
// import 'package:vms_flutter_client/core/constants/typography.dart';
// import 'package:vms_flutter_client/core/utils/date_util.dart';
// import 'package:vms_flutter_client/core/utils/logger.dart';
// import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
// import 'package:vector_math/vector_math_64.dart' show Vector3;

// import 'components/dual_task_queue.dart';
// import 'player_controller.dart';
// import 'components/fullscreen_portal.dart';

// class PlaybackPlayerMK extends StatefulWidget {
//   PlaybackPlayerMK({
//     required this.playlist,
//     required this.name,
//     this.initialIndex = 0,
//     required this.controller,
//     this.onStatusChanged,
//     this.onInitializedValues,
//     this.onLostConnection,
//     this.labelBuilder,
//     this.enableZoom = false,
//     this.initialVolume = 1,
//   }) : super(key: controller.ref);

//   final List<PlaybackVideo> playlist;
//   final String name;
//   final int initialIndex;
//   final PlayerController controller;
//   final Function(PlayerStatus)? onStatusChanged;
//   final Function({required double volume, required double speed})? onInitializedValues;
//   final Function()? onLostConnection;
//   final Function(String name)? labelBuilder;
//   final bool enableZoom;
//   final double initialVolume;

//   @override
//   State<PlaybackPlayerMK> createState() => PlaybackPlayerMKState();
// }

// class PlaybackPlayerMKState extends State<PlaybackPlayerMK> with TickerProviderStateMixin {
//   final GlobalKey<VideoState> _videoKey = GlobalKey();

//   TransformationController? _zoomController;
//   AnimationController? _zoomAnimationController;
//   Animation<double>? _zoomAnimation;

//   late final Player _player;
//   late final VideoController _controller;

//   final ValueNotifier<PlayerStatus> _status = ValueNotifier(PlayerStatus.playing);
//   final ValueNotifier<PlayerState> _state = ValueNotifier(PlayerState.initializing);
//   final ValueNotifier<bool> _isSeeking = ValueNotifier(false);

//   late int _playlistIndex;
//   bool _shouldSyncPlayerTime = true;
//   Timer? _reconnectingTimer;
//   Duration _lastDuration = Duration.zero;

//   StreamSubscription<Duration>? _positionSub;
//   StreamSubscription<Playlist>? _playlistSub;
//   StreamSubscription<void>? _completedSub;
//   StreamSubscription<String>? _errorSub;
//   StreamSubscription<bool>? _playingSub;

//   PlaybackVideo get currentPlayback => widget.playlist[_playlistIndex];
//   int get initialIndex => widget.initialIndex;

//   @override
//   void initState() {
//     _initZoom();
//     _attachController();
//     _playlistIndex = widget.initialIndex;

//     if (widget.onStatusChanged != null) {
//       _status.addListener(() => widget.onStatusChanged?.call(_status.value));
//     }

//     _state.addListener(() => _tryReconnecting(_state.value.isError));

//     super.initState();
//     _zoomAnimationController = AnimationController(vsync: this, duration: Durations.medium1);

//     _initPlayer();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       widget.onInitializedValues?.call(volume: _player.state.volume, speed: _player.state.rate);
//       widget.controller.onPlaybackChanged?.call(_playlistIndex);
//       widget.controller.onTimeChanged?.call(currentPlayback.startTime.roundToSecond);
//     });
//   }

//   @override
//   void dispose() {
//     _dualQueue.dispose();
//     _playingSub?.cancel();
//     _positionSub?.cancel();
//     _playlistSub?.cancel();
//     _completedSub?.cancel();
//     _errorSub?.cancel();
//     _reconnectingTimer?.cancel();
//     _player.dispose();
//     _status.dispose();
//     _state.dispose();
//     _zoomAnimationController?.dispose();
//     _zoomController?.dispose();
//     _isSeeking.dispose();
//     super.dispose();
//   }

//   @override
//   void didUpdateWidget(covariant PlaybackPlayerMK oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.enableZoom != oldWidget.enableZoom) _initZoom();
//     _attachController();
//   }

//   void _initZoom() {
//     _zoomController?.dispose();
//     _zoomAnimationController?.dispose();
//     if (widget.enableZoom) {
//       _zoomController = TransformationController();
//       _zoomAnimationController = AnimationController(vsync: this, duration: Durations.medium1);
//     }
//   }

//   void _attachController() {
//           widget.controller.play = () async {
//             if (_status.value != PlayerStatus.playing) {
//               await _player.play();
//               _status.value = PlayerStatus.playing;
//             }
//           };
//           widget.controller.pause = () async {
//             if (_status.value == PlayerStatus.playing) {
//               await _player.pause();
//               _status.value = PlayerStatus.paused;
//             }
//           };
//       widget.controller.getPlayerState = () => _state.value;
//     widget.controller.changeVolume = changeVolume;
//     widget.controller.seek = seek;
//     widget.controller.changeSpeed = changeSpeed;
//     widget.controller.togglePlay = togglePlay;
//     widget.controller.snapshot = snapshot;
//     widget.controller.zoom = zoom;
//     widget.controller.toggleFullscreen = toggleFullscreen;
//     widget.controller.jumpToDate = jumpToDateQueue;
//     widget.controller.isInitialized = isInitialized;
//     widget.controller.getCurrentPosition = () => _player.state.position;
//   }

//   Future<void> _initPlayer() async {
//     _status.value = PlayerStatus.playing;

//     // Initialize player
//     _player = Player(
//       configuration: PlayerConfiguration(title: widget.name, bufferSize: 3 * 1024 * 1024),
//     );
//     _controller = VideoController(_player);

//     // Open player
//     await _onOpenPlayer();

//     _positionSub = _player.stream.position.listen(_onPositionChanged);
//     _playlistSub = _player.stream.playlist.listen(_onPlaylistChanged);
//     _completedSub = _player.stream.completed.listen(_onCompleted);
//     _errorSub = _player.stream.error.listen(_onError);
//     _playingSub = _player.stream.playing.listen((playing) {
//       if (!playing) return;

//       // Đang dừng --> seeking --> tự play --> update status theo player
//       if (_status.value != PlayerStatus.playing) _status.value = PlayerStatus.playing;

//       // Lỗi --> stop --> position = 0
//       // case đang show lỗi - hiển thị màn đen --> vài s sau lại hiển thị lỗi -- <lặp lại>
//       if (_player.state.position != Duration.zero && _state.value == PlayerState.error) {
//         _state.value = PlayerState.initialized;
//       }
//     });

//     // Set initial volume after player is initialized
//     await _player.setVolume(widget.initialVolume);
//   }

//   Future<void> _onOpenPlayer({Duration? position, bool showLoading = true}) async {
//     _state.value = showLoading ? PlayerState.initializing : PlayerState.error_again;

//     await _player.open(
//       Playlist(widget.playlist.map((e) => Media(e.urlPlayback)).toList(), index: _playlistIndex),
//     );
//     await _player.setPlaylistMode(PlaylistMode.none);
//     if (position != null) await _waitForBufferingAndSeek(position, timeout: 30);

//     try {
//       final size = await Future.wait([
//         _player.stream.width.firstWhere((width) => width != null),
//         _player.stream.height.firstWhere((height) => height != null),
//       ]).timeout(AppConfig.PLAYER_INITIALIZATION_TIMEOUT, onTimeout: () => [null, null]);

//       _state.value = (size[0] != null && size[1] != null)
//           ? PlayerState.initialized
//           : PlayerState.error;
//     } catch (e) {
//       // Case stream bị dispose bên thư viện (đổi cam ...) --> Error "Bad state: No element"
//       if (mounted) _state.value = PlayerState.error;
//     }
//   }

//   final List<String> _loggedErrors = [];
//   void _onError(String error) {
//     _state.value = PlayerState.error;
//     _player.stop();

//     widget.onLostConnection?.call();

//     if (!_loggedErrors.contains(error)) {
//       _loggedErrors.add(error);
//       Logger.error(error, writeLog: true);
//     } else {
//       Logger.error(error, writeLog: false);
//     }
//   }

//   void _onCompleted(bool completed) {
//     if (completed && _playlistIndex == widget.playlist.length - 1) {
//       _status.value = PlayerStatus.finished;
//     }
//   }

//   void _onPositionChanged(Duration position) {
//     if (_shouldSyncPlayerTime == true) {
//       widget.controller.onTimeChanged?.call(currentPlayback.startTime.add(position).roundToSecond);
//     }
//   }

//   void _onPlaylistChanged(Playlist playlist) {
//     // Delay một chút do nhiều lúc stop không kịp nên index bị nhảy lên 1
//     Future.delayed(Durations.short3, () {
//       if (_state.value == PlayerState.error) return;

//       _playlistIndex = playlist.index;
//       widget.controller.onPlaybackChanged?.call(_playlistIndex);
//     });
//   }

//   void _tryReconnecting(bool isError) {
//     if (!isError) return _reconnectingTimer?.cancel();

//     _reconnectingTimer?.cancel();
//     _reconnectingTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
//       if (!mounted) return timer.cancel();

//       _reconnectingTimer?.cancel();
//       await _onOpenPlayer(position: _lastDuration, showLoading: false);
//     });
//   }

//   late final DualTaskQueue _dualQueue = DualTaskQueue();
//   bool _newestIsEmpty = false;
//   Future<void> jumpToDateQueue(DateTime date, {int? dateIndex}) async {
//     _shouldSyncPlayerTime = _newestIsEmpty = false;
//     _isSeeking.value = true;
//     widget.controller.onTimeChanged?.call(date.roundToSecond, dateIndex != null);

//     final index = dateIndex ?? widget.playlist.atTime(date);
//     widget.controller.onPlaybackChanged?.call(index ?? -1);
//     if (index == null) {
//       _isSeeking.value = false;
//       _newestIsEmpty = true;
//       _state.value = PlayerState.empty;
//       await _player.pause();
//       await _dualQueue.cancelAndReset();
//       return;
//     }

//     _dualQueue.add(() async {
//       await _jumpToDate(date, dateIndex: index);

//       // Spam click và sau đó click ra ngoài --> bị nhảy về cái trước đó
//       if (_dualQueue.nextJobIsEmpty && !_newestIsEmpty) {
//         _shouldSyncPlayerTime = true;
//         _isSeeking.value = false;
//       }
//     });
//   }

//   Future<void> _jumpToDate(DateTime date, {int? dateIndex}) async {
//     final index = dateIndex ?? widget.playlist.atTime(date);

//     // Click ngoài khoảng playback
//     if (index == null) {
//       widget.controller.onPlaybackChanged?.call(-1);
//       _state.value = PlayerState.empty;
//       await _player.pause();
//       return;
//     }

//     if (_state.value == PlayerState.empty) {
//       _state.value = PlayerState.initialized;
//       // đổi initialized trước play do có thể bị đổi từ error --> initialized
//       await _player.play();
//     }

//     final diff = date.difference(widget.playlist[index].startTime);

//     // Trong khoảng hiện tại --> seek
//     if (index == _playlistIndex) {
//       if (diff != Duration.zero) await _player.seek(diff);
//     }
//     // Playback khác --> đổi playlist và jump
//     else {
//       // Gán local biến luôn để khi reconnecting tới đúng index đó
//       _playlistIndex = index;
//       _lastDuration = diff;

//       await _player.jump(index);
//       await _waitForBufferingAndSeek(diff);
//     }
//   }

//   Future<void> _waitForBufferingAndSeek(Duration diff, {int timeout = 60}) async {
//     if (_state.value != PlayerState.error) {
//       try {
//         // Đợi tới khi buffering xong (đã chuyển playback) --> Không bị delay + seeking = false chuẩn
//         await _player.stream.buffering
//             .firstWhere((buffering) => buffering == false)
//             .timeout(Duration(seconds: timeout));

//         // Seek tới điểm click
//         if (diff != Duration.zero) await _player.seek(diff);
//       } catch (_) {
//         Logger.error(
//           "Timeout khi buffering --> skip seeking to ${currentPlayback.startTime.add(diff)}",
//           writeLog: true,
//         );
//       }
//     }
//   }

//   Future<bool> snapshot(String path) async {
//     final data = await _player.screenshot();
//     if (data == null) return false;

//     await File(path).writeAsBytes(data);
//     return true;
//   }

//   bool isInitialized() => _state.value == PlayerState.initialized;

//   Future<void> seek(Duration duration) async {
//     final _duration = _player.state.position + duration;

//     // Đầu playlist
//     if (_duration <= Duration.zero && _playlistIndex == 0) {
//       await _player.seek(Duration.zero);
//       return;
//     }
//     // Cuối playlist
//     if (_duration >= _player.state.duration && _playlistIndex == widget.playlist.length - 1) {
//       await _player.seek(_player.state.duration);
//       return;
//     }

//     // Tua sang playback tiếp theo
//     if (_duration <= _player.state.duration && _duration >= Duration.zero) {
//       await _player.seek(_duration);
//     } else {
//       _shouldSyncPlayerTime = false;
//       _isSeeking.value = true;
//       await _jumpToDate(currentPlayback.startTime.add(_duration));
//       _shouldSyncPlayerTime = true;
//       _isSeeking.value = false;
//     }
//   }

//   // Dual task queue
//   void changeVolume(double volume) {
//     _dualQueue.add(() async {
//       await _player.setVolume(volume);
//     });
//   }

//   Future<void> togglePlay() async {
//     if (_status.value == PlayerStatus.playing) {
//       await _player.pause();
//       _status.value = PlayerStatus.paused;
//     } else {
//       await _player.play();
//       _status.value = PlayerStatus.playing;
//     }
//   }

//   Future<void> changeSpeed(double speed) async {
//     await _player.setRate(speed);
//   }

//   void toggleFullscreen() {
//     _videoKey.currentState?.enterFullscreen();
//   }

//   void zoom(int type) {
//     if (_zoomController == null || _zoomAnimationController == null) return;

//     final currentScale = _zoomController!.value.getMaxScaleOnAxis();
//     final targetScale = (currentScale + type).clamp(1.0, 16.0);
//     if (targetScale == currentScale) return;

//     final box = _videoKey.currentContext?.findRenderObject() as RenderBox?;
//     if (box == null) return;

//     final viewportCenter = Offset(box.size.width / 2, box.size.height / 2);
//     final _scale = targetScale / currentScale;

//     final Matrix4 inverted = Matrix4.inverted(_zoomController!.value);
//     final Vector3 v = Vector3(viewportCenter.dx, viewportCenter.dy, 0);
//     final Vector3 contentPoint = inverted.transform3(v);
//     final Offset focalContent = Offset(contentPoint.x, contentPoint.y);

//     final startMatrix = _zoomController!.value.clone();
//     final Matrix4 focalToOrigin = Matrix4.identity()
//       ..translateByDouble(-focalContent.dx, -focalContent.dy, 0, 1);
//     final Matrix4 zoom = Matrix4.identity()..scaleByDouble(_scale, _scale, _scale, 1);
//     final Matrix4 back = Matrix4.identity()
//       ..translateByDouble(focalContent.dx, focalContent.dy, 0, 1);
//     final Matrix4 endMatrix = startMatrix.multiplied(back * zoom * focalToOrigin);

//     _zoomAnimationController!.reset();
//     _zoomAnimation =
//         Tween<double>(begin: 0.0, end: 1.0).animate(
//           CurvedAnimation(parent: _zoomAnimationController!, curve: Curves.easeInOut),
//         )..addListener(() {
//           _zoomController!.value = startMatrix
//               .lerp(endMatrix, _zoomAnimation!.value)
//               .clampMatrixToBounds(box.size);
//         });

//     _zoomAnimationController!.forward();
//   }

//   // Future<Process?> recording(String output) async {
//   //   // Preload - tránh bị mất các giây đầu
//   //   // await FFmpegProcess.instance.preload(widget.source);
//   //   // Bắt đầu ghi -- time sẽ chuẩn
//   //   return FFmpegProcess.instance.record(widget.source, output);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.black),
//       child: ValueListenableBuilder(
//         valueListenable: _state,
//         builder: (context, value, child) {
//           return switch (value) {
//             PlayerState.initializing => const Center(child: CircularProgressIndicator.adaptive()),
//             PlayerState.empty => _buildNoPlayback(),
//             PlayerState.error || PlayerState.error_again => _buildError(),
//             PlayerState.initialized => _wrapWithInteractiveViewer(
//               Video(
//                 key: _videoKey,
//                 height: double.infinity,
//                 fit: BoxFit.fitHeight,
//                 controller: _controller,
//                 subtitleViewConfiguration: SubtitleViewConfiguration(visible: false),
//                 controls: (state) => Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     if (widget.labelBuilder != null) widget.labelBuilder!.call(widget.name),
//                     Positioned.fill(child: _buildPlaybackStatus()),

//                     ValueListenableBuilder(
//                       valueListenable: _isSeeking,
//                       builder: (context, value, child) {
//                         return Positioned(
//                           top: 0,
//                           right: 0,
//                           left: 0,
//                           bottom: 0,
//                           child: value
//                               ? Container(
//                                   color: Colors.black.withValues(alpha: 0.15),
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                   alignment: Alignment.center,
//                                   child: CircularProgressIndicator.adaptive(),
//                                 )
//                               : const SizedBox.shrink(),
//                         );
//                       },
//                     ),

//                     if (_videoKey.currentState?.isFullscreen() == true)
//                       FullScreenActions(onExit: () => _videoKey.currentState?.exitFullscreen()),
//                   ],
//                 ),
//               ),
//             ),
//           };
//         },
//       ),
//     );
//   }

//   Widget _wrapWithInteractiveViewer(Widget child) {
//     if (!widget.enableZoom) return child;

//     return InteractiveViewer(
//       minScale: 0.1,
//       maxScale: 16.0,
//       transformationController: _zoomController,
//       child: child,
//     );
//   }

//   Widget _buildError() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox(height: 14),
//         Icon(Icons.error, color: Colors.red, size: 36),
//         SizedBox(height: 6),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18),
//           child: Text(
//             'Có lỗi xảy ra trong quá trình tải bản ghi',
//             style: AppTypography.style(13, color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPlaybackStatus() {
//     return ValueListenableBuilder(
//       valueListenable: _status,
//       builder: (context, status, child) {
//         if (status == PlayerStatus.playing) return const SizedBox.shrink();

//         return InkWell(
//           onTap: togglePlay,
//           child: Container(
//             alignment: Alignment.center,
//             color: Colors.black.withValues(alpha: 0.25),
//             child: SvgPicture.asset(
//               AppAssets.icPlay,
//               width: 60,
//               height: 60,
//               colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildNoPlayback() {
//     return Center(
//       child: Text(
//         'Không có dữ liệu bản ghi',
//         style: AppTypography.style(13, color: Colors.white, fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }
